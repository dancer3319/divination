<?php
/**
 * QQ登录
 */
class qqlogin {

//高级功能-》开发者模式-》获取

  /**
   * 获取微信授权链接
   *
   * @param string $redirect_uri 跳转地址
   * @param mixed $state 参数
   */
  public static  function get_code_url($app_id,$redirect_uri,$state)
  {	
	
    $redirect_uri = urlencode($redirect_uri);
    $url="https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id={$app_id}&redirect_uri={$redirect_uri}&response_type=code&scope=snsapi_base&state={$state}#wechat_redirect";
    header("location:".$url);
    
  }
   public static  function loginqq_ip() {
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
  public static  function login($app_id,$app_secret,$my_url,$reg_jf=0,$code)
  {	

      //拼接URL
      $token_url = "https://graph.qq.com/oauth2.0/token?grant_type=authorization_code&"
         . "client_id=" . $app_id . "&redirect_uri=" . urlencode($my_url)
         . "&client_secret=" . $app_secret . "&code=" . $code;
      $response = file_get_contents($token_url);
      if (strpos($response, "callback") !== false)//如果登录用户临时改变主意取消了，返回true!==false,否则执行step3
      {
         $lpos = strpos($response, "(");
         $rpos = strrpos($response, ")");
         $response = substr($response, $lpos + 1, $rpos - $lpos -1);
         $msg = json_decode($response);
         if (isset($msg->error))
         {
            /*echo "<h3>error:</h3>" . $msg->error;
            echo "<h3>msg :</h3>" . $msg->error_description;*/
            echo "非法操作，请重新登录！";
            header("location:http://".$_SERVER['HTTP_HOST']."/?ac=userlogin");
         }
      }

      //Step3：使用Access Token来获取用户的OpenID
      $params = array();
      parse_str($response, $params);//把传回来的数据参数变量化
      $graph_url = "https://graph.qq.com/oauth2.0/me?access_token=".$params['access_token'];
      $str = file_get_contents($graph_url);
      if (strpos($str, "callback") !== false)
      {
         $lpos = strpos($str, "(");
         $rpos = strrpos($str, ")");
         $str = substr($str, $lpos + 1, $rpos - $lpos -1);
      }
      $user = json_decode($str);//存放返回的数据 client_id ，openid
      if (isset($user->error))
      {
         /*echo "<h3>error:</h3>" . $user->error;
         echo "<h3>msg :</h3>" . $user->error_description;
         exit;*/
         echo "非法操作，请重新登录！";
         header("location:http://".$_SERVER['HTTP_HOST']."/?ac=userlogin");
      }
      //Step4：使用access_token来获取所接受的用户信息。
      $user_data_url = "https://graph.qq.com/user/get_user_info?access_token={$params['access_token']}&oauth_consumer_key={$app_id}&openid={$user->openid}&format=json";

      $user_data = file_get_contents($user_data_url);//此为获取到的user信息

      $user_data = json_decode($user_data, true);
      $user_data['openid'] = $user->openid;
      $user_into = array();
	  
      $member_u = db::fetch_one(db::query("SELECT count(*) as num FROM `users` WHERE `user_name` = '".$user_data['openid']."'"));
      if($member_u['num']<1 && $user_data['openid']){ 
     
		  if($_COOKIE["dl"]!=''){
				$user_into['sd_uid']=$_COOKIE["dl"];
			}
		$user_into['class']=3;
		$user_into['regtime']=time();
		$user_into['regip']=self::loginqq_ip();
		$user_into['user_name']=$user_data['openid'];
		$user_into['nickname']=$user_data["nickname"];
		$user_into['headimgurl']=$user_data["figureurl_qq_2"];
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
		$sql_count="SELECT count(*) as csum FROM `ffsm_jflog` WHERE `type`=101 and  `ip` = '".self::loginqq_ip()."' and `time`>".$star_time;
		$jklog_count = db::queryone($sql_count);
		if($_COOKIE['dl']>0 && $jf_sys_on==1 && $jklog_count['csum']<$jf_sys_yqci){
			$data['uid']=$_COOKIE['dl'];
			$data['ext']=$jf_sys_yqzc;
			$data['type']=101;//邀请注册
			$data['class']=2;
			$data['ip']=self::loginqq_ip();
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
	  $expire=time()+60*60*24*30;
	  setcookie("user_name", $user_data['openid'], $expire,'/');
      header("location:http://".$_SERVER['HTTP_HOST']."/?ac=member");
   
    
  }
  
}


