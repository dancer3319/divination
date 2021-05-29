<?php
/**
 * 微信授权相关接口
 */

class Wechat {

//高级功能-》开发者模式-》获取

  /**
   * 获取微信授权链接
   *
   * @param string $redirect_uri 跳转地址
   * @param mixed $state 参数 snsapi_base snsapi_userinfo
   */
  public static  function get_authorize_url($app_id,$redirect_uri,$state)
  {	
	
    $redirect_uri = urlencode(urldecode($redirect_uri));
    $url="https://open.weixin.qq.com/connect/oauth2/authorize?appid={$app_id}&redirect_uri={$redirect_uri}&response_type=code&scope=snsapi_userinfo&state={$state}#wechat_redirect";
    header("location:".$url);
    
  }
  /**
   * 获取授权token
   *
   * @param string $code 通过get_authorize_url获取到的code
   */
  public static function get_access_token($app_id,$app_secret,$code)
  {
    $token_url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid={$app_id}&secret={$app_secret}&code={$code}&grant_type=authorization_code";
    $token_data = self::http($token_url,'', '',array(), false);


    if($token_data[0] == 200)
    {
      return json_decode($token_data[1], TRUE);
    }

    return FALSE;
  }

  /**
   * 获取授权后的微信用户信息
   *
   * @param string $access_token
   * @param string $open_id
   */
  public static  function get_user_info($access_token,$open_id)
  {
    if($access_token && $open_id)
    {
      $info_url = "https://api.weixin.qq.com/sns/userinfo?access_token={$access_token}&openid={$open_id}&lang=zh_CN";
      $info_data = self::http($info_url,'', '', array(), false);

      if($info_data[0] == 200)
      {
        return json_decode($info_data[1], TRUE);
      }
    }

    return FALSE;
  }
  public static  function login_ip() {
		 if(getenv('HTTP_CLIENT_IP') && strcasecmp(getenv('HTTP_CLIENT_IP'), 'unknown')) {
			 $ip = getenv('HTTP_CLIENT_IP');
		 } elseif(getenv('HTTP_X_FORWARDED_FOR') && strcasecmp(getenv('HTTP_X_FORWARDED_FOR'), 'unknown')) {
			 $ip = getenv('HTTP_X_FORWARDED_FOR');
		 } elseif(getenv('REMOTE_ADDR') && strcasecmp(getenv('REMOTE_ADDR'), 'unknown')) {
			 $ip = getenv('REMOTE_ADDR');
		 } elseif(isset($_SERVER['REMOTE_ADDR']) && $_SERVER['REMOTE_ADDR'] && strcasecmp($_SERVER['REMOTE_ADDR'], 'unknown')) {
			 $ip = $_SERVER['REMOTE_ADDR'];
		 }
		 return preg_match ( '/[\d\.]{7,15}/', $ip, $matches ) ? $matches [0] : '';
	}
  public static function dl_findNumc($str){
			if(is_numeric($str)){
              $result=$str;
            }else{
              $result=0;
            }
      return $result;

      }
  public static function user_login($app_id,$app_secret,$reg_jf=0,$code) {
	  
			$token_data=self::get_access_token($app_id,$app_secret,$code);
			if($token_data[access_token]){
				$user_info=self::get_user_info($token_data[access_token],$token_data[openid]);
				if($user_info['openid']){
					//查询是否有已经注册过
					$member_u = db::fetch_one(db::query("SELECT count(*) as num FROM `users` WHERE `user_name` = '".$user_info['openid']."'"));
					if($member_u['num']<1 && $user_info['openid']){ 
						//存入用户信息
                      if($_COOKIE["dl"]!=''){
							$user_into['sd_uid']=self::dl_findNumc($_COOKIE["dl"]);
						}
                      
                       
						$user_into['class']=2;
						$user_into['regtime']=time();
						$user_into['regip']=self::login_ip();
						$user_into['user_name']=$user_info['openid'];
                     	$user_into['nickname']=$user_info['nickname'];
						$user_into['headimgurl']=$user_info['headimgurl'];
                        $user_into['pools']='admin';
                        $user_into['integral']=0;
                        $user_into['groups']='admin_test';
						
					$jf_sys= db::querylist("SELECT * FROM `system` WHERE `class` = 4");
						foreach($jf_sys as $key_sy=>$var_sy){
							if($var_sy['name']=='tjex_on'){
								$jf_sys_on=$var_sy['config'];
							}
							if($var_sy['name']=='tjex_fwci'){
								$jf_sys_fwci=$var_sy['config'];
							}
							if($var_sy['name']=='tjex_yqci'){
								$jf_sys_yqci=$var_sy['config'];
							}
							if($var_sy['name']=='tjex_yqzc'){
								$jf_sys_yqzc=$var_sy['config'];
							}
							if($var_sy['name']=='reg_jf'){
								$jf_reg_jf=$var_sy['config'];
							}
						}
						$star_time=time()-8400;
						$sql_count="SELECT count(*) as csum FROM `ffsm_jflog` WHERE `type`=101 and  `ip` = '".self::login_ip()."' and `time`>".$star_time;
						$jklog_count = db::queryone($sql_count);
						if($_COOKIE['dl']>0 && $jf_sys_on==1 && $jklog_count['csum']<$jf_sys_yqci){
							$data['uid']=$_COOKIE['dl'];
							$data['ext']=$jf_sys_yqzc;
							$data['type']=101;//邀请注册
							$data['class']=2;
							$data['ip']=self::login_ip();
							$data['time']=time();
							db::insert('ffsm_jflog', $data);
							db::query("UPDATE `users` SET `integral` = `integral` + '".$data['ext']."'  WHERE `uid` = '".$data['uid']."' limit 1");
						}
						$reg_uid=db::insert('users',$user_into);
						$data_reg['uid']=$reg_uid;
						$data_reg['ext']=$jf_reg_jf;
						$data_reg['type']=103;//注册积分
						$data_reg['class']=2;
						$data_reg['ip']=util::get_client_ip();
						$data_reg['time']=time();
						db::insert('ffsm_jflog', $data_reg);
						db::query("UPDATE `users` SET `integral` = `integral` + '".$data_reg['ext']."'  WHERE `uid` = '".$data_reg['uid']."' limit 1");
					}
					//存入cookie
					$expire=time()+60*60*24*30;
					setcookie("user_name", $user_info['openid'], $expire,'/');
                  	setcookie("usermore", 1, $expire,'/');
                 
				}
				
			}else{
				echo "未获取到access_token";
			}
		
    }

