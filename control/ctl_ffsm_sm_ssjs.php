<?php
if( !defined('CORE') ) exit('Request Error!');

class ctl_ffsm_sm_ssjs
{
	public static $userinfo;
	public static $control;
  	public $http_type;
	public $cache_enable = true;//缓存开关,调试时可设为false
	public $cachetime    = 7200;//缓存时间,秒(注意:内容页缓存是单独的在video_view中设置)
	public $cache_prefix = '2021sm.xlibbs.com';
	public $cache_key    = 'h5_index/index';
	public $str_where_ext = '`status`!=9';
	public function __construct()
	{
		$this->http_type = ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') || (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https')) ? 'https://' : 'http://';
        $return_url=urlencode($this->http_type .$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']);
		tpl::assign('return_url',$return_url);
		
      	if( strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false &&  $_COOKIE["user_name"]=="" && $_COOKIE["usermore"]=="" ) {
			$this->wxlogin($return_url);//微信自动登陆
		}
		if( strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false) {
			tpl::assign('wxopen',1);//判断是否微信打开
		}
        if($_COOKIE["dl"]>0){
          	tpl::assign('dl_ids',$_COOKIE["dl"]);
        }else{
            $isloguids=$this->isloguid();
            if($isloguids>0 ){
              $expires=time()+60*60*12;//半天
              setcookie("dl", $isloguids, $expires,'/');
              tpl::assign('dl_ids',$isloguids);
            }
        }
        if(empty($_COOKIE['user_name'])){
          	tpl::assign('nologin',1);
        }
		
		$weixintps = $GLOBALS['config']['money']['weixintp'];
		tpl::assign('weixintp',$weixintps);
		$dibuxinxis = $GLOBALS['config']['money']['dibuxinxi'];
		tpl::assign('dibuxinxi',$dibuxinxis);
		$weixinhaos = $GLOBALS['config']['money']['weixinhao'];
		tpl::assign('weixinhao',$weixinhaos);
		$zhanmings = $GLOBALS['config']['money']['zhanming'];
		tpl::assign('zhanming',$zhanmings);
		$gundongs = $GLOBALS['config']['money']['gundong'];
		tpl::assign('gundong',$gundongs);
		$shouyedbs = $GLOBALS['config']['money']['shouyedb'];
		tpl::assign('shouyedb',$shouyedbs);
		$lianxifss = $GLOBALS['config']['money']['lianxifs'];
		tpl::assign('lianxifs',$lianxifss);
		$tongjidms = $GLOBALS['config']['money']['tongjidm'];
		tpl::assign('tongjidm',$tongjidms);
		$sql = 'select * from `system`';
        $row = db::querylist($sql);
		foreach($row as $k=>$v){
			$this->money[$v['name']] = $v['config'];
		}
		
		if (empty($this->items))
		{
			$this->items = new items();
		}
		tpl::assign('web_url',URL);
		//获取广告
		//$this->getAd();
		$public_hand_data_cache = cache::get($this->cache_prefix,'public_hand_data');
		if($public_hand_data_cache==''){
			$public_hand_data = mod_index::get_public_hand();//获取公用部分手动数据
			cache::set($this->cache_prefix,'public_hand_data',$public_hand_data,$this->cachetime); //写缓存
		}else{
			$public_hand_data = $public_hand_data_cache;//获取公用部分手动数据
		}
		tpl::assign('public_hand_data',$public_hand_data);
		if(isset($_SERVER['REQUEST_URI']) && false !== stripos($_SERVER['REQUEST_URI'],'clearcache')){
			$this->cache_enable = false;
		}
		$jssdk = new mod_wxshare(WX_APPID,WX_APPSECRET);
		$signPackage = $jssdk->GetSignPackage();
        tpl::assign('sh_title',"真人在线算命2021年事业财运详解、塔罗运势占卜分析");
        tpl::assign('sh_desc','揭开隐藏在你生命中的运势密码，感情事业财运，你和他能不能走到最后。');
        tpl::assign('sh_img',"http://".$_SERVER['HTTP_HOST']."/statics/img/logo_12.png");
        tpl::assign('sh_url',$this->dl_url($this->http_type.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']));
        tpl::assign('signPackage',$signPackage);
        $sys_pay_type=db::queryone("SELECT * FROM `system` WHERE `name` = 'pay_type'");
        tpl::assign('sys_pay_type',$sys_pay_type['config']);
        
        $jf_sys_ons = db::get_one("SELECT * FROM `system` WHERE `name` = 'tjex_on' AND `class` = 4");
		tpl::assign('jf_sys_on',$jf_sys_ons['config']);
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
			if($var_sy['name']=='tjex_fwjf'){
				$jf_sys_fwjf=$var_sy['config'];
			}
		}
		$star_time=time()-8400;
		$sql_count="SELECT count(*) as csum FROM `ffsm_jflog` WHERE `type`=102 and `ip` = '".util::get_client_ip()."' and `time`>".$star_time;
		$jklog_count = db::queryone($sql_count);

		if($this->findNumc($_COOKIE['dl'])>0 && $jf_sys_ons['config']==1 && $jklog_count['csum']<$jf_sys_yqci && empty($_COOKIE['fwjf'])){
			$expires=time()+60*60*12;//半天
			setcookie("fwjf", $expires, $expires,'/');
			$data_fx['uid']=$this->findNumc($_COOKIE['dl']);
			$data_fx['ext']=$jf_sys_fwjf;
			$data_fx['type']=102;//分享访问
			$data_fx['class']=3;
			$data_fx['ip']=util::get_client_ip();
			$data_fx['time']=time();
			db::insert('ffsm_jflog', $data_fx);
			db::query("UPDATE `users` SET `integral` = `integral` + '".$data_fx['ext']."'  WHERE `uid` = '".$data_fx['uid']."' limit 1");
		}
		$vip_on = db::get_one("SELECT * FROM `system` WHERE `name` = 'vip_on' AND `class` = 5");
		tpl::assign('vip_on',$vip_on['config']);
		
		$today = date('Y-n-j');
		$y = req::item('y');$n = req::item('n');$j = req::item('j');
        $date = req::item('date');
		if($date==''){
			$date = $today;
			if($y!=''){
				$date = $y.'-'.$n.'-'.$j;
			}
		}else{//post的date
			$seo['title'] = $date.'黄历，'.$date.'财神方位，'.$date.'宜忌择日';
			tpl::assign('seo',$seo);
		}
        if(!preg_match('/^(\d{4})\-(\d{1,2})\-(\d{1,2})$/', $date, $_date) || !checkdate((int)$_date[2], (int)$_date[3], (int)$_date[1]))
        {
            $date = $today;
        }
        $time = strtotime($date);
        $date = date('Y-n-j', $time);
		$y = date('Y', $time);$n = date('n', $time);$j = date('j', $time);$m = date('m', $time);$d = date('d', $time);
		$ymd_arr = self::get_ymd($y,$n,$j);
		tpl::assign('ymd_arr',$ymd_arr);
        $history_date = date('n/j', $time);
        $prev_date = date('Y-n-j', strtotime('-1 day', $time));
        $next_date = date('Y-n-j', strtotime('+1 day', $time));
      	$hdjr=self::get_hdjr($date);
      $ddd1=date('Y-m', time());
       $ddd=date('d', time());
      $weekarray=array("日","一","二","三","四","五","六"); //先定义一个数组
      $ddd2="星期".$weekarray[date("w")];
      $ddd3=explode(' ',$hdjr['nongli']); 
      $hdjr['ddd1']=$ddd1;
      $hdjr['ddd']=$ddd;
      $hdjr['ddd2']=$ddd2;
     $hdjr['ddd3']=$ddd3[0];
        $shengxiao = mb_substr(trim($hdjr['suici']), -1, 1, 'UTF-8');
        tpl::assign('hdjr',$hdjr);
		//客服链接
      	tpl::assign('kf_link',"");
	}
  	public function cccookie($label,$value,$ccdate){
		$expire=time()+$ccdate;
		setcookie($label, $value, $expire,'/');
	}
	//分享dl处理
   public function dl_url($url){
      	if($_COOKIE["dl"]>0 && strpos("$url","dl=") === false){
          if(strpos($url,"?")>0){
            	$data=$url."&".$_COOKIE["dl"];
          }else{
            	$data=$url."?".$_COOKIE["dl"];
          }
        }else{
          $data=$url;
        }
		return $data;
    }
  	public function wxlogin($autologin){
			if($autologin){
				$this->cccookie('autologin',$autologin,60*60*24*180);
			}
      
			if(Login::isLoggedin()){
              header("location:".$this->http_type.$_SERVER['HTTP_HOST']."/?ac=member");
              exit();
             }else{
              		$app_id = WX_APPID; //公众号appid
 					$app_secret = WX_APPSECRET; 
                    if($autologin){
                      $redirect_uri = $autologin;
                    }else{
                      $this->http_type = ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') || (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https')) ? 'https://' : 'http://';
                      $redirect_uri = $this->http_type.$_SERVER['HTTP_HOST']."/?ac=wxlogin"; //授权之后跳转地址
                    }
					
                    $code=req::item('code');
                    $state=req::item('state');
                   if($code && $state=="wxlogin"){
                      Wechat::user_login($app_id,$app_secret,$GLOBALS['config']['money']['reg_jf'],$code);
                     if($_COOKIE["return_url"]){
                       $wxlogrul=urldecode($_COOKIE["return_url"]);
                     }elseif($_COOKIE["autologin"]){
                       $wxlogrul=urldecode($_COOKIE["autologin"]);
                     }else{
                       $wxlogrul=$this->http_type.$_SERVER['HTTP_HOST']."/?ac=member";
                     }
                      header("location:".$wxlogrul);
                      exit();
                  }else{
                     Wechat::get_authorize_url($app_id,$redirect_uri,"wxlogin");
                  }
             }
    }
    public function xmfx2(){
                $tpl     = 'ffsm/xmfx2.tpl';
                        $content = tpl::fetch($tpl);
                        exit($content);
    }
	/**
	 *首页
	 */
	public function index()
	{
		$content      = array();
		if($this->cache_enable)
		{
			$content = cache::get($this->cache_prefix,'index');
		}
        $content = '';
		if(empty($content))
		{
			$hand_type_arr = array('index_test');//手动数据
			$handtype_arr = $this->items->getHandTypeId($hand_type_arr);
			$mixdata = $this->items->get_attay_hand_data($handtype_arr);
			tpl::assign('m', $mixdata);//<--END 手动数据
			$zgjm_new_data = mod_index::get_data('zgjm_data','',1,18);
			tpl::assign('zgjm_new_data',$zgjm_new_data);
			$seo['title'] = '免费算命的网站_免费算命_生辰八字算命_八字算命_周易算命_算卦在线算命丨易读网';
			$seo['keywords'] = '免费算命,易读网,算命网,算命街,周易算命,八字算命,免费算命网站';
			$seo['description'] = '免费算命网站-易读网提供:免费算命,姓名测试,周易,生辰八字算命,四柱算命预测,算卦,黄道吉日查询,抽签算命,生肖算命,在线排盘和趣味测试等在线免费算命内容！';
			tpl::assign('seo',$seo);
			$tpl     = 'ffsm/index.tpl';
			$content = tpl::fetch($tpl);
			//cache::set($this->cache_prefix,'index',$content,$this->cachetime); //写缓存
			//cache::set_cache_list($this->cache_prefix,'index');
		}
      $today = date('Y-n-j');
		$y = req::item('y');$n = req::item('n');$j = req::item('j');
        $date = req::item('date');
		if($date==''){
			$date = $today;
			if($y!=''){
				$date = $y.'-'.$n.'-'.$j;
			}
		}else{//post的date
			$seo['title'] = $date.'黄历，'.$date.'财神方位，'.$date.'宜忌择日';
			tpl::assign('seo',$seo);
		}
        if(!preg_match('/^(\d{4})\-(\d{1,2})\-(\d{1,2})$/', $date, $_date) || !checkdate((int)$_date[2], (int)$_date[3], (int)$_date[1]))
        {
            $date = $today;
        }
        $time = strtotime($date);
        $date = date('Y-n-j', $time);
		$y = date('Y', $time);$n = date('n', $time);$j = date('j', $time);$m = date('m', $time);$d = date('d', $time);
		$ymd_arr = self::get_ymd($y,$n,$j);
		tpl::assign('ymd_arr',$ymd_arr);
        $history_date = date('n/j', $time);
        $prev_date = date('Y-n-j', strtotime('-1 day', $time));
        $next_date = date('Y-n-j', strtotime('+1 day', $time));
      	$hdjr=self::get_hdjr($date);
      $ddd1=date('Y-m', time());
       $ddd=date('d', time());
      $weekarray=array("日","一","二","三","四","五","六"); //先定义一个数组
      $ddd2="星期".$weekarray[date("w")];
      $ddd3=explode(' ',$hdjr['nongli']); 
      $hdjr['ddd1']=$ddd1;
      $hdjr['ddd']=$ddd;
      $hdjr['ddd2']=$ddd2;
     $hdjr['ddd3']=$ddd3[0];
        $shengxiao = mb_substr(trim($hdjr['suici']), -1, 1, 'UTF-8');
        tpl::assign('hdjr',$hdjr);
       $tpl     = 'ffsm/index.tpl';
        $content = tpl::fetch($tpl);
		exit($content);
	}
  public static function get_hdjr($date)
	{
        // 取缓存
        if($data = self::get_cache($date, 1))
        {
            return $data;
        }
		$url = "http://management.leun.ltd/?ct=api&ac=huangli_ajax&type=".$date;
		$data =file_get_contents($url);
		$data = json_decode($data,true);
        if (empty($data)) return false;
        if ($data)
        {
            $cache_path = PATH_DATA.'/db/nongli/'.substr($date, 0, 4);
            $handle = put_file($cache_path.'/'.$date.'_hdjr.txt', serialize($data));
            if($handle === false)
            {
                self::log('无法写入'.$date);
            }
        }
        return $data;
	}
  public function findNumc($str){
			if(is_numeric($str)){
              $result=$str;
            }else{
              $result=0;
            }
      return $result;
      }
  /**
	 * 读缓存
	 *
	 * @param  string $date   1999-9-9
	 * @param  int $type_id   1
	 * @return array
	 */
	public static function get_cache($date, $type_id = 1, $sth = '')
	{
        $types = array(1 => 'hdjr', 2 => 'scgj', 3 => $sth);
        $cache_path = PATH_DATA.'/db/nongli/'.substr($date, 0, 4).'/'.$date.'_'.$types[$type_id].'.txt';
        if(is_file($cache_path))
        {
            $content = file_get_contents($cache_path);
            $content = unserialize($content);
            return $content;
        }
        return false;
	}
  public function get_ymd($caisy,$caism,$caisd){
		//年份
		for($yi=1912;$yi<2021;$yi++){
			if($caisy==$yi){
			$ynian.='<option value="'.$yi.'" selected="selected">'.$yi.'</option>';
			}else{
				$ynian.='<option value="'.$yi.'">'.$yi.'</option>';
			}
		}
		//月份
		$yyue='';
		for($yi=1;$yi<13;$yi++){
			if($yi==$caism){
				$yyue.='<option value="'.$yi.'" selected="selected">'.$yi.'</option>';
			}else{
				$yyue.='<option value="'.$yi.'">'.$yi.'</option>';
			}
		}
		//日子
		$rri='';
		for($yi=1;$yi<32;$yi++){
			if($yi==$caisd){
				$rri.='<option value="'.$yi.'" selected="selected">'.$yi.'</option>';
			}else{
				$rri.='<option value="'.$yi.'">'.$yi.'</option>';
			}
		}
		$ymd_arr = array('y'=>$ynian,'m'=>$yyue,'d'=>$rri);
		return $ymd_arr;
	}
	//结算分销
	public function dl_js($row = array()){
			if($row['uid']!='' && $row['status']==1 && $row['dl_status']!=1){
				db::query('UPDATE `ffsm_orders` SET `dl_status` = 1 WHERE `id` = '.$row['id'].' and `status` = 1 and `dl_status` = 0');
				$up_num=db::affected_rows();
				if($up_num){
					$user_fxjf=array();
				   db::query("UPDATE `users` SET `dl_syjf` = `dl_syjf` + '".$row['dl_money']."' , `dl_zjf` = `dl_zjf` +  '".$row['dl_money']."'  WHERE `uid` = '".$row['uid']."' limit 1");
				   //查询上级uid
					$re_result = db::get_one("select * from `users` where `uid`='".$row['uid']."'");
					if($re_result['sd_uid']>0){
					$re_money=round($row['money']*$GLOBALS['config']['money']['twoclass']/100,2);
					db::query("UPDATE `users` SET `dl_syjf` = `dl_syjf` + '".$re_money."' , `dl_zjf` = `dl_zjf` +  '".$re_money."'  WHERE `uid` = '".$re_result['sd_uid']."' limit 1");
					$user_fxjf['re_uid']=$re_result['sd_uid'];
					$user_fxjf['re_jf']=$re_money;
						//查询上上级uid
					   $top_result = db::get_one("select * from `users` where `uid`='".$re_result['sd_uid']."'");
					   if($top_result['sd_uid']>0){
						$top_money=round($row['money']*$GLOBALS['config']['money']['threeclass']/100,2);
						db::query("UPDATE `users` SET `dl_syjf` = `dl_syjf` + '".$top_money."' , `dl_zjf` = `dl_zjf` +  '".$top_money."'  WHERE `uid` = '".$top_result['sd_uid']."' limit 1");
						$user_fxjf['top_uid']=$top_result['sd_uid'];
						$user_fxjf['top_jf']=$top_money;
					   }
					}
					$user_fxjf['oid']=$row['oid'];
					$user_fxjf['sf_uid']=$row['uid'];
					$user_fxjf['sf_jf']=$row['dl_money'];
					$user_fxjf['jftime']=time();
					db::insert('ffsm_dl_fxjf',$user_fxjf);
				}
			}
	}
	//获取当前登录uid
	public function isloguid(){
		if($_COOKIE['user_name']){
			$query="select * from `users` where `user_name`='".$_COOKIE['user_name']."'";
			$result = db::get_one($query);
		}else{
			return "";
		}
		return $result['uid'];
	}
  
  private function public_sm($cookies){
        $jmsh['jin'] = mod_suanming::howstring($cookies['wh'],'金');
        $jmsh['mu'] = mod_suanming::howstring($cookies['wh'],'木');
        $jmsh['shui'] = mod_suanming::howstring($cookies['wh'],'水');
        $jmsh['huo'] = mod_suanming::howstring($cookies['wh'],'火');
        $jmsh['tu'] = mod_suanming::howstring($cookies['wh'],'土');
        $wharr = mod_suanming::whwq($jmsh['jin'],$jmsh['mu'],$jmsh['shui'],$jmsh['huo'],$jmsh['tu']);
        //同类异类五行
        $sql="select * from `sm_wh` where wh='".$cookies['wh'][4]."'";
        $tywh = db::queryone($sql);
        //纳音
        $sql='select * from `sm_jiazi` where jiazi="'.$cookies['bazi'][0].$cookies['bazi'][1].'"';
        $nayin[]=db::queryone($sql);
        $sql2='select * from `sm_jiazi` where jiazi="'.$cookies['bazi'][2].$cookies['bazi'][3].'"';
        $nayin[]=db::queryone($sql2);
        $sql3='select * from `sm_jiazi` where jiazi="'.$cookies['bazi'][4].$cookies['bazi'][5].'"';
        $nayin[]=db::queryone($sql3);
        $sql4='select * from `sm_jiazi` where jiazi="'.$cookies['bazi'][6].$cookies['bazi'][7].'"';
        $nayin[]=db::queryone($sql4);
        //生肖个性
        $sql="select * from `sm_sxgx` where sx='".$cookies['sx']."'";
        $sxgx=db::queryone($sql);
        //节气
        $solarTerm =array("小寒","大寒 ","立春","雨水 ","惊蛰","春分 ","清明","谷雨 ","立夏","小满 ","芒种","夏至 ","小暑","大暑 ","立秋","处暑 ","白露","秋分 ","寒露","霜降 ","立冬","小雪 ","大雪","冬至 ");
        eregi("(.*)/(.*)", $cookies['jieqi']['term1'],$zc_1);
        $zc1 = $solarTerm[$zc_1[1]].$zc_1[2];
        eregi("(.*)/(.*)", $cookies['jieqi']['term2'], $zc_2);
        $zc2 = $solarTerm[$zc_2[1]].$zc_2[2];
        $info['jmsh'] = $jmsh;
        $info['wharr'] = $wharr;
        $info['tywh'] = $tywh;
        $info['nayin'] = $nayin;
        $info['sxgx'] = $sxgx;
        return $info;
    }
  public function splitName($fullname){ 
     $hyphenated = array('欧阳','太史','端木','上官','司马','东方','独孤','南宫','万俟','闻人','夏侯','诸葛','尉迟','公羊','赫连','澹台','皇甫', 
        '宗政','濮阳','公冶','太叔','申屠','公孙','慕容','仲孙','钟离','长孙','宇文','城池','司徒','鲜于','司空','汝嫣','闾丘','子车','亓官', 
        '司寇','巫马','公西','颛孙','壤驷','公良','漆雕','乐正','宰父','谷梁','拓跋','夹谷','轩辕','令狐','段干','百里','呼延','东郭','南门', 
        '羊舌','微生','公户','公玉','公仪','梁丘','公仲','公上','公门','公山','公坚','左丘','公伯','西门','公祖','第五','公乘','贯丘','公皙', 
        '南荣','东里','东宫','仲长','子书','子桑','即墨','达奚','褚师'); 
        $vLength = mb_strlen($fullname, 'utf-8'); 
        $lastname = ''; 
        $firstname = '';//前为姓,后为名 
        if($vLength > 2){ 
            $preTwoWords = mb_substr($fullname, 0, 2, 'utf-8');//取命名的前两个字,看是否在复姓库中 
            if(in_array($preTwoWords, $hyphenated)){ 
                $lastname = $preTwoWords; 
                $firstname = mb_substr($fullname, 2, 10, 'utf-8'); 
            }else{ 
                $lastname = mb_substr($fullname, 0, 1, 'utf-8'); 
                $firstname = mb_substr($fullname, 1, 10, 'utf-8'); 
            } 
        }else if($vLength == 2){//全名只有两个字时,以前一个为姓,后一下为名 
            $lastname = mb_substr($fullname ,0, 1, 'utf-8'); 
            $firstname = mb_substr($fullname, 1, 10, 'utf-8'); 
        }else{ 
            $lastname = $fullname; 
        } 
        return array($lastname, $firstname); 
	}
	//错误返回
	public function error_bc($tit,$url,$tip) {
			tpl::assign('err_log',$tit);
			tpl::assign('err_url',$url);
			tpl::assign('err_tip',$tip);
			$tpl     = 'ffsm/error_bc.tpl';
			$content = tpl::fetch($tpl);
			exit($content);
	}
	//修改时辰
	public function xg_hour($oid,$modhour) {
			$row = mod_order::get_order($oid);
			$row['data'] = json_decode(urldecode($row['data']),true);
			$row['data']['h']=$modhour;
			$nli_arr=["00:00-00:59早子", "01:00-01:59丑", "02:00-02:59丑", "03:00-03:59寅", "04:00-04:59寅", "05:00-05:59卯", "06:00-06:59卯", "07:00-07:59辰", "08:00-08:59辰", "09:00-09:59巳", "10:00-10:59巳", "11:00-11:59午", "12:00-12:59午", "13:00-13:59未", "14:00-14:59未", "15:00-15:59申", "16:00-16:59申", "17:00-17:59酉", "18:00-18:59酉", "19:00-19:59戌", "20:00-20:59戌", "21:00-21:59亥", "22:00-22:59亥", "23:00-23:59晚子"];
			$lz1=$row['data']['lDate'];
			$lDate_arr=spliti(' ',$row['data']['lDate']);
			$row['data']['lDate']=$lDate_arr[0]." ".$nli_arr[$modhour]."时";
			
			mod_order::up_order(array('data'=>urlencode(json_encode($row['data']))), 'oid=' . $oid);
			exit(json_encode(array('code'=>200,'message'=>'修改时辰成功')));
	}
	public function my_order(){
		
		if($this->isloguid()>0){
          $sscy_order=db::querylist("SELECT * FROM `ffsm_orders` WHERE `type` >= 301 AND `type` < 400 AND `pay_uid` = '".$this->isloguid()."' AND  `status`=1  ORDER BY `id` DESC");       
         foreach($sscy_order as $k=>$v){
                  $sscy_orders[$m]['oid']=$v['oid'];
                  $sscy_orders[$m]['money']=$v['money'];
                  $sscy_orders[$m]['data']=json_decode(urldecode($v['data']),true);
                  $sscy_orders[$m]['createtime']=$v['createtime'];
                  $sscy_orders[$m]['endtime']=$v['createtime']+2*86400;
                  $sscy_orders[$m]['dqtime']=time();
                  $sscy_orders[$m]['typename']=mod_order::type_ssname($v['type']);
                  $sscy_orders[$m]['status']=$v['status'];
                    $ac=mod_order::typetochannel($v['type']);
                    $sscy_orders[$m]['url'] = "/?ac=".$ac."&oid=".$v['oid']."&token=".base64_encode(md5($v['oid']));
                      $m++;
                  }
          tpl::assign('my_order_num',count($sscy_orders));
          tpl::assign('my_order',$sscy_orders);
        } 
	 }
	//实时寻偶
    public function ssjs(){
		$ssysdata_auth = mod_ffsm_ssys::ssysdata_auth();
		if($ssysdata_auth['code']!=200){
			if(empty($ssysdata_auth['message'])){
				$ssysdata_auth['message']="发生未知错误";
			}
			$this->error_bc($ssysdata_auth['message'],'/','返回首页');
		}

      	$ssysdata_share = mod_ffsm_ssys::ssysdata_share(4); 
     	tpl::assign('sh_title',$ssysdata_share['msg']['title']);
        tpl::assign('sh_desc',$ssysdata_share['msg']['content']);
        tpl::assign('sh_img',$ssysdata_share['msg']['ico']);
        tpl::assign('sh_url',$this->dl_url($this->http_type.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']));
      	$this->my_order();
        $username = req::item('username');
        $gender = req::item('gender');
        $y = req::item('y');
        $m = req::item('m');
        $d = req::item('d');
        $h = req::item('h');
        $i = req::item('i');
        $cY = req::item('cY');
        $cM = req::item('cM');
        $cD = req::item('cD');
        $cH = req::item('cH');
        $term1 = req::item('term1');
        $term2 = req::item('term2');
        $start_term = req::item('start_term');
        $end_term = req::item('end_term');
        $start_term1 = req::item('start_term1');
        $end_term1 = req::item('end_term1');
        $lDate = req::item('lDate');
		$moneys = $GLOBALS['config']['money']['ssjs'];
		tpl::assign('money',$moneys);
		//第四方支付
     	$sys_pay_type=db::queryone("SELECT * FROM `system` WHERE `name` = 'pay_type'");
        tpl::assign('sys_pay_type',$sys_pay_type['config']);
        $oid = req::item('oid');

		if(is_numeric(req::item('modhour')) && req::item('modhour')<=23 && is_numeric($oid)){
			$this->xg_hour($oid,req::item('modhour'));
			
		}
        $token = req::item('token');
		$arrgs_a=array("甲"=>"bg_mu","乙"=>"bg_mu","丙"=>"bg_huo","丁"=>"bg_huo","戊"=>"bg_tu","己"=>"bg_tu","庚"=>"bg_jin","辛"=>"bg_jin","壬"=>"bg_shui","癸"=>"bg_shui");
		$arrzs_a=array("子"=>"sx_shu","丑"=>"sx_niu","寅"=>"sx_hu","卯"=>"sx_tu","辰"=>"sx_long","巳"=>"sx_she","午"=>"sx_ma","未"=>"sx_yang","申"=>"sx_hou","酉"=>"sx_ji","戌"=>"sx_gou","亥"=>"sx_zhu");
			
        if($username!=''){
			$dl_id = $_COOKIE["dl"];
            $pay_uid=$this->isloguid();
            $tcbl_row=db::get_one("SELECT * FROM `users` WHERE `uid` = '".$dl_id."'");
            if($tcbl_row['dl_tcbl']>0){
            $hdjf=round($moneys*$tcbl_row['dl_tcbl']/100,2);
            }else{
            $hdjf=round($moneys*$GLOBALS['config']['money']['oneclass']/100,2);
            }
            $oid = date('YmdGis').rand(1000000000, 15000000000);
            $des = $username.'的实时健身';
			
            $data = array('username'=>$username,'gender'=>$gender,'y'=>$y,'m'=>$m,'d'=>$d,'h'=>$h,'i'=>$i,'cY'=>$cY,'cM'=>$cM,'cD'=>$cD,'cH'=>$cH,'term1'=>$term1
            ,'term2'=>$term2,'start_term'=>$start_term,'end_term'=>$end_term,'start_term1'=>$start_term1,'end_term1'=>$end_term1,'lDate'=>$lDate);
            $datas = array('data'=>urlencode(json_encode($data)),'oid'=>$oid,'createtime'=>time(),'type'=>304,'ip'=>util::get_client_ip(),'des'=>$des,'money'=>$moneys,'pay_uid'=>$pay_uid,'uid'=>$dl_id,'dl_status'=>0,'dl_money'=>$hdjf);
            mod_order::add_order($datas);
            mod_order::set_history($oid);
            tpl::assign('oid',$oid);
			tpl::assign('oids',base64_encode(md5($oid)));
            tpl::assign('des',$des);
            
			$return = mod_ffsm_ssys::ssys($datas);

			$data['wx_col']=$arrgs_a[$return['user']['bazi'][0]];
			$data['sx_icon']=$arrzs_a[$return['user']['bazi'][1]];
			tpl::assign('names',$data);
          $tpl     = 'ffsm/ssjs/order.tpl';
        }elseif($oid!=''){
            if($token==base64_encode(md5($oid))){
                $row = mod_order::get_order($oid);
                if($row['status']!=1){
                    tpl::assign('yz_pay',1);
                    tpl::assign('oid',$row['oid']);
                    tpl::assign('des',$row['des']);
					$return = mod_ffsm_ssys::ssys($row);
			
					$datas=json_decode(urldecode($row['data']),true);
					$datas['wx_col']=$arrgs_a[$return['user']['bazi'][0]];
					$datas['sx_icon']=$arrzs_a[$return['user']['bazi'][1]];
					
                    tpl::assign('names',$datas);
                    $tpl     = 'ffsm/ssjs/order.tpl';
                }else{
                    $return = mod_ffsm_ssys::ssys($row);
					$return['wx_col']=$arrgs_a[$return['user']['bazi'][0]];
					$return['sx_icon']=$arrzs_a[$return['user']['bazi'][1]];
                  
                    $yuefen = mod_ffsm_ssys::yuefen($return['user']['sx']);
					$userdata=json_decode(urldecode($row['data']),true);
                    $ssysdata = mod_ffsm_ssys::ssysdata("csapi_ssjs",$userdata['y'],$userdata['m'],$userdata['d'],$userdata['h'],$oid,$row['money']);
					
                    tpl::assign('ssysdata',$ssysdata);
					if($ssysdata['code']!=200){
						if(empty($ssysdata_auth['message'])){
							$ssysdata_auth['message']="发生未知错误";
						}
						$this->error_bc($ssysdata_auth['message'],'/','返回首页');
					}
					 
                    $return['sx']['yf'] = $yuefen;
          
                    tpl::assign('return',$return);
                    $pp = mod_ffsm_ssys::bazipp($row);
					tpl::assign('jmsh',$info['jmsh']);
                    tpl::assign('pp',$pp);
                    $row['data'] = json_decode(urldecode($row['data']),true);
					include PATH_DATA.'/file_cache/bzsm.data.php';
					$xingming=$this->splitName($row['data']['username']);
					$cookies = mod_wuhangbazi::get_bzwh($xingming[0],$xingming[1],$row['data']['gender'],$row['data']['y'],$row['data']['m'],$row['data']['d'],$row['data']['h'],$row['data']['i'],$row['data']['cY'],$row['data']['cM'],$row['data']['cD'],$row['data']['cH'],$row['data']['term1'],$row['data']['term2'],$row['data']['start_term'],$row['data']['end_term'],$row['data']['start_term1'],$row['data']['end_term1'],$row['data']['lDate']);
					$sql="select * from `sm_rgnm` where rgz='".$cookies['bazi'][4].$cookies['bazi'][5]."'";
					$rglm=db::queryone($sql);
					$sql="select * from `sm_smtf` where ri='".$cookies['bazi'][4].$cookies['bazi'][5]."' and shi='".$cookies['bazi'][6].$cookies['bazi'][7]."'";
					$sxth=db::queryone($sql);
					$info = $this->public_sm($cookies);
                  
                  $date_time=array();
                  $date_time['q3']=date("d",$ssysdata['ctime']-3*86400);
                  $date_time['q2']=date("d",$ssysdata['ctime']-2*86400);
                  $date_time['q1']=date("d",$ssysdata['ctime']-86400);
                  $date_time['td']=date("d",$ssysdata['ctime']);
                  $date_time['h1']=date("d",$ssysdata['ctime']+86400);
				  $date_time['h2']=date("d",$ssysdata['ctime']+2*86400);
				  
                  
				  
				  $date_time['date_q3']=date("Y年m月d日",$ssysdata['ctime']-3*86400);
                  $date_time['date_q2']=date("Y年m月d日",$ssysdata['ctime']-2*86400);
                  $date_time['date_q1']=date("Y年m月d日",$ssysdata['ctime']-86400);
                  $date_time['date_td']=date("Y年m月d日",$ssysdata['ctime']);
                  $date_time['date_h1']=date("Y年m月d日",$ssysdata['ctime']+86400);
                  $date_time['date_h2']=date("Y年m月d日",$ssysdata['ctime']+2*86400);
                 
				  
                  tpl::assign('date_time', $date_time);
				  tpl::assign('oid',$row['oid']);
					tpl::assign('jmsh',$info['jmsh']);
					tpl::assign('wharr',$info['wharr']);
					tpl::assign('tywh',$info['tywh']);
					tpl::assign('nayin',$info['nayin']);
					tpl::assign('sxgx',$info['sxgx']);
					tpl::assign('sxth',$sxth);
					tpl::assign('rglm',$rglm);
					tpl::assign('cookies',$cookies);
                    tpl::assign('xgfx',$xgfx);
                    tpl::assign('mzjp',$mzjp);
                    tpl::assign('data',$row);
					tpl::assign('myq_text',$myq_text);
					$this->dl_js($row);
                    $tpl     = 'ffsm/ssjs/find.tpl';
                }
            }else{
                die('验证失败!');
            }
        }else{
            $tpl     = 'ffsm/ssjs/index.tpl';
        }
		
        $content = tpl::fetch($tpl);
        exit($content);
    }
	
}