  public static function http($url, $method, $postfields = null, $headers = array(), $debug = false)
  {
    $ci = curl_init();
    /* Curl settings */
    curl_setopt($ci, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
    curl_setopt($ci, CURLOPT_CONNECTTIMEOUT, 30);
    curl_setopt($ci, CURLOPT_SSL_VERIFYPEER, FALSE);
    curl_setopt($ci, CURLOPT_SSL_VERIFYHOST, FALSE);
    curl_setopt($ci, CURLOPT_TIMEOUT, 30);
    curl_setopt($ci, CURLOPT_RETURNTRANSFER, true);

    switch ($method) {
      case 'POST':
        curl_setopt($ci, CURLOPT_POST, true);
        if (!empty($postfields)) {
          curl_setopt($ci, CURLOPT_POSTFIELDS, $postfields);
          $this->postdata = $postfields;
        }
        break;
    }
    curl_setopt($ci, CURLOPT_URL, $url);
    curl_setopt($ci, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ci, CURLINFO_HEADER_OUT, true);

    $response = curl_exec($ci);
    $http_code = curl_getinfo($ci, CURLINFO_HTTP_CODE);

    if ($debug) {
      echo "=====post data======\r\n";
      var_dump($postfields);

      echo '=====info=====' . "\r\n";
      print_r(curl_getinfo($ci));

      echo '=====$response=====' . "\r\n";
      print_r($response);
    }
    curl_close($ci);
    return array($http_code, $response);
  }

}


