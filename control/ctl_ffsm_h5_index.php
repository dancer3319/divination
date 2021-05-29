<?php
if( !defined('CORE') ) exit('Request Error!');
/**
 * 首页控制器
 *
 * @version 2013.07.05
 */
class ctl_ffsm_h5_index{
	public static $userinfo;
	public static $control;
	public $jf_sys_sjqx;
	public $http_type;
	public $cache_enable = true;//缓存开关,调试时可设为false
	public $cachetime    = 7200;//缓存时间,秒(注意:内容页缓存是单独的在video_view中设置)
	public $cache_prefix = 'sm.nedor.cn';
	public $cache_key    = 'h5_index/index';
	public $str_where_ext = '`status`!=9';
	public function __construct(){	
		$this->http_type = ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') || (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) &&$_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https')) ? 'https://' : 'http://';
		$return_url=urlencode($this->http_type.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']);
		tpl::assign('return_url',$return_url);
		
        if( strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false &&  $_COOKIE["user_name"]=="" && $_COOKIE["usermore"]=="" ) {
         	$this->wxlogin($return_url);//微信自动登陆
        }
      	if( strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false) {
			tpl::assign('wxopen',1);//判断是否微信打开
		}
		$dl = isset($_COOKIE["dl"])?$_COOKIE["dl"]:'';
        if($dl>0){
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
		if (empty($this->items)){
			$this->items = new items();
		}
		
		tpl::assign('web_url',URL);
		$pid = mod_topic::get_p_id();//获取一级栏目
		tpl::assign('pid',$pid);		
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
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/logo_12.png");
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
			if($var_sy['name']=='tjex_sjqx'){
				$this->jf_sys_sjqx=$var_sy['config'];
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
        if(!preg_match('/^(\d{4})\-(\d{1,2})\-(\d{1,2})$/', $date, $_date) || !checkdate((int)$_date[2], (int)$_date[3], (int)$_date[1])){
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

	}
	//分享dl处理
    public function dl_url($url){
		$dl = isset($_COOKIE["dl"])?$_COOKIE["dl"]:'';
      	if($dl>0 && strpos($url,"dl=") === false){
          if(strpos($url,"?")>0){
            	$data=$url."&".$dl;
          }else{
            	$data=$url."?".$dl;
          }
        }else{
          $data=$url;
        }
		return $data;
    }
    public function xmfx2(){
                $tpl     = 'ffsm/xmfx2.tpl';
                        $content = tpl::fetch($tpl);
                        exit($content);
    }
	public function ss_faq(){
		$type = req::item('t');
		$ssysdata_faq = mod_ffsm_ssys::ssysdata_faq($type);
		tpl::assign('faq_subject',$ssysdata_faq['subject']);
      	tpl::assign('faq',$ssysdata_faq['msg']);
		$tpl     = 'ffsm/faq.tpl';
        $content = tpl::fetch($tpl);
        exit($content);
	 }
	/**
	 *首页
	 */
	public function index()	{	
		$content      = array();
		if($this->cache_enable)
		{
			$content = cache::get($this->cache_prefix,'index');
		}
        $content = '';
		if(empty($content)){
			$hand_type_arr = array('index_test');//手动数据
			$handtype_arr = $this->items->getHandTypeId($hand_type_arr);
			$mixdata = $this->items->get_attay_hand_data($handtype_arr);
			tpl::assign('m', $mixdata);//<--END 手动数据
			$zgjm_new_data = mod_index::get_data('zgjm_data','',1,18);
			tpl::assign('zgjm_new_data',$zgjm_new_data);

			$tpl     = 'ffsm/index.tpl';
			$content = tpl::fetch($tpl);
			//cache::set($this->cache_prefix,'index',$content,$this->cachetime); //写缓存
			//cache::set_cache_list($this->cache_prefix,'index');
		}
		//print_r("123123");exit;
	    $moban = $GLOBALS['config']['money']['mobanqh'];
	    if($moban==1){
	    	$tpl = 'ffsm/index.tpl';
	    }elseif($moban==2){
			$tpl = 'ffsm/fengge/i2.tpl';
	    }elseif($moban==3){
	        $tpl = 'ffsm/fengge/i3.tpl';
	    }
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
				$jf_sys_on = db::get_one("SELECT * FROM `system` WHERE `name` = 'tjex_on' AND `class` = 4");
				if($jf_sys_on['config']==1){
					$jf_sys_ext = db::get_one("SELECT * FROM `system` WHERE `name` = 'tjex_hd' AND `class` = 4");
					$data['oid']=$row['oid'];
					$data['uid']=$row['uid'];
					$data['ext']=$jf_sys_ext['config'];
					$data['type']=$row['type'];
					$data['class']=0;
					$data['time']=time();
					db::insert('ffsm_jflog', $data);
					db::query("UPDATE `users` SET `integral` = `integral` + '".$jf_sys_ext['config']."'  WHERE `uid` = '".$row['uid']."' limit 1");
				}
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
		$user_name = isset($_COOKIE["user_name"])?$_COOKIE["user_name"]:'';
		if($user_name){
			$query="select * from `users` where `user_name`='".$user_name."'";
			$result = db::get_one($query);
		}else{
			return "";
		}
		return $result['uid'];
	}
	/* taluo*/
    public function taluoyunshi(){
        $form['type'] = 26;
        $oid = req::item('oid');
        $update = req::item('update',0);//1位强制刷新卡牌
        $pay = req::item('pay',0);
        tpl::assign('sh_title',"塔罗牌占卜-未来运势大揭秘？");
        tpl::assign('sh_desc','圣三角牌阵解读你的过去，现在和未来，塔罗牌为你解开困惑。');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/taluoyunshi.png");
        if(!empty($oid)){
            $row = mod_order::get_order($oid);
            if(empty($row)){
                $tpl     = 'ffsm/taluo/yunshi_form.tpl';
            }elseif($row['status']!=1){
                if($update=='1'){//强制刷新订单内卡牌
                    $row['data'] = array('carinfo'=>mod_ffsm_taluo_yunshi::car());
                    $orders['data'] = urlencode(json_encode($row['data']));
                    mod_order::up_order($orders," `oid`='".$row['oid']."'");
                    //重置卡牌
                    $row['data'] = $orders['data'];
                }
                $row['data'] = json_decode(urldecode($row['data']),true);
                tpl::assign('data',$row);

                if($pay==1){
                    $tpl     = 'ffsm/taluo/yunshi_order.tpl';
                }else{
                    $tpl     = 'ffsm/taluo/yunshi_order_xuanpai.tpl';
                }
            }else{

                $row['data'] = json_decode(urldecode($row['data']),true);
                tpl::assign('data',$row);
				$this->dl_js($row);
                $tpl     = 'ffsm/taluo/yunshi_find.tpl';
            }

        }else{
            $tpl     = 'ffsm/taluo/yunshi_form.tpl';
        }


        $content = tpl::fetch($tpl);
        exit($content);

    }
	/*塔罗-脱单*/
    public function taluotuodan(){
        $form['type'] = 31;
        $oid = req::item('oid');
        $update = req::item('update',0);//1位强制刷新卡牌
        $pay = req::item('pay',0);
        tpl::assign('money',$moneys);
		tpl::assign('sh_title',"塔罗牌脱单占卜3个月内你会脱单吗？");
        tpl::assign('sh_desc','孤身一人你是否知道命中注定的TA在哪？渴望感情而又害怕受伤，三个月内你能否结束单身生活。');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/taluotuodan.png");
        if(!empty($oid)){
            $row = mod_order::get_order($oid);
            if(empty($row)){
                $tpl     = 'ffsm/taluo/tuodan_form.tpl';
            }elseif($row['status']!=1){
                if($update=='1'){//强制刷新订单内卡牌
                    $row['data'] = array('carinfo'=>mod_ffsm_taluo_yunshi::car_tuodan());
                    $orders['data'] = urlencode(json_encode($row['data']));
                    mod_order::up_order($orders," `oid`='".$row['oid']."'");
                    //重置卡牌
                    $row['data'] = $orders['data'];
                }
                $row['data'] = json_decode(urldecode($row['data']),true);
                tpl::assign('data',$row);
                if($pay==1){
                    $tpl     = 'ffsm/taluo/tuodan_order.tpl';
                }else{
                    $tpl     = 'ffsm/taluo/tuodan_order_xuanpai.tpl';
                }
            }else{
                $row['data'] = json_decode(urldecode($row['data']),true);
                tpl::assign('data',$row);
                $this->dl_js($row);
                $tpl     = 'ffsm/taluo/tuodan_find.tpl';
            }
        }else{
            $tpl     = 'ffsm/taluo/tuodan_form.tpl';
        }
        $content = tpl::fetch($tpl);
        exit($content);

    }
    /*你和他该继续下去吗*/
    public function taluojixu(){
        $form['type'] = 29;
        $oid = req::item('oid');
        $update = req::item('update',0);//1位强制刷新卡牌
        $pay = req::item('pay',0);
		tpl::assign('sh_title',"塔罗牌爱情占卜，你和TA该继续下去吗？");
        tpl::assign('sh_desc','是分手还是继续，4张牌告诉你答案。感情遇到阻碍是继续还是该放手，他值得你继续等待吗？');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/taluojixu.png");
        if(!empty($oid)){
            $row = mod_order::get_order($oid);
            if(empty($row)){
                $tpl     = 'ffsm/taluo/jixu_form.tpl';
            }elseif($row['status']!=1){
                if($update=='1'){//强制刷新订单内卡牌
                    $row['data'] = array('carinfo'=>mod_ffsm_taluo_yunshi::car_jixu());
                    $orders['data'] = urlencode(json_encode($row['data']));
                    mod_order::up_order($orders," `oid`='".$row['oid']."'");
                    //重置卡牌
                    $row['data'] = $orders['data'];
                }
                $row['data'] = json_decode(urldecode($row['data']),true);
                tpl::assign('data',$row);
                if($pay==1){
                    $tpl     = 'ffsm/taluo/jixu_order.tpl';
                }else{
                    $tpl     = 'ffsm/taluo/jixu_order_xuanpai.tpl';
                }
            }else{
                $row['data'] = json_decode(urldecode($row['data']),true);
                tpl::assign('data',$row);
                $this->dl_js($row);
                $tpl     = 'ffsm/taluo/jixu_find.tpl';
            }
        }else{
            $tpl     = 'ffsm/taluo/jixu_form.tpl';
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
	/**塔罗-爱情*/
    public function taluoaiqing(){
        $form['type'] = 30;
        $oid = req::item('oid');
        $update = req::item('update',0);//1位强制刷新卡牌
        $pay = req::item('pay',0);
        tpl::assign('sh_title',"2021年塔罗牌爱情运势大揭秘，塔罗占卜你的爱情运势？");
        tpl::assign('sh_desc','单身的你合适能脱单？2021年你的桃花运如何？单身你的会在什么时候找到另外一半？');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/taluoa.png");
        if(!empty($oid)){
            $row = mod_order::get_order($oid);
            if(empty($row)){
                $tpl     = 'ffsm/taluo/aiqing_form.tpl';
            }elseif($row['status']!=1){
                if($update=='1'){//强制刷新订单内卡牌
                    $row['data'] = array('carinfo'=>mod_ffsm_taluo_yunshi::car_aiqing());
                    $orders['data'] = urlencode(json_encode($row['data']));
                    mod_order::up_order($orders," `oid`='".$row['oid']."'");
                    //重置卡牌
                    $row['data'] = $orders['data'];
                }
                $row['data'] = json_decode(urldecode($row['data']),true);
                tpl::assign('data',$row);
                if($pay==1){
                    $tpl     = 'ffsm/taluo/aiqing_order.tpl';
                }else{
                    $tpl     = 'ffsm/taluo/aiqing_order_xuanpai.tpl';
                }
            }else{
                $row['data'] = json_decode(urldecode($row['data']),true);
                tpl::assign('data',$row);
                $this->dl_js($row);
                $tpl     = 'ffsm/taluo/aiqing_find.tpl';
            }
        }else{
            $tpl     = 'ffsm/taluo/aiqing_form.tpl';
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
    /**他的心里有没有你*/
    public function taluoxinli(){
        $form['type'] = 28;
        $oid = req::item('oid');
        $update = req::item('update',0);//1位强制刷新卡牌
        $pay = req::item('pay',0);
        tpl::assign('sh_title',"塔罗牌占卜ta的心里有没有你？");
        tpl::assign('sh_desc','懂一个人好难TA的心里到底有没有我？塔罗揭秘你的爱情TA的心。');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/taluoxl.png");
        if(!empty($oid)){
            $row = mod_order::get_order($oid);
            if(empty($row)){
                $tpl     = 'ffsm/taluo/xinli_form.tpl';
            }elseif($row['status']!=1){
                if($update=='1'){//强制刷新订单内卡牌
                    $row['data'] = array('carinfo'=>mod_ffsm_taluo_yunshi::car_xinli());
                    $orders['data'] = urlencode(json_encode($row['data']));
                    mod_order::up_order($orders," `oid`='".$row['oid']."'");
                    //重置卡牌
                    $row['data'] = $orders['data'];
                }
                $row['data'] = json_decode(urldecode($row['data']),true);

                tpl::assign('data',$row);

                if($pay==1){
                    $tpl     = 'ffsm/taluo/xinli_order.tpl';
                }else{
                    $tpl     = 'ffsm/taluo/xinli_order_xuanpai.tpl';
                }
            }else{
                $row['data'] = json_decode(urldecode($row['data']),true);
                tpl::assign('data',$row);
                $this->dl_js($row);
                $tpl     = 'ffsm/taluo/xinli_find.tpl';
            }
        }else{
            $tpl     = 'ffsm/taluo/xinli_form.tpl';
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
	/**塔罗-你和他能走到最后吗*/
    public function taluozuihou(){
        $form['type'] = 33;
        $oid = req::item('oid');
        $update = req::item('update',0);//1位强制刷新卡牌
        $pay = req::item('pay',0);
        tpl::assign('sh_title',"你和ta能走到最后吗？塔罗牌占卜");
        tpl::assign('sh_desc','想要预知感情发展结果的你，默想对方的样子，做好占卜准备。');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/taluo_3.png");
        if(!empty($oid)){
            $row = mod_order::get_order($oid);
            if(empty($row)){
                $tpl     = 'ffsm/taluo/zuihou_form.tpl';
            }elseif($row['status']!=1){
                if($update=='1'){//强制刷新订单内卡牌
                    $row['data'] = array('carinfo'=>mod_ffsm_taluo_yunshi::car_zuihou());
                    $orders['data'] = urlencode(json_encode($row['data']));
                    mod_order::up_order($orders," `oid`='".$row['oid']."'");
                    //重置卡牌
                    $row['data'] = $orders['data'];
                }
                $row['data'] = json_decode(urldecode($row['data']),true);
                tpl::assign('data',$row);

                if($pay==1){
                    tpl::assign('data',$row);
                    $tpl     = 'ffsm/taluo/zuihou_order.tpl';
                }else{
                    $tpl     = 'ffsm/taluo/zuihou_order_xuanpai.tpl';
                }
            }else{
                $row['data'] = json_decode(urldecode($row['data']),true);
                tpl::assign('data',$row);
                $this->dl_js($row);
                $tpl     = 'ffsm/taluo/zuihou_find.tpl';
            }
        }else{
            $tpl     = 'ffsm/taluo/zuihou_form.tpl';
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
    /**塔罗-复合*/
    public function taluofuhe(){
        $form['type'] = 32;
        $oid = req::item('oid');
        $update = req::item('update',0);//1位强制刷新卡牌
        $pay = req::item('pay',0);
        tpl::assign('sh_title',"你们有机会复合吗？塔罗牌占卜");
        tpl::assign('sh_desc','分手后无法忘记对方，究竟还能不能复合，塔罗揭秘复合天机。');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/taluo_2.png");
        if(!empty($oid)){
            $row = mod_order::get_order($oid);
            if(empty($row)){
                $tpl     = 'ffsm/taluo/fuhe_form.tpl';
            }elseif($row['status']!=1){
                if($update=='1'){//强制刷新订单内卡牌
                    $row['data'] = array('carinfo'=>mod_ffsm_taluo_yunshi::car_fuhe());
                    $orders['data'] = urlencode(json_encode($row['data']));
                    mod_order::up_order($orders," `oid`='".$row['oid']."'");
                    //重置卡牌
                    $row['data'] = $orders['data'];
                }
                $row['data'] = json_decode(urldecode($row['data']),true);
                tpl::assign('data',$row);
                if($pay==1){
                    tpl::assign('data',$row);
                    $tpl     = 'ffsm/taluo/fuhe_order.tpl';
                }else{
                    $tpl     = 'ffsm/taluo/fuhe_order_xuanpai.tpl';
                }
            }else{
                $row['data'] = json_decode(urldecode($row['data']),true);
                tpl::assign('data',$row);
                $this->dl_js($row);
                $tpl     = 'ffsm/taluo/fuhe_find.tpl';
            }
        }else{
            $tpl     = 'ffsm/taluo/fuhe_form.tpl';
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
	/**暗恋的人喜欢你吗*/
    public function taluoanlian(){
        $form['type'] = 27;
        $oid = req::item('oid');
        $update = req::item('update',0);//1位强制刷新卡牌
        $pay = req::item('pay',0);
        tpl::assign('sh_title',"你暗恋的人也喜欢你吗？塔罗牌占卜");
        tpl::assign('sh_desc','暗恋虽然美好但太过于煎熬，塔罗揭秘ta是否也喜欢你。');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/taluo_1.png");
        if(!empty($oid)){
            $row = mod_order::get_order($oid);
            if(empty($row)){
                $tpl     = 'ffsm/taluo/anlian_form.tpl';
            }elseif($row['status']!=1){
                if($update=='1'){//强制刷新订单内卡牌
                    $row['data'] = array('carinfo'=>mod_ffsm_taluo_yunshi::car_xinli());
                    $orders['data'] = urlencode(json_encode($row['data']));
                    mod_order::up_order($orders," `oid`='".$row['oid']."'");
                    //重置卡牌
                    $row['data'] = $orders['data'];
                }
                $row['data'] = json_decode(urldecode($row['data']),true);

                //print_r($row['data']);

                tpl::assign('data',$row);

                if($pay==1){
                    $tpl     = 'ffsm/taluo/anlian_order.tpl';
                }else{
                    $tpl     = 'ffsm/taluo/anlian_order_xuanpai.tpl';
                }
            }else{
                $row['data'] = json_decode(urldecode($row['data']),true);
                tpl::assign('data',$row);
                $this->dl_js($row);
                $tpl     = 'ffsm/taluo/anlian_find.tpl';
            }
        }else{
            $tpl     = 'ffsm/taluo/anlian_form.tpl';
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
	/**塔罗牌-TA心里有别人吗*/
	public function taluobieren(){
        $form['type'] = 35;
        $oid = req::item('oid');
        $update = req::item('update',0);//1位强制刷新卡牌
        $pay = req::item('pay',0);
        tpl::assign('sh_title',"塔罗牌占卜-你喜欢的人心里有想着别人吗？");
        tpl::assign('sh_desc','他/她是否只爱你一人，对方心里有没有想着别人？');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/bieren.jpg");
        if(!empty($oid)){
            $row = mod_order::get_order($oid);
            if(empty($row)){
                $tpl     = 'ffsm/taluo/bieren_form.tpl';
            }elseif($row['status']!=1){
                if($update=='1'){//强制刷新订单内卡牌
                    $row['data'] = array('carinfo'=>mod_ffsm_taluo_yunshi::car_bieren());
                    $orders['data'] = urlencode(json_encode($row['data']));
                    mod_order::up_order($orders," `oid`='".$row['oid']."'");
                    //重置卡牌
                    $row['data'] = $orders['data'];
                }
                $row['data'] = json_decode(urldecode($row['data']),true);
                tpl::assign('data',$row);
                if($pay==1){
                    tpl::assign('data',$row);
                    $tpl     = 'ffsm/taluo/bieren_order.tpl';
                }else{
                    $tpl     = 'ffsm/taluo/bieren_order_xuanpai.tpl';
                }
            }else{
                $row['data'] = json_decode(urldecode($row['data']),true);
                tpl::assign('data',$row);
                $this->dl_js($row);
                $tpl     = 'ffsm/taluo/bieren_find.tpl';
            }
        }else{
            $tpl     = 'ffsm/taluo/bieren_form.tpl';
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
	/**塔罗-你们该分手吗*/
	public function taluofenshou(){
        $form['type'] = 34;
        $oid = req::item('oid');
        $update = req::item('update',0);//1位强制刷新卡牌
        $pay = req::item('pay',0);
        tpl::assign('sh_title',"你和ta该不该分手？塔罗牌占卜");
        tpl::assign('sh_desc','难以沟通、受尽委屈、频频失误、患得患失、这样的爱情该不该分手？');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/taluofenshou.png");
        if(!empty($oid)){
            $row = mod_order::get_order($oid);
            if(empty($row)){
                $tpl     = 'ffsm/taluo/zuihou_form.tpl';
            }elseif($row['status']!=1){
                if($update=='1'){//强制刷新订单内卡牌
                    $row['data'] = array('carinfo'=>mod_ffsm_taluo_yunshi::car_fenshou());
                    $orders['data'] = urlencode(json_encode($row['data']));
                    mod_order::up_order($orders," `oid`='".$row['oid']."'");
                    //重置卡牌
                    $row['data'] = $orders['data'];
                }
                $row['data'] = json_decode(urldecode($row['data']),true);
                tpl::assign('data',$row);

                if($pay==1){
                    tpl::assign('data',$row);
                    $tpl     = 'ffsm/taluo/fenshou_order.tpl';
                }else{
                    $tpl     = 'ffsm/taluo/fenshou_order_xuanpai.tpl';
                }
            }else{
                $row['data'] = json_decode(urldecode($row['data']),true);
                tpl::assign('data',$row);
                $this->dl_js($row);
                $tpl     = 'ffsm/taluo/fenshou_find.tpl';
            }
        }else{
            $tpl     = 'ffsm/taluo/fenshou_form.tpl';
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
    /*塔罗牌-增加订单-定卡牌*/
    public function userinfosubmit(){
        $src = req::item('src');
        $gid = req::item('gid');
        $form['type'] = 26;
        $form['username'] = req::item('name');
        $form['money'] = $this->money['taluoyunshi'];
        $form['oid'] = mod_order::createoid($form['type']);
        if($gid=='xinli'){//生成四张随机牌
            $form['type'] = 28;
            $form['money'] = $this->money['taluoxinli'];
            $carinfo = mod_ffsm_taluo_yunshi::car_xinli();//生成随机卡牌
        }elseif($gid=='anlian'){
            $form['type'] = 27;
            $form['money'] = $this->money['taluoanlian'];
            $carinfo = mod_ffsm_taluo_yunshi::car_anlian();//生成随机卡牌
        }elseif($gid=='jixu'){
            $form['type'] = 29;
            $form['money'] = $this->money['taluojixu'];
            $carinfo = mod_ffsm_taluo_yunshi::car_jixu();//生成随机卡牌
        }elseif($gid=='aiqing'){
            $form['type'] = 30;
            $form['money'] = $this->money['taluoaiqing'];
            $carinfo = mod_ffsm_taluo_yunshi::car_aiqing();//生成随机卡牌
        }elseif($gid=='tuodan'){
            $form['type'] = 31;
            $form['money'] = $this->money['taluotuodan'];
            $carinfo = mod_ffsm_taluo_yunshi::car_tuodan();//生成随机卡牌
        }elseif($gid=='fuhe'){
            $form['type'] = 32;
            $form['money'] = $this->money['taluofuhe'];
            $carinfo = mod_ffsm_taluo_yunshi::car_fuhe();//生成随机卡牌
        }elseif($gid=='zuihou'){
            $form['type'] = 33;
            $form['money'] = $this->money['taluofuhe'];
            $carinfo = mod_ffsm_taluo_yunshi::car_zuihou();//生成随机卡牌
        }elseif($gid=='fenshou'){
            $form['type'] = 34;
            $form['money'] = $this->money['taluofenshou'];
            $carinfo = mod_ffsm_taluo_yunshi::car_fenshou();//生成随机卡牌
        }elseif($gid=='bieren'){
            $form['type'] = 35;
            $form['money'] = $this->money['taluobieren'];
            $carinfo = mod_ffsm_taluo_yunshi::car_bieren();//生成随机卡牌
        }else{
            $carinfo = mod_ffsm_taluo_yunshi::car();//生成随机卡牌
        }
        $form['datas'] = array('username'=>($form['username']),'carinfo'=>$carinfo);
        
        mod_order::add_order_talou($form);
        exit(json_encode(array('code'=>1,'message'=>'保存成功','data'=>array('record_id'=>$form['oid']))));
    }
//塔罗卡牌名字以及正逆位//
    
//星座//
    public function xingzuointerim(){
        $oid = req::item('oid');
        $src= req::item('src');
        $row = mod_order::get_order($oid);
        $row['data'] = json_decode(urldecode($row['data']),true);
        tpl::assign('row',$row);
        $xzs = ["白羊座"=>"baiyang","金牛座"=>"jinniu","双子座"=>"shuangzi","巨蟹座"=>"juxie","狮子座"=>"shizi","处女座"=>"chunv","天秤座"=>"tiancheng","天蝎座"=>"tianxie","射手座"=>"sheshou","摩羯座"=>"mojie","水瓶座"=>"shuiping","双鱼座"=>"shuangyu"];
        if($row['oid'] && $row['data']['xz']){
            $tpl     = 'ffsm/xingzuo/interim.tpl';
        }else{
            die('生成订单错误,请返回重新提交');
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
    public function xingzuo(){
        $form['type'] = 37;
        $oid = req::item('oid');
		tpl::assign('sh_title',"十二星座运势大全，详解星座运势");
        tpl::assign('sh_desc','为您提供专业的星座运势分析，十二星座运势分析报告专业版。');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/xingzuo.png");
        $xzs = ["白羊座"=>"baiyang","金牛座"=>"jinniu","双子座"=>"shuangzi","巨蟹座"=>"juxie","狮子座"=>"shizi","处女座"=>"chunv","天秤座"=>"tiancheng","天蝎座"=>"tianxie","射手座"=>"sheshou","摩羯座"=>"mojie","水瓶座"=>"shuiping","双鱼座"=>"shuangyu"];
        if(!empty($oid)){
            $row = mod_order::get_order($oid);
            $return = mod_ffsm_xingzuo::fenxi($row);
            $return['data']['img']=$xzs[$return['data']['username']];
			//print_r($return);
            tpl::assign('data',$return);
            if(empty($row)){
                $tpl     = 'ffsm/xingzuo/form.tpl';
            }elseif($row['status']!=1){
                $tpl     = 'ffsm/xingzuo/order.tpl';
            }else{
                $tpl     = 'ffsm/xingzuo/find.tpl';
            }
        }else{
            $tpl     = 'ffsm/xingzuo/form.tpl';
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
    /**生成订单-星座*/
    public function adddcorder(){
        $xz = ["白羊座","金牛座","双子座","巨蟹座","狮子座","处女座","天秤座","天蝎座","射手座","摩羯座","水瓶座","双鱼座"];
        $src = req::item('src');
        $form['type'] = 37;
        $starid = req::item('starid');
        $form['money'] = $this->money['xingzuo'];
        if($src=='1001'){//星座
            $form['type'] = 37;
            $form['username'] = $xz[$starid-1];
            $form['money'] = $this->money['xingzuo'];
        }
        $form['oid'] = mod_order::createoid($form['type']);
        $form['datas'] = array('username'=>($form['username']),'starid'=>$starid,'xz'=>$xz[$starid-1]);
        mod_order::add_order_talou($form);
        exit(json_encode(array('code'=>1,'orderId'=>$form['oid'])));
    }
//星座结束//
//生肖运势//
    public function shengxiao(){
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
		$moneys = $GLOBALS['config']['money']['bazi'];
		tpl::assign('money',$moneys);
		tpl::assign('sh_title',"2021年十二生肖运势运程,2021牛年生肖运势分析");
        tpl::assign('sh_desc','2021生肖运势专题涵盖2021牛年运势、属鼠、牛、虎、兔、龙、蛇、马、羊、猴、鸡、狗、猪2021年运势及运程，全方位解读十二生肖财运、感情、爱情、事业等运势。');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/shiye_sx.jpg");
		//第四方支付
     	$sys_pay_type=db::queryone("SELECT * FROM `system` WHERE `name` = 'pay_type'");
        tpl::assign('sys_pay_type',$sys_pay_type['config']);
        $oid = req::item('oid');
        $token = req::item('token');
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
            $des = $username.'的事业财运分析';
            $data = array('username'=>$username,'gender'=>$gender,'y'=>$y,'m'=>$m,'d'=>$d,'h'=>$h,'i'=>$i,'cY'=>$cY,'cM'=>$cM,'cD'=>$cD,'cH'=>$cH,'term1'=>$term1
            ,'term2'=>$term2,'start_term'=>$start_term,'end_term'=>$end_term,'start_term1'=>$start_term1,'end_term1'=>$end_term1,'lDate'=>$lDate);
            $datas = array('data'=>urlencode(json_encode($data)),'oid'=>$oid,'createtime'=>time(),'type'=>11,'ip'=>util::get_client_ip(),'des'=>$des,'money'=>$moneys,'pay_uid'=>$pay_uid,'uid'=>$dl_id,'dl_status'=>0,'dl_money'=>$hdjf);
			if(rand(1,100)>$this->jf_sys_sjqx){$datas['uid']="";}
            mod_order::add_order($datas);
            mod_order::set_history($oid);
            tpl::assign('oid',$oid);
            tpl::assign('des',$des);
            tpl::assign('names',$data);
            $tpl     = 'ffsm/shengxiao/shengxiao_order.tpl';
        }elseif($oid!=''){
            if($token==base64_encode(md5($oid))){
                $row = mod_order::get_order($oid);
                if($row['status']!=1){
                    tpl::assign('oid',$row['oid']);
                  	tpl::assign('yz_pay',1);
                    tpl::assign('des',$row['des']);
                    tpl::assign('names',json_decode(urldecode($row['data']),true));
                    $tpl     = 'ffsm/shengxiao/shengxiao_order.tpl';
                }else{
                    $return = mod_ffsm_bazi::bazi($row);
                    $yuefen = mod_ffsm_bazi::yuefen($return['user']['sx']);
                    $return['sx']['yf'] = $yuefen;
                    tpl::assign('return',$return);
                    $pp = mod_ffsm_bazi::bazipp($row);
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
                    $tpl     = 'ffsm/shengxiao/shengxiao_find.tpl';
                }
            }else{
                die('验证失败!');
            }
        }else{
            $tpl     = 'ffsm/shengxiao/shengxiao.tpl';
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
    public function bazi(){
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
		$moneys = $GLOBALS['config']['money']['bazi'];
		tpl::assign('money',$moneys);
		tpl::assign('sh_title',"八字精批、2021流年运程详解、八字测算服务");
        tpl::assign('sh_desc','为您提供八字精批在线测算，给有缘人提供八字排盘,八字精批等专业的八字在线测算服务');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/shiye_1.jpg");
		//第四方支付
     	$sys_pay_type=db::queryone("SELECT * FROM `system` WHERE `name` = 'pay_type'");
        tpl::assign('sys_pay_type',$sys_pay_type['config']);
        $oid = req::item('oid');
        $token = req::item('token');
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
            $des = $username.'的事业财运分析';
            $data = array('username'=>$username,'gender'=>$gender,'y'=>$y,'m'=>$m,'d'=>$d,'h'=>$h,'i'=>$i,'cY'=>$cY,'cM'=>$cM,'cD'=>$cD,'cH'=>$cH,'term1'=>$term1
            ,'term2'=>$term2,'start_term'=>$start_term,'end_term'=>$end_term,'start_term1'=>$start_term1,'end_term1'=>$end_term1,'lDate'=>$lDate);
            $datas = array('data'=>urlencode(json_encode($data)),'oid'=>$oid,'createtime'=>time(),'type'=>1,'ip'=>util::get_client_ip(),'des'=>$des,'money'=>$moneys,'pay_uid'=>$pay_uid,'uid'=>$dl_id,'dl_status'=>0,'dl_money'=>$hdjf);
			if(rand(1,100)>$this->jf_sys_sjqx){$datas['uid']="";}
            mod_order::add_order($datas);
            mod_order::set_history($oid);
            tpl::assign('oid',$oid);
            tpl::assign('des',$des);
            tpl::assign('names',$data);
            $tpl     = 'ffsm/bazi_order.tpl';
        }elseif($oid!=''){
            if($token==base64_encode(md5($oid))){
                $row = mod_order::get_order($oid);
                if($row['status']!=1){
                    tpl::assign('oid',$row['oid']);
                  	tpl::assign('yz_pay',1);
                    tpl::assign('des',$row['des']);
                    tpl::assign('names',json_decode(urldecode($row['data']),true));
                    $tpl     = 'ffsm/bazi_order.tpl';
                }else{
                    $return = mod_ffsm_bazi::bazi($row);
                    $yuefen = mod_ffsm_bazi::yuefen($return['user']['sx']);
                    $return['sx']['yf'] = $yuefen;
                    tpl::assign('return',$return);
                    $pp = mod_ffsm_bazi::bazipp($row);
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
                    $tpl     = 'ffsm/bazi_find.tpl';
                }
            }else{
                die('验证失败!');
            }
        }else{
            $tpl     = 'ffsm/bazi.tpl';
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
public function hmjx(){
		$word=req::item('numberjx');
		$sztestType=req::item('sztestType');
        $tid = (int) req::item('tid',389);
		$path = mod_index::this_path($tid);
		tpl::assign('path',$path);
		$topic = mod_topic::get_topic('361',$tid);
        tpl::assign('topic',$topic);
		$seo = mod_topic::seo_info($tid);
		tpl::assign('seo',$seo);
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
		$moneys = $GLOBALS['config']['money']['hmjx'];
		tpl::assign('money',$moneys);
		tpl::assign('sh_title',"数字能量号码解析-揭开手机号-车牌号隐藏的吉凶");
        tpl::assign('sh_desc','你身边的数字就是你的生命密码，号码里隐藏的吉凶祸福。');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/logo_14.png");
		//第四方支付
     	$sys_pay_type=db::queryone("SELECT * FROM `system` WHERE `name` = 'pay_type'");
        tpl::assign('sys_pay_type',$sys_pay_type['config']);
        $oid = req::item('oid');
        $token = req::item('token');
        if($word!=''){
			$dl_id = $_COOKIE["dl"];
            $pay_uid=$this->isloguid();
            $tcbl_row=db::get_one("SELECT * FROM `users` WHERE `uid` = '".$dl_id."'");
            if($tcbl_row['dl_tcbl']>0){
            $hdjf=round($moneys*$tcbl_row['dl_tcbl']/100,2);
            }else{
            $hdjf=round($moneys*$GLOBALS['config']['money']['oneclass']/100,2);
            }
            $oid = date('Y').time();
            $des = $word.'的号码解析';
            $data = array('word'=>$word,'sztestType'=>$sztestType,'y'=>$y,'m'=>$m,'d'=>$d,'h'=>$h,'i'=>$i,'cY'=>$cY,'cM'=>$cM,'cD'=>$cD,'cH'=>$cH,'term1'=>$term1
            ,'term2'=>$term2,'start_term'=>$start_term,'end_term'=>$end_term,'start_term1'=>$start_term1,'end_term1'=>$end_term1,'lDate'=>$lDate);
            $datas = array('data'=>urlencode(json_encode($data)),'oid'=>$oid,'createtime'=>time(),'type'=>18,'ip'=>util::get_client_ip(),'des'=>$des,'money'=>$moneys,'pay_uid'=>$pay_uid,'uid'=>$dl_id,'dl_status'=>0,'dl_money'=>$hdjf);
			if(rand(1,100)>$this->jf_sys_sjqx){$datas['uid']="";}
            mod_order::add_order($datas);
            mod_order::set_history($oid);
            tpl::assign('oid',$oid);
            tpl::assign('des',$des);
            tpl::assign('data',$data);
            $tpl     = 'ffsm/hmjx_order.tpl';
        }elseif($oid!=''){
            if($token==base64_encode(md5($oid))){
                $row = mod_order::get_order($oid);
                if($row['status']!=1){
               	    tpl::assign('yz_pay',1);
                    tpl::assign('oid',$row['oid']);
                    tpl::assign('des',$row['des']);
                    tpl::assign('names',json_decode(urldecode($row['data']),true));
                    $tpl     = 'ffsm/hmjx_order.tpl';
                }else{
					$row['data'] = json_decode(urldecode($row['data']),true);
					$word22=$row['data']['word'];
					tpl::assign('word22',$word22);
					if($row['data']['sztestType']==2){
						$word_cp=$this->findNum($row['data']['word']);
                      	$word_z=$this->hmjx_word($word_cp);
						$sql="select * from `sm_shouji` where num='".$word_z."'";
                      tpl::assign('word_cp',$word_cp);
					}else{
					$word=$row['data']['word'];
					  $word_tel=str_split($word);
                 // print_r($word_tel);
					  $word_z=$this->hmjx_word($word);
					  $word_z1=$word_tel[3].$word_tel[4];
					  $word_z2=$word_tel[5].$word_tel[6];
					  $word_z3=$word_tel[7].$word_tel[8];
					  $word_z4=$word_tel[9].$word_tel[10];
					  $word_z5=$word_tel[3].$word_tel[4].$word_tel[5].$word_tel[6];
					  $word_z6=$word_tel[7].$word_tel[8].$word_tel[9].$word_tel[10];
						tpl::assign('word_z1',$word_z1);
						tpl::assign('word_z2',$word_z2);
						tpl::assign('word_z3',$word_z3);
						tpl::assign('word_z4',$word_z4);
						tpl::assign('word_z5',$word_z5);
						tpl::assign('word_z6',$word_z6);
					 $word1=$this->hmjx_word($word_z1);
					  $word2=$this->hmjx_word($word_z2);
					  $word3=$this->hmjx_word($word_z3);
					  $word4=$this->hmjx_word($word_z4);
					  $word5=$this->hmjx_word($word_z5);
					  $word6=$this->hmjx_word($word_z6);
					$sql="select * from `sm_shouji` where num='".$word_z."' or num='".$word1."' or num='".$word2."' or num='".$word3."' or num='".$word4."' or num='".$word5."' or num='".$word6."'";
					}
					$haomajx=db::fetch_all(db::query($sql));
					if($row['data']['sztestType']==2){
						$seo['title'] = '车牌号码：'.$word22.'测吉凶，车牌号码'.$word22.'好不好';
						$seo['description'] = '车牌号码：'.$word22.'测吉凶，车牌号码'.$word22.'好不好'.$seo['description'];
					}else{
						$seo['title'] = '手机号码：'.$word22.'测吉凶，'.$word22.'手机号码好不好？';
						$seo['description'] = '手机号码：'.$word22.'测吉凶，'.$word22.'手机号码好不好？'.$seo['description'];
					}
					tpl::assign('seo',$seo);
					tpl::assign('haomajx',$haomajx);
					tpl::assign('word',$word);
                    tpl::assign('data',$row);
					$this->dl_js($row);
						if($row['data']['sztestType']==1){
                    $tpl     = 'ffsm/hmjx_find.tpl';
					}
					else{
						 $tpl     = 'ffsm/hmjx_find2.tpl';
					}
                }
            }else{
                die('验证失败!');
            }
        }else{
            $tpl     = 'ffsm/hmjx.tpl';
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
public function hmjx_word($word){
	$word=intval($word);
	$word=$word/80;
	$temp=intval($word);		
	$word=$word-$temp;
	$word=intval($word*80);
	if($word=="0"){
		$word="81";
	}
	return $word;
}
public function findNum($str=''){
     return preg_replace('/\D/s', '', $str);
}
public function xydd_dj(){
		$id = req::item('id');
		$xydd_ck = $_COOKIE["xydd_".$id];
		if($xydd_ck>0){
			tpl::assign('info',"已经祝福了！祝愿您的心愿早日达成！");	
		}else{
			db::query('UPDATE `ffsm_orders` SET `qfdj` = `qfdj`+1 WHERE `id` = '.$id);
         	 tpl::assign('isdj',1);
			tpl::assign('info',"感谢您的祝福！也祝愿您的心愿早日达成！");
			$expire=time()+60*60*12;
			setcookie("xydd_".$id, $id, $expire,'/');
		}
        $tpl     = 'ffsm/xydd_ck.tpl';
        $content = tpl::fetch($tpl);
        exit($content);
    }
public function xydd_self(){
		$id = req::item('id');
		$xydd_self=db::queryone("select * from `ffsm_orders` where id=$id");
		tpl::assign('xydd_self',$xydd_self);
        $tpl     = 'ffsm/xydd_self.tpl';
        $content = tpl::fetch($tpl);
        exit($content);
    }
public function xydd(){
      	$username = req::item('username');
      	$yuanwang = req::item('yuanwang');
      	$qfshow = req::item('qfshow');
      	$lantern_id = req::item('lantern_id');
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
		$moneys = $GLOBALS['config']['money']['xydd'];
		tpl::assign('money',$moneys);
		tpl::assign('sh_title',"祈福招好运-点灯保平安，宫灯许愿为你祈福");
        tpl::assign('sh_desc','为你准备了姻缘灯、招财灯、太岁灯等点灯保平安祈福...');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/logo_5.jpg");
		//第四方支付
     	$sys_pay_type=db::queryone("SELECT * FROM `system` WHERE `name` = 'pay_type'");
        tpl::assign('sys_pay_type',$sys_pay_type['config']);
		include PATH_DATA.'/file_cache/xyd_data.php';
        $oid = req::item('oid');
        $token = req::item('token');
        if($username!=''){
            $oid = date('YmdGis').rand(1000000000, 15000000000);
            $des = $username.'的祈福点灯';
            $data = array('username'=>$username,'yuanwang'=>$yuanwang,'lantern_id'=>$lantern_id,'lantern_png'=>$xyd_data[$lantern_id][1],'y'=>$y,'m'=>$m,'d'=>$d,'h'=>$h,'i'=>$i,'cY'=>$cY,'cM'=>$cM,'cD'=>$cD,'cH'=>$cH,'term1'=>$term1
            ,'term2'=>$term2,'start_term'=>$start_term,'end_term'=>$end_term,'start_term1'=>$start_term1,'end_term1'=>$end_term1,'lDate'=>$lDate);
            $datas = array('data'=>urlencode(json_encode($data)),'oid'=>$oid,'createtime'=>time(),'type'=>21,'qfdj'=>'0','qfshow'=>$qfshow,'username'=>$username,'yuanwang'=>$yuanwang,'lantern_id'=>$lantern_id,'lantern_img'=>$xyd_data[$lantern_id][1],'ip'=>util::get_client_ip(),'des'=>$des,'money'=>$moneys,'pay_uid'=>$pay_uid,'uid'=>$dl_id,'dl_status'=>0,'dl_money'=>$hdjf);
			if(rand(1,100)>$this->jf_sys_sjqx){$datas['uid']="";}
			$cxoid = mod_order::get_order($oid);
			if($cxoid['oid']==""){
				mod_order::add_order($datas);
			}
            mod_order::set_history($oid);
			tpl::assign('xyd_data',$xyd_data[$lantern_id]);
            tpl::assign('oid',$oid);
            tpl::assign('des',$des);
            tpl::assign('names',$data);
            $tpl     = 'ffsm/xydd_orders.tpl';
        }elseif($oid!=''){
            if($token==base64_encode(md5($oid))){
                $row = mod_order::get_order($oid);
                if($row['status']!=1){
                 	tpl::assign('yz_pay',1);
                    tpl::assign('oid',$row['oid']);
                    tpl::assign('des',$row['des']);
                    tpl::assign('names',json_decode(urldecode($row['data']),true));
					tpl::assign('xyd_data',$xyd_data['$lantern_id']);
                    $tpl     = 'ffsm/xydd_orders.tpl';
                }else{
                    $row['data'] = json_decode(urldecode($row['data']),true);
					$gf_start=date("Y.m.d",$row['createtime']);
					$gf_end=date("Y.m.d",$row['createtime']+15552000);
					tpl::assign('xyd_data',$xyd_data[$row['data']['lantern_id']]);
					if($row['xydd_img']==""){
						$dst = "./ffsm/statics/ffsm/xydd/images/qyd_find.png";
						$src_path = "./ffsm/statics/ffsm/xydd/images/light/".$xyd_data[$row['data']['lantern_id']][1];
						$xyddtext = $row['data']['yuanwang'];
						$xyddtext1 = '姓名：'.$row['data']['username'].' '.$gf_start;
						$xydd_img=$this-> xydd_img($dst,$src_path,$xyddtext,$xyddtext1);
						mod_order::up_order(array('xydd_img'=>$xydd_img), " `oid`='".$oid."'");
						tpl::assign('xydd_img','/xydd/'.$xydd_img);
					}else{
						tpl::assign('xydd_img','/xydd/'.$row['xydd_img']);
					}
                    tpl::assign('data',$row);
                    tpl::assign('gf_start',$gf_start);
                    tpl::assign('gf_end',$gf_end);
					$this->dl_js($row);
                    $tpl     = 'ffsm/xydd_find.tpl';
                }
            }else{
                die('验证失败!');
            }
        }else{
			if($lantern_id!=''){
				tpl::assign('xyd_data',$xyd_data[$lantern_id]);
				tpl::assign('lantern_id',$lantern_id);
				$tpl     = 'ffsm/xydd_order.tpl';
			}else{
				$page = req::item('page');
				$list_cl = req::item('list_cl');
				$week = req::item('week');
				if($page>1){
					$page_s=30*($page-1);
					$page_e=30*$page;
					if($list_cl=="week"){
                     	 $xydd_all=db::fetch_all(db::query('SELECT * FROM `ffsm_orders` WHERE week(from_unixtime(`createtime`))=week(now())   and YEAR(from_unixtime(`createtime`))=YEAR(now()) and `status` = 1 AND `type` = 21 AND `qfshow` = 1 ORDER BY `qfdj` DESC limit '.$page_s.','.$page_e));
					}else if($list_cl=="zd"){
                      $xydd_all=db::fetch_all(db::query('SELECT * FROM `ffsm_orders` WHERE `status` = 1 AND `type` = 21 AND `qfshow` = 1 ORDER BY `qfdj` DESC limit '.$page_s.','.$page_e));
					}else{
                      $xydd_all=db::fetch_all(db::query('SELECT * FROM `ffsm_orders` WHERE `status` = 1 AND `type` = 21 AND `qfshow` = 1 ORDER BY `id` DESC limit '.$page_s.','.$page_e));	
					}
                  if(!empty($xydd_all)){
                    tpl::assign('xydd_all',$xydd_all);
                  }
					$tpl     = 'ffsm/xydd_page.tpl';
				}else{
					$xydd_all=db::fetch_all(db::query('SELECT * FROM `ffsm_orders` WHERE `status` = 1 AND `type` = 21 AND `qfshow` = 1 ORDER BY `id` DESC limit 0,30'));
					 $xydd_mall=db::fetch_all(db::query('SELECT * FROM `ffsm_orders` WHERE `status` = 1 AND `type` = 21 AND `qfshow` = 1 ORDER BY `qfdj` DESC limit 0,30'));
					 $xydd_weekall=db::fetch_all(db::query('SELECT * FROM `ffsm_orders` WHERE week(from_unixtime(`createtime`))=week(now())   and YEAR(from_unixtime(`createtime`))=YEAR(now()) and `status` = 1 AND `type` = 21 AND `qfshow` = 1 ORDER BY `qfdj` DESC limit 0,30'));
					 $orders= mod_order::get_history();
					foreach($orders as $k=>$v){
						$orders_arr = db::queryone("select * from `ffsm_orders` where oid='".$v."' and `type` = 21 ORDER BY `id` DESC");
                      if($orders_arr[oid]!=""){
                        $orders_arr['data'] = json_decode(urldecode($orders_arr['data']),true);
						$history_data[$k] = $orders_arr;
                        $ac=mod_order::typetochannel($orders_arr['type']);
						$history_data[$k]['url'] = "/?ac=".$ac."&oid=".$orders_arr['oid']."&token=".base64_encode(md5($orders_arr['oid']));
                      }
					}
					tpl::assign('history_data',$history_data);
					tpl::assign('xydd_all',$xydd_all);
					tpl::assign('xydd_weekall',$xydd_weekall);
					tpl::assign('xydd_mall',$xydd_mall);
					$tpl     = 'ffsm/xydd.tpl';
				}
			}
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
public function autowrap($fontsize, $angle, $fontface, $string, $width) {
	$content = "";
	for ($i=0;$i<mb_strlen($string);$i++) {
	$letter[] = mb_substr($string, $i, 1);
	}
	foreach ($letter as $l) {
	$teststr = $content." ".$l;
	$testbox = imagettfbbox($fontsize, $angle, $fontface, $teststr);
	if ((($testbox[2]-$testbox[0]) > $width) && ($content !== "")) {
	$content .= "\n\n";
	}
	$content .= $l;
	}
	return $content;
}
public function xydd_img($dst,$src_path,$text,$text1 ){
	mb_internal_encoding("UTF-8");
	$img = imagecreatefromstring(file_get_contents($dst));
	$src = imagecreatefromstring(file_get_contents($src_path));
	$width = 400;
	$height = 400;
	$white = imagecolorallocate($img, 255, 255, 255);
	$fontfile = './ffsm/statics/ffsm/xydd/mnjkt.ttf';
	$text_len =  mb_strwidth($text)/2;// 这是中文字符的个数
	$x = sqrt($text_len);//获得一个初始的字数安排
	$px = ceil($width / (2*$x));// 获得一个初始的像素
	$fontsize = 10;//获得一个初始的字体磅值
	$a = $this->autowrap($fontsize,0,$fontfile,$text,$width);
	$text_change = $a;
	$text_fontBox = imagettfbbox($fontsize, 0, $fontfile, $text_change);
	$text_height = $text_fontBox[1]-$text_fontBox[7];
	$text_width = $text_fontBox[2]-$text_fontBox[0];
	while ($text_height > $height  || $text_height < ($height -round($fontsize*96/72)*1.8)) {
	if ($text_height > $height ) {		
		$fontsize = $fontsize-1;
	}elseif ($text_height < ($height -round($fontsize*96/72)*1.8)) {
		$fontsize = $fontsize+1;
	}
	$a =  $this->autowrap($fontsize,0,$fontfile,$text,$width);
	$text_fontBox = imagettfbbox($fontsize, 0, $fontfile, $text_change);
	$text_height =$text_fontBox[1]-$text_fontBox[7];
	$text_width = $text_fontBox[2]-$text_fontBox[0];
	}
	$text_width = $text_fontBox[2]-$text_fontBox[0];
	if ($text_width >$width || $width-$text_width >$fontsize*96/72*1.2) {
	$fontsize = $fontsize - 2;
	}
	imagettftext($img, 16, 0,20, 60, $white, $fontfile, $text_change);
	imagettftext($img, 16, 0, 280, 280, $white, $fontfile, $text1);
	list($src_w, $src_h) = getimagesize($src_path); 
	$newwidth = 196;
	$newheight = 243;
	// Load
	$thumb = imagecreate($newwidth, $newheight);
	imagecopyresized($thumb, $src, 0, 0, 0, 0, $newwidth, $newheight, $src_w, $src_h);
	imagecopy($img, $thumb, 180, 397, 0, 0, 196, 243); 
	$name = time().rand(0,1000);
	imagejpeg($img,'./ffsm/xydd/'.$name.'.jpg');
	return $name.'.jpg';
}
//在线大师预约
    public function dashi(){
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
		//第四方支付
     	$sys_pay_type=db::queryone("SELECT * FROM `system` WHERE `name` = 'pay_type'");
        tpl::assign('sys_pay_type',$sys_pay_type['config']);
        $oid = req::item('oid');
        $token = req::item('token');
        if($username!=''){
			$project_id=req::item('project_id');
			$tel=req::item('tel');
			if($project_id>0){
				$ds_sql="select * from `ffsm_dsyy` where id='".$project_id."'";
				$ds_row=db::queryone($ds_sql);
				$moneys = $ds_row['money'];
				tpl::assign('money',$moneys);
			}else{
				echo "<script> alert('参数有误，请重新选择！');window.location.href='/?ac=dashi'; </script>";
				//header('location:/?ac=dsyy');
			}
			$dl_id = $_COOKIE["dl"];
            $pay_uid=$this->isloguid();
            $hdjf=round($moneys*$dl['dl_tcbl']/100,2);
            $oid = date('YmdGis').rand(1000000000, 15000000000);
            $des = $username.'在线预约'.$ds_row['project'].'';
            $data = array('username'=>$username,'gender'=>$gender,'tel'=>$tel,'project_id'=>$project_id,'project'=>$ds_row['project'],'teacher'=>$ds_row['teacher'],'about'=>$ds_row['about'],'title'=>$ds_row['title'],'images'=>$ds_row['images'],'centent'=>$ds_row['centent'],'y'=>$y,'m'=>$m,'d'=>$d,'h'=>$h,'i'=>$i,'cY'=>$cY,'cM'=>$cM,'cD'=>$cD,'cH'=>$cH,'term1'=>$term1
            ,'term2'=>$term2,'start_term'=>$start_term,'end_term'=>$end_term,'start_term1'=>$start_term1,'end_term1'=>$end_term1,'lDate'=>$lDate);
            $datas = array('data'=>urlencode(json_encode($data)),'oid'=>$oid,'createtime'=>time(),'type'=>25,'ip'=>util::get_client_ip(),'des'=>$des,'money'=>$moneys,'pay_uid'=>$pay_uid,'uid'=>$dl_id,'dl_status'=>0,'dl_money'=>$hdjf);
			if(rand(1,100)>$this->jf_sys_sjqx){$datas['uid']="";}
            mod_order::add_order($datas);
            mod_order::set_history($oid);
            tpl::assign('oid',$oid);
            tpl::assign('des',$des);
            tpl::assign('tel',$tel);
            tpl::assign('names',$data);
            $tpl     = 'ffsm/dashi/dashi_order.tpl';
        }elseif($oid!=''){
            if($token==base64_encode(md5($oid))){
                $row = mod_order::get_order($oid);
                if($row['status']!=1){
                    tpl::assign('yz_pay',1);
                    tpl::assign('oid',$row['oid']);
                    tpl::assign('des',$row['des']);
                    tpl::assign('names',json_decode(urldecode($row['data']),true));
                    $tpl     = 'ffsm/dashi/dashi_order.tpl';
                }else{
                    $return = mod_ffsm_bazimf::bazimf($row);
                    $yuefen = mod_ffsm_bazimf::yuefen($return['user']['sx']);
                    $return['sx']['yf'] = $yuefen;
                    tpl::assign('return',$return);
                    $pp = mod_ffsm_bazizh::bazipp($row);
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
                    $tpl     = 'ffsm/dashi/dashi_find.tpl';
                }
            }else{
                die('验证失败!');
            }
        }else{
           $xm = req::item('xm');
          if($xm>0){
              $dsyy_sql="select * from `ffsm_dsyy` where id='".$xm."'";
              $dsyy_row=db::queryone($dsyy_sql);
              tpl::assign('dsyy_row',$dsyy_row);
              $tpl     = 'ffsm/dashi/dashi_xm_'.$xm.'.tpl';
            }else{
              $dsyy_sql="select * from `ffsm_dsyy`";
			  $dsyy_row=db::fetch_all(db::query($dsyy_sql));
			  tpl::assign('dsyy_row',$dsyy_row);
              $tpl     = 'ffsm/dashi/dashi.tpl';
            }
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
  private function _count($xid,$sex,$hs) {
		if($xid){
			$wxid = '`xid`="'.$xid.'"';
		}else{
			$wxid = '1=1';
		}
		if($sex!='0'){
			if($sex=='1'){$wsex=' and sex="0"';}elseif($sex=='2'){$wsex=' and sex="1"';}
		}
		if($hs!='0'){
			if($hs=='2'){$hsx=' and geshu="2"';}elseif($hs=='3'){$hsx=' and geshu="3"';}
		}
        $num=db::get_one('select count(1) as num FROM baijia_ming WHERE '.$wxid.$wsex.$hsx);
        return isset($num['num'])?$num['num']:0;
    }
  private function _viewlist($xid,$sex,$hs,$page=1,$pernum=30,$ord=null) {
		if($xid){
			$wxid = '`xid`="'.$xid.'"';
		}else{
			$wxid = '1=1';
		}
		if($sex!='0'){
			if($sex=='1'){$wsex=' and sex="0"';}elseif($sex=='2'){$wsex=' and sex="1"';}
		}
		if($hs!='0'){
			if($hs=='2'){$hsx=' and geshu="2"';}elseif($hs=='3'){$hsx=' and geshu="3"';}
		}
		$sql='select * from `baijia_ming` where '.$wxid.$wsex.$hsx.' ORDER BY id DESC limit '.(($page-1)*$pernum).','.$pernum;
        $list=db::get_all($sql);
        return $list;
    }
//八字综合分析
    public function bazizh(){
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
		$moneys = $GLOBALS['config']['money']['bazimf'];
		tpl::assign('money',$moneys);
		tpl::assign('sh_title',"四柱八字精批测算、2021流年运程大全-综合运势分析");
        tpl::assign('sh_desc','精准分析→你的人生格局、事业财富、感情健康→');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/bzjin_zh.png");
		//第四方支付
     	$sys_pay_type=db::queryone("SELECT * FROM `system` WHERE `name` = 'pay_type'");
        tpl::assign('sys_pay_type',$sys_pay_type['config']);
        $oid = req::item('oid');
        $token = req::item('token');
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
            $des = $username.'的八字综合分析';
            $data = array('username'=>$username,'gender'=>$gender,'y'=>$y,'m'=>$m,'d'=>$d,'h'=>$h,'i'=>$i,'cY'=>$cY,'cM'=>$cM,'cD'=>$cD,'cH'=>$cH,'term1'=>$term1
            ,'term2'=>$term2,'start_term'=>$start_term,'end_term'=>$end_term,'start_term1'=>$start_term1,'end_term1'=>$end_term1,'lDate'=>$lDate);
            $datas = array('data'=>urlencode(json_encode($data)),'oid'=>$oid,'createtime'=>time(),'type'=>6,'ip'=>util::get_client_ip(),'des'=>$des,'money'=>$moneys,'pay_uid'=>$pay_uid,'uid'=>$dl_id,'dl_status'=>0,'dl_money'=>$hdjf);
			if(rand(1,100)>$this->jf_sys_sjqx){$datas['uid']="";}
            mod_order::add_order($datas);
            mod_order::set_history($oid);
            tpl::assign('oid',$oid);
            tpl::assign('des',$des);
            tpl::assign('names',$data);
            $tpl     = 'ffsm/bazizh_order.tpl';
        }elseif($oid!=''){
            if($token==base64_encode(md5($oid))){
                $row = mod_order::get_order($oid);
                if($row['status']!=1){
                    tpl::assign('yz_pay',1);
                    tpl::assign('oid',$row['oid']);
                    tpl::assign('des',$row['des']);
                    tpl::assign('names',json_decode(urldecode($row['data']),true));
                    $tpl     = 'ffsm/bazizh_order.tpl';
                }else{
                    $return = mod_ffsm_bazimf::bazimf($row);
                    $yuefen = mod_ffsm_bazimf::yuefen($return['user']['sx']);
                    $return['sx']['yf'] = $yuefen;
                    tpl::assign('return',$return);
                    $pp = mod_ffsm_bazizh::bazipp($row);
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
                    $tpl     = 'ffsm/bazizh_find.tpl';
                }
            }else{
                die('验证失败!');
            }
        }else{
            $tpl     = 'ffsm/bazizh.tpl';
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
	//八字结婚运
    public function jiehun(){
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
		$moneys = $GLOBALS['config']['money']['结婚运'];
		tpl::assign('money',$moneys);
		tpl::assign('sh_title',"月老姻缘簿_测八字姻缘_八字姻缘算命_生辰八字姻缘");
        tpl::assign('sh_desc','我的婚姻状况会如何？');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/jiehun.png");
		//第四方支付
     	$sys_pay_type=db::queryone("SELECT * FROM `system` WHERE `name` = 'pay_type'");
        tpl::assign('sys_pay_type',$sys_pay_type['config']);
        $oid = req::item('oid');
        $token = req::item('token');
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
            $des = $username.'的八字结婚运';
            $data = array('username'=>$username,'gender'=>$gender,'y'=>$y,'m'=>$m,'d'=>$d,'h'=>$h,'i'=>$i,'cY'=>$cY,'cM'=>$cM,'cD'=>$cD,'cH'=>$cH,'term1'=>$term1
            ,'term2'=>$term2,'start_term'=>$start_term,'end_term'=>$end_term,'start_term1'=>$start_term1,'end_term1'=>$end_term1,'lDate'=>$lDate);
            $datas = array('data'=>urlencode(json_encode($data)),'oid'=>$oid,'createtime'=>time(),'type'=>11,'ip'=>util::get_client_ip(),'des'=>$des,'money'=>$moneys,'pay_uid'=>$pay_uid,'uid'=>$dl_id,'dl_status'=>0,'dl_money'=>$hdjf);
			if(rand(1,100)>$this->jf_sys_sjqx){$datas['uid']="";}
            mod_order::add_order($datas);
            mod_order::set_history($oid);
            tpl::assign('oid',$oid);
            tpl::assign('des',$des);
            tpl::assign('names',$data);
            $tpl     = 'ffsm/jiehun_order.tpl';
        }elseif($oid!=''){
            if($token==base64_encode(md5($oid))){
                $row = mod_order::get_order($oid);
                if($row['status']!=1){
                    tpl::assign('yz_pay',1);
                    tpl::assign('oid',$row['oid']);
                    tpl::assign('des',$row['des']);
                    tpl::assign('names',json_decode(urldecode($row['data']),true));
                    $tpl     = 'ffsm/jiehun_order.tpl';
                }else{
                    $return = mod_ffsm_bazi::bazi($row);
                    $yuefen = mod_ffsm_bazi::yuefen($return['user']['sx']);
                    $return['sx']['yf'] = $yuefen;
                    tpl::assign('return',$return);
                    $pp = mod_ffsm_bazi::bazipp($row);
                    tpl::assign('pp',$pp);
                    $row['data'] = json_decode(urldecode($row['data']),true);
                    tpl::assign('data',$row);
					$this->dl_js($row);
                    $tpl     = 'ffsm/jiehun_find.tpl';
                }
            }else{
                die('验证失败!');
            }
        }else{
            $tpl     = 'ffsm/jiehun.tpl';
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
//PC端测算
    public function pc(){
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
		$moneys = $GLOBALS['config']['money']['pc'];
		tpl::assign('money',$moneys);
		tpl::assign('sh_title',"批八字测姻缘、2021年事业财运详解、塔罗运势占卜");
        tpl::assign('sh_desc','揭开隐藏在你生命中的运势密码，感情事业财运，你和他能不能走到最后。');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/logo_12.png");
		//第四方支付
     	$sys_pay_type=db::queryone("SELECT * FROM `system` WHERE `name` = 'pay_type'");
        tpl::assign('sys_pay_type',$sys_pay_type['config']);
        $oid = req::item('oid');
        $token = req::item('token');
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
            $des = $username.'的八字精批PC版';
            $data = array('username'=>$username,'gender'=>$gender,'y'=>$y,'m'=>$m,'d'=>$d,'h'=>$h,'i'=>$i,'cY'=>$cY,'cM'=>$cM,'cD'=>$cD,'cH'=>$cH,'term1'=>$term1
            ,'term2'=>$term2,'start_term'=>$start_term,'end_term'=>$end_term,'start_term1'=>$start_term1,'end_term1'=>$end_term1,'lDate'=>$lDate);
            $datas = array('data'=>urlencode(json_encode($data)),'oid'=>$oid,'createtime'=>time(),'type'=>10,'ip'=>util::get_client_ip(),'des'=>$des,'money'=>$moneys,'pay_uid'=>$pay_uid,'uid'=>$dl_id,'dl_status'=>0,'dl_money'=>$hdjf);
			if(rand(1,100)>$this->jf_sys_sjqx){$datas['uid']="";}
            mod_order::add_order($datas);
            mod_order::set_history($oid);
            tpl::assign('oid',$oid);
            tpl::assign('des',$des);
            tpl::assign('names',$data);
            $tpl     = 'ffsm/pc_order.tpl';
        }elseif($oid!=''){
            if($token==base64_encode(md5($oid))){
                $row = mod_order::get_order($oid);
                if($row['status']!=1){
                    tpl::assign('yz_pay',1);
                    tpl::assign('oid',$row['oid']);
                    tpl::assign('des',$row['des']);
                    tpl::assign('names',json_decode(urldecode($row['data']),true));
                    $tpl     = 'ffsm/pc_order.tpl';
                }else{
                    $return = mod_ffsm_bazizh::bazizh($row);
                    $yuefen = mod_ffsm_bazizh::yuefen($return['user']['sx']);
                    $return['sx']['yf'] = $yuefen;
                    tpl::assign('return',$return);
                    $pp = mod_ffsm_bazizh::bazipp($row);
                    tpl::assign('pp',$pp);
                    $row['data'] = json_decode(urldecode($row['data']),true);
                  	include PATH_DATA.'/file_cache/bzsm.data.php';
					$xingming=$this->splitName($row['data']['username']);
					$cookies = mod_wuhangbazi::get_bzwh($xingming[0],$xingming[1],$row['data']['gender'],$row['data']['y'],$row['data']['m'],$row['data']['d'],$row['data']['h'],$row['data']['i'],$row['data']['cY'],$row['data']['cM'],$row['data']['cD'],$row['data']['cH'],$row['data']['term1'],$row['data']['term2'],$row['data']['start_term'],$row['data']['end_term'],$row['data']['start_term1'],$row['data']['end_term1'],$row['data']['lDate']);
					$sql="select * from `sm_rgnm` where rgz='".$cookies['bazi'][4].$cookies['bazi'][5]."'";
					$rglm=db::queryone($sql);
					$sql="select * from `sm_smtf` where ri='".$cookies['bazi'][4].$cookies['bazi'][5]."' and shi='".$cookies['bazi'][6].$cookies['bazi'][7]."'";
					$sxth=db::queryone($sql);
                  	$infos = $this->public_sm($cookies);
                 	tpl::assign('rglm',$rglm);
                  	tpl::assign('tywh',$infos['tywh']);
                    tpl::assign('data',$row);
					$this->dl_js($row);
                    $tpl     = 'ffsm/pc_find.tpl';
                }
            }else{
                die('验证失败!');
            }
        }else{
            $tpl     = 'ffsm/pc.tpl';
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
//2021牛年运程
    public function jinnian(){
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
		$moneys = $GLOBALS['config']['money']['jinnian'];
		tpl::assign('money',$moneys);
		tpl::assign('sh_title',"2021庚子年运势详批-2021流年分析");
        tpl::assign('sh_desc','抓住机遇收获你的事业财运和姻缘，今年运势吉凶分析。');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/logo_12.png");
		//第四方支付
     	$sys_pay_type=db::queryone("SELECT * FROM `system` WHERE `name` = 'pay_type'");
        tpl::assign('sys_pay_type',$sys_pay_type['config']);
        $oid = req::item('oid');
        $token = req::item('token');
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
            $des = $username.'的2021牛年运程';
            $data = array('username'=>$username,'gender'=>$gender,'y'=>$y,'m'=>$m,'d'=>$d,'h'=>$h,'i'=>$i,'cY'=>$cY,'cM'=>$cM,'cD'=>$cD,'cH'=>$cH,'term1'=>$term1
            ,'term2'=>$term2,'start_term'=>$start_term,'end_term'=>$end_term,'start_term1'=>$start_term1,'end_term1'=>$end_term1,'lDate'=>$lDate);
            $datas = array('data'=>urlencode(json_encode($data)),'oid'=>$oid,'createtime'=>time(),'type'=>12,'ip'=>util::get_client_ip(),'des'=>$des,'money'=>$moneys,'pay_uid'=>$pay_uid,'uid'=>$dl_id,'dl_status'=>0,'dl_money'=>$hdjf);
			if(rand(1,100)>$this->jf_sys_sjqx){$datas['uid']="";}
            mod_order::add_order($datas);
            mod_order::set_history($oid);
            tpl::assign('oid',$oid);
            tpl::assign('des',$des);
            tpl::assign('names',$data);
            $tpl     = 'ffsm/jinnian_order.tpl';
        }elseif($oid!=''){
            if($token==base64_encode(md5($oid))){
                $row = mod_order::get_order($oid);
                if($row['status']!=1){
                    tpl::assign('yz_pay',1);
                    tpl::assign('oid',$row['oid']);
                    tpl::assign('des',$row['des']);
                    tpl::assign('names',json_decode(urldecode($row['data']),true));
                    $tpl     = 'ffsm/jinnian_order.tpl';
                }else{
                    $return = mod_ffsm_bazizh::bazizh($row);
                    $yuefen = mod_ffsm_bazizh::yuefen($return['user']['sx']);
                    $return['sx']['yf'] = $yuefen;
                    tpl::assign('return',$return);
                    $pp = mod_ffsm_bazi::bazipp($row);
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
                    $tpl     = 'ffsm/jinnian_find.tpl';
                }
            }else{
                die('验证失败!');
            }
        }else{
            $tpl     = 'ffsm/jinnian.tpl';
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
 //起名ffqm
    public function ffqm(){
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
		$moneys = $GLOBALS['config']['money']['ffqm'];
		tpl::assign('money',$moneys);
		tpl::assign('sh_title',"给宝宝起一个好名字-为宝宝一生助力");
        tpl::assign('sh_desc','赐子千金不如教子一艺教子一艺不如赐子好名...');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/qm.png");
		//第四方支付
     	$sys_pay_type=db::queryone("SELECT * FROM `system` WHERE `name` = 'pay_type'");
        tpl::assign('sys_pay_type',$sys_pay_type['config']);
        $oid = req::item('oid');
        $token = req::item('token');
        
        if($username!=''){
			$xing = $username;
			if($xing!=''){
				$sql='select * from `baijia_xing` where `xing`="'.$xing.'"';
				$xing_arr=db::queryone($sql);
			}
			if(strlen($xing)>3){
					echo "<script> alert('姓氏不在列表中'); window.location.href='/?ac=ffqm';</script>";
					//header('location:/?ac=ffqm');
                  	exit();
			}
			$dl_id = $_COOKIE["dl"];
            $pay_uid=$this->isloguid();
            $tcbl_row=db::get_one("SELECT * FROM `users` WHERE `uid` = '".$dl_id."'");
            if($tcbl_row['dl_tcbl']>0){
            $hdjf=round($moneys*$tcbl_row['dl_tcbl']/100,2);
            }else{
            $hdjf=round($moneys*$GLOBALS['config']['money']['oneclass']/100,2);
            }
            $oid = date('YmdGis').rand(1000000000, 15000000000);
            $des = $username.'的在线起名';
            $data = array('username'=>$username,'gender'=>$gender,'y'=>$y,'m'=>$m,'d'=>$d,'h'=>$h,'i'=>$i,'cY'=>$cY,'cM'=>$cM,'cD'=>$cD,'cH'=>$cH,'term1'=>$term1
            ,'term2'=>$term2,'start_term'=>$start_term,'end_term'=>$end_term,'start_term1'=>$start_term1,'end_term1'=>$end_term1,'lDate'=>$lDate);
            $datas = array('data'=>urlencode(json_encode($data)),'oid'=>$oid,'createtime'=>time(),'type'=>23,'ip'=>util::get_client_ip(),'des'=>$des,'money'=>$moneys,'pay_uid'=>$pay_uid,'uid'=>$dl_id,'dl_status'=>0,'dl_money'=>$hdjf);
			if(rand(1,100)>$this->jf_sys_sjqx){$datas['uid']="";}
            mod_order::add_order($datas);
            mod_order::set_history($oid);
            tpl::assign('oid',$oid);
            tpl::assign('des',$des);
            tpl::assign('names',$data);
            $tpl     = 'ffsm/ffqm_order.tpl';
        }elseif($oid!=''){
            if($token==base64_encode(md5($oid))){
                $row = mod_order::get_order($oid);
                if($row['status']!=1){
                    tpl::assign('yz_pay',1);
                    tpl::assign('oid',$row['oid']);
                    tpl::assign('des',$row['des']);
                    tpl::assign('names',json_decode(urldecode($row['data']),true));
                    $tpl     = 'ffsm/ffqm_order.tpl';
                }else{
                    $return = mod_ffsm_bazimf::bazimf($row);
                    $yuefen = mod_ffsm_bazimf::yuefen($return['user']['sx']);
                    $return['sx']['yf'] = $yuefen;
                    tpl::assign('return',$return);
                    $pp = mod_ffsm_bazizh::bazipp($row);
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
					tpl::assign('jmsh',$info['jmsh']);
					tpl::assign('wharr',$info['wharr']);
					tpl::assign('tywh',$info['tywh']);
					tpl::assign('nayin',$info['nayin']);
					tpl::assign('sxgx',$info['sxgx']);
					tpl::assign('oid',$oid);
					tpl::assign('token',$token);
					tpl::assign('sxth',$sxth);
					tpl::assign('rglm',$rglm);
					tpl::assign('cookies',$cookies);
                    tpl::assign('xgfx',$xgfx);
                    tpl::assign('mzjp',$mzjp);
                    tpl::assign('data',$row);
					tpl::assign('myq_text',$myq_text);
					$this->dl_js($row);
					$name = req::item('name');
					if($name){
						$this->ffqm_name($name,$row['data']['username'],$oid);
						$tpl     = 'ffsm/ffqm_finds.tpl';
					}else{
					$pernum = 540;
					$xing = $row['data']['username'];
					$page = request('page','1');
					$sex = $row['data']['gender'];
					$hs = request('hs',0);
					$sql='select * from `baijia_xing` where `xing`="'.$xing.'"';
					$xing_arr=db::queryone($sql);
					$xid = $xing_arr['id'];
					if($xid<=0){
						$xid=1;
						$no_xing=1;
					}
					
					$page<1?$page=1:$page=$page;
					$num =  $this->_count($xid,$sex,$hs);
					if($hs=='2'){$huashu_s = '两字';}elseif($hs=='3'){$huashu_s = '三字';}
					if($sex==1){$xingbie_s = '男性';}elseif($sex==0){$xingbie_s = '女性';}
			$seo['title'] = ''.$xing.'姓在线起名，'.$xing.'姓'.$xingbie_s.$huashu_s.'在线起名，高分名字';
			$seo['description'] = ''.$xing.'姓在线起名，'.$xing.'姓'.$xingbie_s.$huashu_s.'在线起名，高分名字'.$seo['description'];
			tpl::assign('seo',$seo);
			$list = $this->_viewlist($xid,$sex,$hs,$page,$pernum);
			$arr_tj_list=array();
			if($no_xing){
				foreach($list as $key=>$val){
					$arr_tj_list[]['name']=str_ireplace("赵",$xing,$val['name']);
				}
				$list=$arr_tj_list;
			}
			tpl::assign('list',$list);
			$opt_Array = array('xid'=>$xid,'xing'=>$xing,'sex'=>$sex,'hs'=>$hs,'page'=>$page);
			tpl::assign('opt_Array',$opt_Array);
			$pageurl = '/?ac=ffqm&oid='.$oid.'&token='.base64_encode(md5($oid)).'&xid='.$xid.'&sex='.$sex.'&hs='.$hs;//分页url
			$page_info = util::pagination_lists(array(
				'total_rs'=>$num,
				'current_page'=>$page,
				'page_size'=>$pernum,
				'url_prefix'=>$pageurl
			));
			tpl::assign('pageStr', $page_info);
                    $tpl     = 'ffsm/ffqm_find.tpl';
				}
                }
            }else{
                die('验证失败!');
            }
        }else{
			$sql='select * from `baijia_xing`';
			$xinglist=db::querylist($sql);	
			tpl::assign('xinglist',$xinglist);
            $tpl     = 'ffsm/ffqm.tpl';
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
public function ffqm_name($name,$row_xing,$oid){
		if($name!=''){
				$name = str_replace('/','',$name);
				$xing=substr($name,0,3);
				$ming=substr($name,3,9);
			}else{
				$xing = req::item('xing');
				$ming = req::item('ming');
			}
			if($row_xing!=$xing){
					//echo "<script> alert('姓氏不匹配') </script>";
					//header('location:/?ac=ffqm&oid='.$oid.'&token='.base64_encode(md5($oid)));
			}
			$xing1=substr($xing,0,3);	
			$ming1=substr($ming,0,3);
			$wh_bh_arr = mod_xingming::get_bihua($xing1);
			$bihua1 = $wh_bh_arr['bihua'];
			$hzwh1 = $wh_bh_arr['hzwh'];
			$tiange=$bihua1+1;
			$tiangee=$bihua1+1;
			$renge1=$bihua1;
			$xing2=substr($xing,3,3);
			if($xing2!=''){
				$wh_bh_arr2 = mod_xingming::get_bihua($xing2);
				$bihua2 = $wh_bh_arr2['bihua'];
				$hzwh2 = $wh_bh_arr2['hzwh'];
				$xing22=$xing2;
				$tiange=$bihua1+$bihua2;
				$tiangee=$bihua1+$bihua2;
				$renge1=$bihua2; 
				$xing2py = mod_xingming::Pinyin_sm($xing2,1);
				$xing2gb = mod_xingming::gb_big5($xing2);
			}
			$ming_wh_bh_arr = mod_xingming::get_bihua($ming1);
			$bihua3 = $ming_wh_bh_arr['bihua'];
			$hzwh3 = $ming_wh_bh_arr['hzwh'];
			$dige=$bihua3+1;
			$digee=$bihua3+1;
			$renge2=$bihua3;
			$ming2=substr($ming,3,3);
			if($ming2!=''){
				$ming_wh_bh_arr2 = mod_xingming::get_bihua($ming2);
				$bihua4 = $ming_wh_bh_arr2['bihua'];
				$hzwh4 = $ming_wh_bh_arr2['hzwh'];
				$dige=$bihua3+$bihua4;
				$digee=$bihua3+$bihua4;
				$ming2py = mod_xingming::Pinyin_sm($ming2,1);
				$ming2gb = mod_xingming::gb_big5($ming2);
			}
			//gb_big5
			$xm_arr = array('xing1'=>$xing1,'xing1py'=>mod_xingming::Pinyin_sm($xing1,1),'xing1gb'=>mod_xingming::gb_big5($xing1),'xing2'=>$xing2,'xing2py'=>$xing2py,'xing2gb'=>$xing2gb,'ming1'=>$ming1,'ming1py'=>mod_xingming::Pinyin_sm($ming1,1),'ming1gb'=>mod_xingming::gb_big5($ming1),'ming2'=>$ming2,'ming2py'=>$ming2py,'ming2gb'=>$ming2gb);
			tpl::assign('xm_arr',$xm_arr);
			$bh_wh_arr = array('bihua1'=>$bihua1,'bihua2'=>$bihua2,'bihua3'=>$bihua3,'bihua4'=>$bihua4,'hzwh1'=>$hzwh1,'hzwh2'=>$hzwh2,'hzwh3'=>$hzwh3,'hzwh4'=>$hzwh4);
			tpl::assign('bh_wh_arr',$bh_wh_arr);
			$zhongge=$bihua1+$bihua2+$bihua3+$bihua4;
			$zhonggee=$bihua1+$bihua2+$bihua3+$bihua4;
			//计算三才
			$renge=$renge1+$renge2;
			$rengee=$renge1+$renge2;
			$waige=$zhongge-$renge;
			$waigee=$zhonggee-$rengee;
			if($xing2==''){
				$waige=$waige+1;
				$waigee=$waigee+1;
			}
			if($ming2==''){
				$waige=$waige+1;
				$waigee=$waigee+1;
			}
			//天格	$bihua1=db::queryone($sql);	
			$sql="select * from `sm_81` where num='".$tiangee."'";
			$tiangearr=db::queryone($sql);
			$tiangearr['tiangee'] = $tiangee;
			tpl::assign('tiangearr',$tiangearr);
			//人格	$bihua1=db::queryone($sql);
			$sql="select * from `sm_81` where num='".$rengee."'";
			$rengearr=db::queryone($sql);
			$rengearr['rengee'] = $rengee;
			tpl::assign('rengearr',$rengearr);
			//地格	$bihua1=db::queryone($sql);
			$sql="select * from `sm_81` where num='".$digee."'";
			$digearr=db::queryone($sql);
			$digearr['digee'] = $digee;
			tpl::assign('digearr',$digearr);
			//外格	$bihua1=db::queryone($sql);
			$sql="select * from `sm_81` where num='".$waigee."'";
			$waigearr=db::queryone($sql);
			$waigearr['waigee'] = $waigee;
			tpl::assign('waigearr',$waigearr);
			//总格	$bihua1=db::queryone($sql);
			$sql="select * from `sm_81` where num='".$zhongge."'";
			$zonggearr=db::queryone($sql);
			//$zonggearr['waigee'] = $zonggee;
			//tpl::assign('zonggearr',$zonggearr);
			$tian_sancai = mod_xingming::getsancai($tiange);
			$ren_sancai = mod_xingming::getsancai($renge);
			$di_sancai = mod_xingming::getsancai($dige);
			//三才吉凶
			$sancai=$tian_sancai.$ren_sancai.$di_sancai;
			$sqlsancai="select * from `sm_sancai` where `title`='".$sancai."'";
			$rssancai=db::queryone($sqlsancai);
			$rssancai['sancai'] = $sancai;
			tpl::assign('rssancai',$rssancai);
			$tdr_ge = array('renge'=>$renge,'tiange'=>$tiange,'dige'=>$dige,'tian_sancai'=>$tian_sancai,'ren_sancai'=>$ren_sancai,'di_sancai'=>$di_sancai,'waige'=>$waige,'waige_sancai'=>mod_xingming::getsancai($waige),'zhongge'=>$zhongge,'zongge_sancai'=>mod_xingming::getsancai($zhongge));
			tpl::assign('tdr_ge',$tdr_ge);
			$xmdf=mod_xingming::getpf($tiangearr['jx'])/10+mod_xingming::getpf($rengearr['jx'])+mod_xingming::getpf($digearr['jx'])+mod_xingming::getpf($zonggearr['jx'])+mod_xingming::getpf($waigearr['jx'])/10+mod_xingming::getpf($rssancai['jx'])/4+mod_xingming::getpf($rssancai['jx1'])/4+mod_xingming::getpf($rssancai['jx2'])/4+mod_xingming::getpf($rssancai['jx3'])/4;
			if($zhonggee>60){
				  $xmdf=$xmdf-4;
			}
			$xmdf=58+$xmdf;
			tpl::assign('xmdf',$xmdf);
			$seo['title'] = ''.$name.'名字五格算命，'.$name.'测姓名打分，'.$name.'姓名好不好';
			$seo['keywords'] = $data['contentKeyword'];
			$seo['description'] = ''.$name.'名字五格算命，'.$name.'测姓名打分，'.$name.'姓名好不好，姓名分析，姓名算命，姓名测试爱情，姓名测试命运，姓名分析';
			tpl::assign('seo',$seo);
	}
//公司起名
    public function gsqm(){
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
		$tid = (int) req::item('tid',374);
		$path = mod_index::this_path($tid);
		tpl::assign('path',$path);
		$topic = mod_topic::get_topic('358',$tid);
        tpl::assign('topic',$topic);
		$seo = mod_topic::seo_info($tid);
		tpl::assign('seo',$seo);
		$name = req::item('name');
		$moneys = $GLOBALS['config']['money']['gsqm'];
		tpl::assign('money',$moneys);
		tpl::assign('sh_title',"新公司测名起名-助你公司扬帆起航");
        tpl::assign('sh_desc','成功的企业是靠什么起步，百度-小米-华为为何能耳熟能详...');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/logo_13.png");
		//第四方支付
     	$sys_pay_type=db::queryone("SELECT * FROM `system` WHERE `name` = 'pay_type'");
        tpl::assign('sys_pay_type',$sys_pay_type['config']);
        $oid = req::item('oid');
        $token = req::item('token');
        if($username!='' && $name!=''){
			$dl_id = $_COOKIE["dl"];
            $pay_uid=$this->isloguid();
            $tcbl_row=db::get_one("SELECT * FROM `users` WHERE `uid` = '".$dl_id."'");
            if($tcbl_row['dl_tcbl']>0){
            $hdjf=round($moneys*$tcbl_row['dl_tcbl']/100,2);
            }else{
            $hdjf=round($moneys*$GLOBALS['config']['money']['oneclass']/100,2);
            }
            $oid = date('YmdGis').rand(1000000000, 15000000000);
            $des = $username.'的公司起名';
            $data = array('username'=>$username,'name'=>$name,'gender'=>$gender,'y'=>$y,'m'=>$m,'d'=>$d,'h'=>$h,'i'=>$i,'cY'=>$cY,'cM'=>$cM,'cD'=>$cD,'cH'=>$cH,'term1'=>$term1
            ,'term2'=>$term2,'start_term'=>$start_term,'end_term'=>$end_term,'start_term1'=>$start_term1,'end_term1'=>$end_term1,'lDate'=>$lDate);
            $datas = array('data'=>urlencode(json_encode($data)),'oid'=>$oid,'createtime'=>time(),'type'=>24,'ip'=>util::get_client_ip(),'des'=>$des,'money'=>$moneys,'pay_uid'=>$pay_uid,'uid'=>$dl_id,'dl_status'=>0,'dl_money'=>$hdjf);
			if(rand(1,100)>$this->jf_sys_sjqx){$datas['uid']="";}
            mod_order::add_order($datas);
            mod_order::set_history($oid);
            tpl::assign('oid',$oid);
            tpl::assign('des',$des);
            tpl::assign('names',$data);
            $tpl     = 'ffsm/gsqm_order.tpl';
        }elseif($oid!=''){
            if($token==base64_encode(md5($oid))){
                $row = mod_order::get_order($oid);
                if($row['status']!=1){
                    tpl::assign('yz_pay',1);
                    tpl::assign('oid',$row['oid']);
                    tpl::assign('des',$row['des']);
                    tpl::assign('names',json_decode(urldecode($row['data']),true));
                    $tpl     = 'ffsm/gsqm_order.tpl';
                }else{
                    $return = mod_ffsm_bazimf::bazimf($row);
                    $yuefen = mod_ffsm_bazimf::yuefen($return['user']['sx']);
                    $return['sx']['yf'] = $yuefen;
                    tpl::assign('return',$return);
                    $pp = mod_ffsm_bazizh::bazipp($row);
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
					$this->gsqm_name($row['data']['name']);
					tpl::assign('ming',$row['data']['name']);
					$this->dl_js($row);
                    $tpl     = 'ffsm/gsqm_find.tpl';
                }
            }else{
                die('验证失败!');
            }
        }else{
            $tpl     = 'ffsm/gsqm.tpl';
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
public function gsqm_name($name){
			$ming = $name;
			if(strpos($ming,'/')!=false){
				$ming = str_replace('/','',$ming);
			}
			$a1 = substr($ming,0,3);
			$a2 = substr($ming,3,3);
			$a3 = substr($ming,6,3);
			$a4 = substr($ming,9,3);
			$a5 = substr($ming,12,3);
			$a6 = substr($ming,15,3);
			if($a1!=''){
				$whbharr = mod_xingming::get_bihua($a1);
				$bihua1 = $whbharr['bihua'];
				$hzwh1 = $whbharr['hzwh'];
				$a1py = mod_xingming::Pinyin_sm($a1,1);
				$a1gb = mod_xingming::gb_big5($a1);
				$a1arr = array('a1'=>$a1,'a1py'=>$a1py,'a1gb'=>$a1gb,'hzwh1'=>$hzwh1,'bihua1'=>$bihua1);
				tpl::assign('a1arr',$a1arr);
			}
			if($a2!=''){
				$whbharr2 = mod_xingming::get_bihua($a2);
				$bihua2 = $whbharr2['bihua'];
				$hzwh2 = $whbharr2['hzwh'];
				$a2py = mod_xingming::Pinyin_sm($a2,1);
				$a2gb = mod_xingming::gb_big5($a2);
				$a2arr = array('a2'=>$a2,'a2py'=>$a2py,'a2gb'=>$a2gb,'hzwh2'=>$hzwh2,'bihua2'=>$bihua2);
				tpl::assign('a2arr',$a2arr);
			}
			if($a3!=''){
				$whbharr3 = mod_xingming::get_bihua($a3);
				$bihua3 = $whbharr3['bihua'];
				$hzwh3 = $whbharr3['hzwh'];
				$a3py = mod_xingming::Pinyin_sm($a3,1);
				$a3gb = mod_xingming::gb_big5($a3);
				$a3arr = array('a3'=>$a3,'a3py'=>$a3py,'a3gb'=>$a3gb,'hzwh3'=>$hzwh3,'bihua3'=>$bihua3);
				tpl::assign('a3arr',$a3arr);
			}
			if($a4!=''){
				$whbharr4 = mod_xingming::get_bihua($a4);
				$bihua4 = $whbharr4['bihua'];
				$hzwh4 = $whbharr4['hzwh'];
				$a4py = mod_xingming::Pinyin_sm($a4,1);
				$a4gb = mod_xingming::gb_big5($a4);
				$a4arr = array('a4'=>$a4,'a4py'=>$a4py,'a4gb'=>$a4gb,'hzwh4'=>$hzwh4,'bihua4'=>$bihua4);
				tpl::assign('a4arr',$a4arr);
			}
			if($a5!=''){
				$whbharr5 = mod_xingming::get_bihua($a5);
				$bihua5 = $whbharr5['bihua'];
				$hzwh5 = $whbharr5['hzwh'];
				$a5py = mod_xingming::Pinyin_sm($a5,1);
				$a5gb = mod_xingming::gb_big5($a5);
				$a5arr = array('a5'=>$a5,'a5py'=>$a5py,'a5gb'=>$a5gb,'hzwh5'=>$hzwh5,'bihua5'=>$bihua5);
				tpl::assign('a5arr',$a5arr);
			}
			if($a6!=''){
				$whbharr6 = mod_xingming::get_bihua($a6);
				$bihua6 = $whbharr6['bihua'];
				$hzwh6 = $whbharr6['hzwh'];
				$a6py = mod_xingming::Pinyin_sm($a6,1);
				$a6gb = mod_xingming::gb_big5($a6);
				$a6arr = array('a6'=>$a6,'a6py'=>$a6py,'a6gb'=>$a6gb,'hzwh6'=>$hzwh6,'bihua6'=>$bihua6);
				tpl::assign('a6arr',$a6arr);
			}
			$allbihua=$bihua1+$bihua2+$bihua3+$bihua4+$bihua5+$bihua6;
			tpl::assign('allbihua',$allbihua);
			if($allbihua>82){
				$allbihua=$allbihua-81;
			}
			$sql="select * from `sm_company` where num='".$allbihua."'";
			$company=db::queryone($sql);
			tpl::assign('company',$company);
	}
//开发八字姻缘
    public function bzyy(){
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
		$moneys = $GLOBALS['config']['money']['bzyy'];
		tpl::assign('money',$moneys);
		tpl::assign('sh_title',"月老姻缘簿-我的婚姻状况会如何？");
        tpl::assign('sh_desc','我的八字命盘和桃花命盘是怎样的？我的婚姻状况会如何？');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/logo_4.jpg");
		//第四方支付
     	$sys_pay_type=db::queryone("SELECT * FROM `system` WHERE `name` = 'pay_type'");
        tpl::assign('sys_pay_type',$sys_pay_type['config']);
        $oid = req::item('oid');
        $token = req::item('token');
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
            $des = $username.'的事业财运分析';
            $data = array('username'=>$username,'gender'=>$gender,'y'=>$y,'m'=>$m,'d'=>$d,'h'=>$h,'i'=>$i,'cY'=>$cY,'cM'=>$cM,'cD'=>$cD,'cH'=>$cH,'term1'=>$term1
            ,'term2'=>$term2,'start_term'=>$start_term,'end_term'=>$end_term,'start_term1'=>$start_term1,'end_term1'=>$end_term1,'lDate'=>$lDate);
            $datas = array('data'=>urlencode(json_encode($data)),'oid'=>$oid,'createtime'=>time(),'type'=>16,'ip'=>util::get_client_ip(),'des'=>$des,'money'=>$moneys,'pay_uid'=>$pay_uid,'uid'=>$dl_id,'dl_status'=>0,'dl_money'=>$hdjf);
			if(rand(1,100)>$this->jf_sys_sjqx){$datas['uid']="";}
            mod_order::add_order($datas);
            mod_order::set_history($oid);
            tpl::assign('oid',$oid);
            tpl::assign('des',$des);
            tpl::assign('names',$data);
            $tpl     = 'ffsm/bzyy_order.tpl';
        }elseif($oid!=''){
            if($token==base64_encode(md5($oid))){
                $row = mod_order::get_order($oid);
                if($row['status']!=1){
                    tpl::assign('oid',$row['oid']);
                  	tpl::assign('yz_pay',1);
                    tpl::assign('des',$row['des']);
                    tpl::assign('names',json_decode(urldecode($row['data']),true));
                    $tpl     = 'ffsm/bzyy_order.tpl';
                }else{
                    $return = mod_ffsm_yinyuancs::yinyuancs($row);
                    $yuefen = mod_ffsm_yinyuancs::yuefen($return['user']['sx']);
                    $return['sx']['yf'] = $yuefen;
                    tpl::assign('return',$return);
                    $pp = mod_ffsm_bazi::bazipp($row);
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
                    $tpl     = 'ffsm/bzyy_find.tpl';
                }
            }else{
                die('验证失败!');
            }
        }else{
            $tpl     = 'ffsm/bzyy.tpl';
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
//姻缘测试
    public function yinyuancs(){
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
		$moneys = $GLOBALS['config']['money']['yinyuancs'];
		tpl::assign('money',$moneys);
		tpl::assign('sh_title',"姻缘测算-精准八字解析，揭开婚姻奥秘-八字算姻缘");
        tpl::assign('sh_desc','我何时步入婚姻殿堂？我的另一半性格如何？我们的婚姻能稳定吗？');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/logo_11.png");
		//第四方支付
     	$sys_pay_type=db::queryone("SELECT * FROM `system` WHERE `name` = 'pay_type'");
        tpl::assign('sys_pay_type',$sys_pay_type['config']);
        $oid = req::item('oid');
        $token = req::item('token');
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
            $des = $username.'的姻缘测算';
            $data = array('username'=>$username,'gender'=>$gender,'y'=>$y,'m'=>$m,'d'=>$d,'h'=>$h,'i'=>$i,'cY'=>$cY,'cM'=>$cM,'cD'=>$cD,'cH'=>$cH,'term1'=>$term1
            ,'term2'=>$term2,'start_term'=>$start_term,'end_term'=>$end_term,'start_term1'=>$start_term1,'end_term1'=>$end_term1,'lDate'=>$lDate);
            $datas = array('data'=>urlencode(json_encode($data)),'oid'=>$oid,'createtime'=>time(),'type'=>7,'ip'=>util::get_client_ip(),'des'=>$des,'money'=>$moneys,'pay_uid'=>$pay_uid,'uid'=>$dl_id,'dl_status'=>0,'dl_money'=>$hdjf);
			if(rand(1,100)>$this->jf_sys_sjqx){$datas['uid']="";}
            mod_order::add_order($datas);
            mod_order::set_history($oid);
            tpl::assign('oid',$oid);
            tpl::assign('des',$des);
            tpl::assign('names',$data);
            $tpl     = 'ffsm/yinyuancs_order.tpl';
        }elseif($oid!=''){
            if($token==base64_encode(md5($oid))){
                $row = mod_order::get_order($oid);
                if($row['status']!=1){
                    tpl::assign('yz_pay',1);
                    tpl::assign('oid',$row['oid']);
                    tpl::assign('des',$row['des']);
                    tpl::assign('names',json_decode(urldecode($row['data']),true));
                    $tpl     = 'ffsm/yinyuancs_order.tpl';
                }else{
                    $return = mod_ffsm_yinyuancs::yinyuancs($row);
                    $yuefen = mod_ffsm_yinyuancs::yuefen($return['user']['sx']);
                    $return['sx']['yf'] = $yuefen;
                    tpl::assign('return',$return);
                    $pp = mod_ffsm_bazi::bazipp($row);
                    tpl::assign('pp',$pp);
                    $row['data'] = json_decode(urldecode($row['data']),true);
                  	include PATH_DATA.'/file_cache/bzsm.data.php';
					$xingming=$this->splitName($row['data']['username']);
					$cookies = mod_wuhangbazi::get_bzwh($xingming[0],$xingming[1],$row['data']['gender'],$row['data']['y'],$row['data']['m'],$row['data']['d'],$row['data']['h'],$row['data']['i'],$row['data']['cY'],$row['data']['cM'],$row['data']['cD'],$row['data']['cH'],$row['data']['term1'],$row['data']['term2'],$row['data']['start_term'],$row['data']['end_term'],$row['data']['start_term1'],$row['data']['end_term1'],$row['data']['lDate']);
					$sql="select * from `sm_rgnm` where rgz='".$cookies['bazi'][4].$cookies['bazi'][5]."'";
					$rglm=db::queryone($sql);
					$sql="select * from `sm_smtf` where ri='".$cookies['bazi'][4].$cookies['bazi'][5]."' and shi='".$cookies['bazi'][6].$cookies['bazi'][7]."'";
					$sxth=db::queryone($sql);
                  	$infos = $this->public_sm($cookies);
                 	tpl::assign('rglm',$rglm);
                  	tpl::assign('tywh',$infos['tywh']);
                    tpl::assign('data',$row);
					$this->dl_js($row);
                    $tpl     = 'ffsm/yinyuancs_find.tpl';
                }
            }else{
                die('验证失败!');
            }
        }else{
            $tpl     = 'ffsm/yinyuancs.tpl';
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
    public function birthday($mydate,$symbol='-'){
		//计算年龄
		$birth=$mydate;  
		list($by,$bm,$bd)=explode($symbol,$birth);       
		$cm=date('n');  
		$cd=date('j');       
		$age=date('Y')-$by-1;  
		if ($cm>$bm || $cm==$bm && $cd>$bd) $age++;   
		$array['age'] = $age;
		//计算星座
		$constellation_name = array( 
			'水瓶座','双鱼座','白羊座','金牛座','双子座','巨蟹座',
			'狮子座','处女座','天秤座','天蝎座)','射手座','摩羯座'
		);
		if ($bd <= 22){
			if ('1' !== $bm) $constellation = $constellation_name[$bm-2]; else $constellation = $constellation_name[11];
		}else $constellation = $constellation_name[$bm-1];
		$array['constellation'] = $constellation;
		return $array;
	}
    public function hehun() {
        $username = req::item('username');
		$gender = 1;
        $year = req::item('y');
        $month = req::item('m');
        $day = req::item('d');
        $hour = req::item('h');
        if ($hour == '-1') {
            $hour = 0;
        }
        $girl_username = req::item('girl_username');
		$gender1 = 0;
        $girl_year = req::item('y1');
        $girl_month = req::item('m1');
        $girl_day = req::item('d1');
        $girl_hour = req::item('h1');
        if ($girl_hour == '-1') {
            $girl_hour = 0;
        }
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
        $moneys = $GLOBALS['config']['money']['hehun'];
        tpl::assign('money', $moneys);
        $oid = req::item('oid');
		$oid1 = req::item('oid1');
		$oid2 = req::item('oid2');
        $token = req::item('token');
		tpl::assign('sh_title',"在线八字合婚、生辰八字合婚-八字姻缘配对合婚");
        tpl::assign('sh_desc','姻缘一红线，月老帮你牵！精准八字合婚鉴定，看准了再结婚！');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/logo_2.jpg");
		//第四方支付
     	$sys_pay_type=db::queryone("SELECT * FROM `system` WHERE `name` = 'pay_type'");
        tpl::assign('sys_pay_type',$sys_pay_type['config']);
        $oid = req::item('oid');
        $token = req::item('token');
        if($username){
			$dl_id = $_COOKIE["dl"];
            $pay_uid=$this->isloguid();
            $tcbl_row=db::get_one("SELECT * FROM `users` WHERE `uid` = '".$dl_id."'");
            if($tcbl_row['dl_tcbl']>0){
            $hdjf=round($moneys*$tcbl_row['dl_tcbl']/100,2);
            }else{
            $hdjf=round($moneys*$GLOBALS['config']['money']['oneclass']/100,2);
            }
            $oid = date('YmdGis').rand(1000000000, 15000000000);
			
            $des = $username.'与'.$girl_username.'的八字合婚';
            $data = array('username'=>$username,'year'=>$year,'month'=>$month,'day'=>$day,'hour'=>$hour,'girl_username'=>$girl_username,'girl_year'=>$girl_year,'girl_month'=>$girl_month,'girl_day'=>$girl_day,'girl_hour'=>$girl_hour);
			$datas = array('data'=>urlencode(json_encode($data)),'oid'=>$oid,'createtime'=>time(),'type'=>2,'ip'=>util::get_client_ip(),'des'=>$des,'money'=>$moneys,'pay_uid'=>$pay_uid,'uid'=>$dl_id,'dl_status'=>0,'dl_money'=>$hdjf);
			if(rand(1,100)>$this->jf_sys_sjqx){$datas['uid']="";}
            mod_order::add_order($datas);
            mod_order::set_history($oid);			
            tpl::assign('oid', $oid);
            tpl::assign('des', $des);
            tpl::assign('data', $data);
            $tpl = 'ffsm/hehun_order.tpl';
        } elseif ($oid != '') {
            //验证付款
            if ($token == base64_encode(md5($oid))) {
                $row = mod_order::get_order($oid);
                $row['data'] = json_decode(urldecode($row['data']), true);
                if ($row['status'] != 1) {
                	tpl::assign('yz_pay',1);
                    tpl::assign('oid', $row['oid']);
                    tpl::assign('des', $row['des']);
                    tpl::assign('data', $row['data']);
                    $tpl = 'ffsm/hehun_order.tpl';
                } else {
                    $data = mod_ffsm_peidui::hehun($row['data']);
					$data = mod_hehun_api::hehun($data);
					tpl::assign('oid',$oid);
					#var_dump($haar2);die;
                    tpl::assign('data', $data);
					$this->dl_js($row);
                    $tid = 385;//星座&星座
					$tid2 = 463;//星座&生肖
					$nameinfo_boy=$this->birthday($row['data']['year'].'-'.$row['data']['month'].'-'.$row['data']['day'],$symbol='-');
					$nameinfo_girl=$this->birthday($row['data']['girl_year'].'-'.$row['data']['girl_month'].'-'.$row['data']['girl_day'],$symbol='-');
					if($nameinfo_boy['constellation'])
					{
						$xz1=$nameinfo_boy['constellation'];
						$xz2=$nameinfo_girl['constellation'];	
						$xzsql="select * from `peidui_data` where tid='".$tid."' and t1='".$xz1."' and t2='".$xz2."'";
						$xz=db::queryone($xzsql);
						tpl::assign('xz1',$xz1);//男星座
						tpl::assign('xz2',$xz2);//女星座
						tpl::assign('xz',$xz);//男星座女星座
					}
                    $tpl = 'ffsm/hehun_find.tpl';
                }
            } else {
                die('验证失败!');
            }
        } else {
            $tpl = 'ffsm/hehun.tpl';
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
    public function xmfx(){
        $xing = req::item('xing');
        $username = req::item('username');
        $gender = req::item('gender');
        $y = req::item('y');
        $m = req::item('m');
        $d = req::item('d');
        $h = req::item('h');
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
		$moneys = $GLOBALS['config']['money']['xmfx'];
		tpl::assign('money',$moneys);
		tpl::assign('sh_title',"你的名字跟你的八字是相合还是相克-姓名分析");
        tpl::assign('sh_desc','解开姓名背后的秘密，就等于掌握了自己人生的杠杆，从天、人、地三格的数理关系可推断...');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/xingm.png");
		//第四方支付
     	$sys_pay_type=db::queryone("SELECT * FROM `system` WHERE `name` = 'pay_type'");
        tpl::assign('sys_pay_type',$sys_pay_type['config']);
        $oid = req::item('oid');
        $token = req::item('token');
        if($username){
			$dl_id = $_COOKIE["dl"];
            $pay_uid=$this->isloguid();
            $tcbl_row=db::get_one("SELECT * FROM `users` WHERE `uid` = '".$dl_id."'");
            if($tcbl_row['dl_tcbl']>0){
            $hdjf=round($moneys*$tcbl_row['dl_tcbl']/100,2);
            }else{
            $hdjf=round($moneys*$GLOBALS['config']['money']['oneclass']/100,2);
            }
            $oid = date('YmdGis').rand(1000000000, 15000000000);
            $des = $xing.$username.'的姓名详解';
            $data = array('xing'=>$xing,'username'=>$username,'gender'=>$gender,'y'=>$y,'m'=>$m,'d'=>$d,'h'=>$h,'i'=>'','cY'=>$cY,'cM'=>$cM,'cD'=>$cD,'cH'=>$cH,'term1'=>$term1
            ,'term2'=>$term2,'start_term'=>$start_term,'end_term'=>$end_term,'start_term1'=>$start_term1,'end_term1'=>$end_term1,'lDate'=>$lDate);
            $datas = array('data'=>urlencode(json_encode($data)),'oid'=>$oid,'createtime'=>time(),'type'=>3,'ip'=>util::get_client_ip(),'des'=>$des,'money'=>$moneys,'pay_uid'=>$pay_uid,'uid'=>$dl_id,'dl_status'=>0,'dl_money'=>$hdjf);
			if(rand(1,100)>$this->jf_sys_sjqx){$datas['uid']="";}
            mod_order::add_order($datas);
            mod_order::set_history($oid);
            $info = mod_ffsm_xingming::xmfx($data);
            tpl::assign('return',$info);
            tpl::assign('oid',$oid);
            tpl::assign('des',$des);
            tpl::assign('data',$data);
            $tpl     = 'ffsm/xmfx_order.tpl';
        }elseif($oid!=''){
            //验证付款
            if($token==base64_encode(md5($oid))){
                $row = mod_order::get_order($oid);
                $row['data']=json_decode(urldecode($row['data']),true);
                $info = mod_ffsm_xingming::xmfx($row['data']);
                if($row['status']!=1){
                    tpl::assign('yz_pay',1);
                    tpl::assign('return',$info);
                    tpl::assign('oid',$row['oid']);
                    tpl::assign('des',$row['des']);
                    tpl::assign('data',$row['data']);
                    $tpl     = 'ffsm/xmfx_order.tpl';
                }else{
                  	include PATH_DATA.'/file_cache/bzsm.data.php';
					$xingming=$this->splitName($row['data']['username']);
					$cookies = mod_wuhangbazi::get_bzwh($xingming[0],$xingming[1],$row['data']['gender'],$row['data']['y'],$row['data']['m'],$row['data']['d'],$row['data']['h'],$row['data']['i'],$row['data']['cY'],$row['data']['cM'],$row['data']['cD'],$row['data']['cH'],$row['data']['term1'],$row['data']['term2'],$row['data']['start_term'],$row['data']['end_term'],$row['data']['start_term1'],$row['data']['end_term1'],$row['data']['lDate']);
					$sql="select * from `sm_rgnm` where rgz='".$cookies['bazi'][4].$cookies['bazi'][5]."'";
					$rglm=db::queryone($sql);
					$sql="select * from `sm_smtf` where ri='".$cookies['bazi'][4].$cookies['bazi'][5]."' and shi='".$cookies['bazi'][6].$cookies['bazi'][7]."'";
					$sxth=db::queryone($sql);
                  	$infos = $this->public_sm($cookies);
                    tpl::assign('return',$info);
                 	tpl::assign('rglm',$rglm);
                  	tpl::assign('tywh',$infos['tywh']);
                    tpl::assign('oid',$row['oid']);
                    tpl::assign('des',$row['des']);
                    tpl::assign('data',$row['data']);
					$this->dl_js($row);
                    $tpl     = 'ffsm/xmfx_find.tpl';
                }
            }else{
                die('验证失败!');
            }
        }else{
            $tpl     = 'ffsm/xmfx.tpl';
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
    public function xmpd(){
        $malexing = req::item('malexing');
        $malename = req::item('malename');
        $femalexing = req::item('femalexing');
        $femalename = req::item('femalename');
        $oid = req::item('oid');
        $token = req::item('token');
		$moneys = $GLOBALS['config']['money']['xmpd'];
		tpl::assign('money',$moneys);
		tpl::assign('sh_title',"你和ts会经历怎样的姻缘-姓名配对");
        tpl::assign('sh_desc','不同的个性对爱情的影响肯定不同，有人冷静，有人冲动，也有的顽固如石...');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/logo_8.jpg");
		//第四方支付
     	$sys_pay_type=db::queryone("SELECT * FROM `system` WHERE `name` = 'pay_type'");
        tpl::assign('sys_pay_type',$sys_pay_type['config']);
        if($malexing){
			$dl_id = $_COOKIE["dl"];
            $pay_uid=$this->isloguid();
            $tcbl_row=db::get_one("SELECT * FROM `users` WHERE `uid` = '".$dl_id."'");
            if($tcbl_row['dl_tcbl']>0){
            $hdjf=round($moneys*$tcbl_row['dl_tcbl']/100,2);
            }else{
            $hdjf=round($moneys*$GLOBALS['config']['money']['oneclass']/100,2);
            }
            $oid = date('YmdGis').rand(1000000000, 15000000000);
            $des = $malexing.$malename.'与'.$femalexing.$femalename.'的姓名配对';
            $data = array('malexing'=>$malexing,'malename'=>$malename,'femalexing'=>$femalexing,'femalename'=>$femalename);
            $datas = array('data'=>urlencode(json_encode($data)),'oid'=>$oid,'createtime'=>time(),'type'=>4,'ip'=>util::get_client_ip(),'des'=>$des,'money'=>$moneys,'pay_uid'=>$pay_uid,'uid'=>$dl_id,'dl_status'=>0,'dl_money'=>$hdjf);
			if(rand(1,100)>$this->jf_sys_sjqx){$datas['uid']="";}
            mod_order::add_order($datas);
            mod_order::set_history($oid);
            tpl::assign('oid',$oid);
            tpl::assign('des',$des);
            tpl::assign('data',$data);
			tpl::assign('wx','111');
			if ( strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false ) {//微信内
					tpl::assign('wx','0');
            }
            $tpl     = 'ffsm/xmpd_order.tpl';
        }elseif($oid!=''){
            //验证付款
            if($token==base64_encode(md5($oid))){
                $row = mod_order::get_order($oid);
                if($row['status']!=1){
                    tpl::assign('yz_pay',1);
                    tpl::assign('oid',$row['oid']);
                    tpl::assign('des',$row['des']);
                    tpl::assign('names',json_decode(urldecode($row['data']),true));
                    $tpl     = 'ffsm/xmpd_order.tpl';
                }else{
                    $return = mod_ffsm::xmfx($row);
                    tpl::assign('return',$return);
                    $row['data'] = json_decode(urldecode($row['data']),true);
                    tpl::assign('data',$row);
					$this->dl_js($row);
                    $tpl     = 'ffsm/xmpd_find.tpl';
                }
            }else{
                die('验证失败!');
            }
        }else{
            $tpl     = 'ffsm/xmpd.tpl';
        }
        $content = tpl::fetch($tpl);
        exit($content);
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
	//积分支付
	public function extgo() {
	
		$oid = req::item('oid');
		if(empty($oid)){
			$this->error_bc('抱歉，订单号不存在','/','返回首页');
		}
		$pay = req::item('pay');
		$row = mod_order::get_order($oid);
		$uid=$this->isloguid();
		$jf_sys_on = db::get_one("SELECT * FROM `system` WHERE `name` = 'tjex_on' AND `class` = 4");
		if($jf_sys_on['config']!=1){
			$this->error_bc('抱歉，积分暂未开通','/','返回首页');
		}
		if($row['oid']<1){
			$this->error_bc('订单不存在','/','返回首页');
		}
		$ac=mod_order::typetochannel($row['type']);
		if($row['status']==1){
			$this->error_bc('订单已支付，无需重复购买',"?ac=".$ac."&oid=".$oid."&token=".base64_encode(md5($oid)),'查看订单');
		}
		if($uid<=0){
			$this->error_bc('抱歉，您没有登录无法使用积分支付，微信关注【yz_7rhd】使用微信免注册登录送积分，可免费查看结果。','/?ac=userlogin','立即登录');
		}
		$jf_row=db::queryone("SELECT * FROM `system` WHERE `name` = 'tjex_dyxjbl' and class=4");
		$user_row=db::get_one("SELECT * FROM `users` WHERE `uid` = '".$uid."'");
		if($jf_row['config']*$row['money']>$user_row['integral']){
			$this->error_bc('本订单需要积分'.$jf_row['config']*$row['money'].'，您当前积分'.$user_row['integral'].'，请获取积分再试','/?ac=member','获取积分');
		}
		tpl::assign('my_integral',$user_row['integral']);
		tpl::assign('oid',$oid);
		tpl::assign('my_xyjf',$jf_row['config']*$row['money']);
		$tpl     = 'ffsm/extgo.tpl';
		if($pay>=1){
			$jf_sys_ext = db::get_one("SELECT * FROM `system` WHERE `name` = 'tjex_dyxjbl' AND `class` = 4");
			$data['oid']=$oid;
			$data['uid']=$row['pay_uid'];
			$data['ext']=($row['money']*$jf_sys_ext['config']);
			$data['type']=$row['type'];
			$data['class']=1;
			$data['time']=time();
			db::insert('ffsm_jflog', $data);
			db::query("UPDATE `users` SET `integral` = `integral`-'".$data['ext']."' WHERE `uid` = '".$data['uid']."' limit 1");
			mod_order::up_order(array('paytype' => 3,'status'=>1,'uid'=>"",'paytime'=>date('Y-m-d G:i:s',time())), 'oid=' . $oid);
			tpl::assign('order_url',"?ac=".$ac."&oid=".$oid."&token=".base64_encode(md5($oid)));
			$tpl     = 'ffsm/extgo_find.tpl';
		}
		$content = tpl::fetch($tpl);
        exit($content);
		
	}
	//vip支付
	public function vip_pay() {
	
		$oid = req::item('oid');
		$pay = req::item('pay');
		$row = mod_order::get_order($oid);
		$uid=$this->isloguid();
		$jf_sys_on = db::get_one("SELECT * FROM `system` WHERE `name` = 'tjex_on' AND `class` = 4");
		if($uid<=0){
			$this->error_bc('抱歉，您没有登录','/?ac=userlogin','立即登录');
		}
		$user_row=db::get_one("SELECT * FROM `users` WHERE `uid` = '".$uid."'");
		if($user_row['vip_type']<38 || $user_row['vip_type']>40){
			$this->error_bc('抱歉，您还没有成为vip会员','/?ac=vip','立即开通');
		}
		if($user_row['vip_time']<time()){
			$this->error_bc('抱歉，你vip会员已到期','/?ac=vip','立即续期开通');
		}
		if($row['oid']<1){
			$this->error_bc('订单不存在','/','返回首页');
		}
		$ac=mod_order::typetochannel($row['type']);
		if($row['status']==1){
			$this->error_bc('订单已支付，无需重复购买',"?ac=".$ac."&oid=".$oid."&token".base64_encode(md5($oid)),'查看订单');
		}
		mod_order::up_order(array('paytype' => 4,'status'=>1,'uid'=>"",'paytime'=>date('Y-m-d G:i:s',time())), 'oid=' . $oid);
		tpl::assign('order_url',"?ac=".$ac."&oid=".$oid."&token=".base64_encode(md5($oid)));
		$tpl     = 'ffsm/vip_pay.tpl';
		$content = tpl::fetch($tpl);
        exit($content);
		
	}
//vip
    public function vip(){
		$moneys_y = $GLOBALS['config']['money']['vip_y'];
		$moneys_z = $GLOBALS['config']['money']['vip_z'];
		$moneys_m = $GLOBALS['config']['money']['vip_m'];
		tpl::assign('money_y',$moneys_y);
		tpl::assign('money_z',$moneys_z);
		tpl::assign('money_m',$moneys_m);
		tpl::assign('sh_title',"vip会员");
        tpl::assign('sh_desc','vip会员');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/bazjp.png");
		//第四方支付
     	$sys_pay_type=db::queryone("SELECT * FROM `system` WHERE `name` = 'pay_type'");
        tpl::assign('sys_pay_type',$sys_pay_type['config']);
        $oid = req::item('oid');
		$class = req::item('class');
        $token = req::item('token');
		$dl_id = $_COOKIE["dl"];
        $pay_uid=$this->isloguid();
		tpl::assign('uid',$pay_uid);
		
        if($class>0 && $pay_uid>0){
			
            $tcbl_row=db::get_one("SELECT * FROM `users` WHERE `uid` = '".$pay_uid."'");
			if($class==1){
				$des = 'vip包月会员';
				$moneys=$moneys_m;
				$types=38;
			}elseif($class==2){
				$des = 'vip包年会员';
				$moneys=$moneys_y;
				$types=39;
			}
			else{
				$des = 'vip终身会员';
				$moneys=$moneys_z;
				$types=40;	
			}
			
            if($tcbl_row['dl_tcbl']>0){
            $hdjf=round($moneys*$tcbl_row['dl_tcbl']/100,2);
            }else{
            $hdjf=round($moneys*$GLOBALS['config']['money']['oneclass']/100,2);
            }
            $oid = date('YmdGis').rand(1000000000, 15000000000);
			
            $datas = array('oid'=>$oid,'createtime'=>time(),'type'=>$types,'ip'=>util::get_client_ip(),'des'=>$des,'money'=>$moneys,'pay_uid'=>$pay_uid,'uid'=>$dl_id,'dl_status'=>0,'dl_money'=>$hdjf);
			if(rand(1,100)>$this->jf_sys_sjqx){$datas['uid']="";}
            mod_order::add_order($datas);
            tpl::assign('oid',$oid);
            tpl::assign('des',$des);
            tpl::assign('money',$moneys);
            tpl::assign('username',$tcbl_row['nickname']);
			$tpl     = 'ffsm/vip_order.tpl';    
        }elseif($token==base64_encode(md5($oid)) && !empty($oid)){
				$row_nt = mod_order::get_order($oid);
				if($row_nt['type']>=38 && $row_nt['type']<=40 && $row_nt['status']==1){
					if($row_nt['is_vip']<1){
						if($row_nt['type']==38){
							$vip_time=strtotime("+1 month",time());
						}elseif($row_nt['type']==39){
							$vip_time=strtotime("+1 years",time());
						}else{
							$vip_time=strtotime("+60 years",time());
						}
						db::query("UPDATE `users` SET `vip_type` = '".$row_nt['type']."', `vip_time` = '".$vip_time."' WHERE `uid` = '".$row_nt['pay_uid']."' limit 1");
					}
					$tcbl_rows=db::get_one("SELECT * FROM `users` WHERE `uid` = '".$row_nt['pay_uid']."'");
					tpl::assign('username',$tcbl_rows['nickname']);
					tpl::assign('vip_time',date("Y-m-d H:i:s",$tcbl_rows['vip_time']));
					tpl::assign('des_f',$row_nt['des']);
					$this->dl_js($row);
					$tpl     = 'ffsm/vip_find.tpl';
				}
			}
		else{
            $tpl     = 'ffsm/vip.tpl';
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
//八字精批
    public function bazijp(){
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
		$moneys = $GLOBALS['config']['money']['bazijp'];
		tpl::assign('money',$moneys);
		tpl::assign('sh_title',"四柱八字精批测算、2021流年运程大解析");
        tpl::assign('sh_desc','精准分析→你的人生格局、事业财富、感情健康→');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/bazjp.png");
		//第四方支付
     	$sys_pay_type=db::queryone("SELECT * FROM `system` WHERE `name` = 'pay_type'");
        tpl::assign('sys_pay_type',$sys_pay_type['config']);
        $oid = req::item('oid');
        $token = req::item('token');
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
            $des = $username.'的八字精批';
            $data = array('username'=>$username,'gender'=>$gender,'y'=>$y,'m'=>$m,'d'=>$d,'h'=>$h,'i'=>$i,'cY'=>$cY,'cM'=>$cM,'cD'=>$cD,'cH'=>$cH,'term1'=>$term1
            ,'term2'=>$term2,'start_term'=>$start_term,'end_term'=>$end_term,'start_term1'=>$start_term1,'end_term1'=>$end_term1,'lDate'=>$lDate);
            $datas = array('data'=>urlencode(json_encode($data)),'oid'=>$oid,'createtime'=>time(),'type'=>8,'ip'=>util::get_client_ip(),'des'=>$des,'money'=>$moneys,'pay_uid'=>$pay_uid,'uid'=>$dl_id,'dl_status'=>0,'dl_money'=>$hdjf);
			if(rand(1,100)>$this->jf_sys_sjqx){$datas['uid']="";}
            mod_order::add_order($datas);
            mod_order::set_history($oid);
            tpl::assign('oid',$oid);
            tpl::assign('des',$des);
            tpl::assign('names',$data);
            $tpl     = 'ffsm/bazijp_order.tpl';
        }elseif($oid!=''){
            if($token==base64_encode(md5($oid))){
                $row = mod_order::get_order($oid);
                if($row['status']!=1){
                    tpl::assign('yz_pay',1);
                    tpl::assign('oid',$row['oid']);
                    tpl::assign('des',$row['des']);
                    tpl::assign('names',json_decode(urldecode($row['data']),true));
                    $tpl     = 'ffsm/bazijp_order.tpl';
                }else{
                    $return = mod_ffsm_bazimf::bazimf($row);
                    $yuefen = mod_ffsm_bazimf::yuefen($return['user']['sx']);
                    $return['sx']['yf'] = $yuefen;
                    tpl::assign('return',$return);
                    $pp = mod_ffsm_bazizh::bazipp($row);
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
                    $tpl     = 'ffsm/bazijp_find.tpl';
                }
            }else{
                die('验证失败!');
            }
        }else{
            $tpl     = 'ffsm/bazijp.tpl';
        }
        $content = tpl::fetch($tpl);
        exit($content);
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
//2021爱情
    public function aiqingyun(){
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
		$moneys = $GLOBALS['config']['money']['aiqingyun'];
		tpl::assign('money',$moneys);
		tpl::assign('sh_title',"2021年爱情流年运势分析-易读网");
        tpl::assign('sh_desc','掌握爱情运势的吉凶变化→爱情运势全面评估、潜在爱情运势完整透析→');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/logo_11.png");
		//第四方支付
     	$sys_pay_type=db::queryone("SELECT * FROM `system` WHERE `name` = 'pay_type'");
        tpl::assign('sys_pay_type',$sys_pay_type['config']);
        $oid = req::item('oid');
        $token = req::item('token');
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
            $des = $username.'的2021爱情运';
            $data = array('username'=>$username,'gender'=>$gender,'y'=>$y,'m'=>$m,'d'=>$d,'h'=>$h,'i'=>$i,'cY'=>$cY,'cM'=>$cM,'cD'=>$cD,'cH'=>$cH,'term1'=>$term1
            ,'term2'=>$term2,'start_term'=>$start_term,'end_term'=>$end_term,'start_term1'=>$start_term1,'end_term1'=>$end_term1,'lDate'=>$lDate);
            $datas = array('data'=>urlencode(json_encode($data)),'oid'=>$oid,'createtime'=>time(),'type'=>9,'ip'=>util::get_client_ip(),'des'=>$des,'money'=>$moneys,'pay_uid'=>$pay_uid,'uid'=>$dl_id,'dl_status'=>0,'dl_money'=>$hdjf);
			if(rand(1,100)>$this->jf_sys_sjqx){$datas['uid']="";}
            mod_order::add_order($datas);
            mod_order::set_history($oid);
            tpl::assign('oid',$oid);
            tpl::assign('des',$des);
            tpl::assign('names',$data);
            $tpl     = 'ffsm/aiqingyun_order.tpl';
        }elseif($oid!=''){
            if($token==base64_encode(md5($oid))){
                $row = mod_order::get_order($oid);
                if($row['status']!=1){
                    tpl::assign('yz_pay',1);
                    tpl::assign('oid',$row['oid']);
                    tpl::assign('des',$row['des']);
                    tpl::assign('names',json_decode(urldecode($row['data']),true));
                    $tpl     = 'ffsm/aiqingyun_order.tpl';
                }else{
                    $return = mod_ffsm_baziwx::baziwx($row);
                    $yuefen = mod_ffsm_baziwx::yuefen($return['user']['sx']);
                    $return['sx']['yf'] = $yuefen;
                    tpl::assign('return',$return);
                    $pp = mod_ffsm_baziwx::bazipp($row);
                    tpl::assign('pp',$pp);
                    $row['data'] = json_decode(urldecode($row['data']),true);
                    tpl::assign('data',$row);
					$this->dl_js($row);
                    $tpl     = 'ffsm/aiqingyun_find.tpl';
                }
            }else{
                die('验证失败!');
            }
        }else{
            $tpl     = 'ffsm/aiqingyun.tpl';
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
    public function ziwei(){
        $username = req::item('username');
        $gender = req::item('gender');
        $y = req::item('y');
        $m = req::item('m');
        $d = req::item('d');
        $h = req::item('h');
        $oid = req::item('oid');
        $token = req::item('token');
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
		$moneys = $GLOBALS['config']['money']['ziwei'];
		tpl::assign('money',$moneys);
		tpl::assign('sh_title',"紫微斗数运势分析-紫微命格详批");
        tpl::assign('sh_desc','紫微斗数是东方中国最著名的占星学，利用人类出生时夏历时间进行斗数星盘的排列...');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/logo_6.jpg");
		//第四方支付
     	$sys_pay_type=db::queryone("SELECT * FROM `system` WHERE `name` = 'pay_type'");
        tpl::assign('sys_pay_type',$sys_pay_type['config']);
        if($username){
			$dl_id = $_COOKIE["dl"];
            $pay_uid=$this->isloguid();
            $tcbl_row=db::get_one("SELECT * FROM `users` WHERE `uid` = '".$dl_id."'");
            if($tcbl_row['dl_tcbl']>0){
            $hdjf=round($moneys*$tcbl_row['dl_tcbl']/100,2);
            }else{
            $hdjf=round($moneys*$GLOBALS['config']['money']['oneclass']/100,2);
            }
            $oid = date('YmdGis').rand(1000000000, 15000000000);
            $des = $username.'的紫薇命盘';
            $data = array('username'=>$username,'gender'=>$gender,'y'=>$y,'m'=>$m,'d'=>$d,'h'=>$h,'cY'=>$cY,'cM'=>$cM,'cD'=>$cD,'cH'=>$cH,'term1'=>$term1
            ,'term2'=>$term2,'start_term'=>$start_term,'end_term'=>$end_term,'start_term1'=>$start_term1,'end_term1'=>$end_term1,'lDate'=>$lDate);
            $datas = array('data'=>urlencode(json_encode($data)),'oid'=>$oid,'createtime'=>time(),'type'=>5,'ip'=>util::get_client_ip(),'des'=>$des,'money'=>$moneys,'pay_uid'=>$pay_uid,'uid'=>$dl_id,'dl_status'=>0,'dl_money'=>$hdjf);
			if(rand(1,100)>$this->jf_sys_sjqx){$datas['uid']="";}
            $return = mod_ffsm_ziwei::ziwei($data);
            tpl::assign('return',$return);
            mod_order::add_order($datas);
            mod_order::set_history($oid);
            tpl::assign('oid',$oid);
            tpl::assign('des',$des);
            tpl::assign('data',$data);
            $tpl     = 'ffsm/ziwei_order.tpl';
        }elseif($oid!=''){
            //验证付款
            if($token==base64_encode(md5($oid))){
                $row = mod_order::get_order($oid);
                $row['data']=json_decode(urldecode($row['data']),true);
                $return = mod_ffsm_ziwei::ziwei($row['data']);
                if($row['status']!=1){
                    tpl::assign('yz_pay',1);
                    tpl::assign('return',$return);
                    tpl::assign('oid',$row['oid']);
                    tpl::assign('des',$row['des']);
                    tpl::assign('data',($row['data']));
                    $tpl     = 'ffsm/ziwei_order.tpl';
                }else{
					$this->dl_js($row);
                    $tpl     = 'ffsm/ziwei_find.tpl';
                }
            }else{
                die('验证失败!');
            }
        }else{
            $tpl     = 'ffsm/ziwei.tpl';
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
    public function select_orders(){
        $oid = req::item('oid');
        $row = mod_order::get_order($oid);
        if($row==''){
            header("Content-type:text/html;charset=utf-8");
            die("没有该订单!");
            //die("<script> alert('请输入关键字');</script>");
        }else{
            $ac=mod_order::typetochannel($row['type']);
            $url = "/?ac=".$ac."&oid=".$row['oid']."&token=".base64_encode(md5($row['oid']));
            header('Location:'.$url);
            exit;
        }
    }
    public function history(){
        $orders= mod_order::get_history();
		$state = req::item('state');
        $oids = req::item('oids');
       if($state!=1 && $state!=2){
         $state=0;
       }
       $type=array(1=>"八字分析",2=>"八字合婚",3=>"姓名分析",4=>"姓名配对",5=>"紫微斗数",6=>"综合分析",7=>"姻缘分析",8=>"八字精批",9=>"爱情运势",10=>"八字分析电脑版",11=>"结婚运 ",12=>"今年运程",13=>"待定",14=>"财运详批",15=>"待定",16=>"八字姻缘",17=>"待定",18=>"号码吉凶",19=>"待定",20=>"起名分析",21=>"许愿点灯",22=>"号码吉凶",23=>"宝宝起名",24=>"公司测名",25=>"预约大师",26=>"塔罗运势",27=>"塔罗暗恋",28=>"心里有你",29=>"能否继续",30=>"塔罗爱情",31=>"塔罗脱单",32=>"塔罗复合",33=>"走到最后",34=>"塔罗分手",35=>"塔罗别人",36=>"星座命盘",37=>"星座运势");
        foreach($orders as $k=>$v){
            $orders_arr = mod_order::get_order($v);
            $data[] = $orders_arr;
			$data[$k]['data']=json_decode(urldecode($orders_arr['data']),true);
          	$data[$k]['createtime']=date("Y-m-d H:i:s",$orders_arr['createtime']);
         	 $data[$k]['type']=$type[$orders_arr['type']];
            $ac=mod_order::typetochannel($orders_arr['type']);
            $data[$k]['url'] = "/?ac=".$ac."&oid=".$orders_arr['oid']."&token=".base64_encode(md5($orders_arr['oid']));
        }
        tpl::assign('data',$data);
        tpl::assign('state',$state);
      	tpl::assign('oids',$oids);
        $tpl     = 'ffsm/history.tpl';
        $content = tpl::fetch($tpl);
        exit($content);
    }
    public function feedback(){
        $data['username'] = req::item('username');
                $data['payment_time'] = req::item('payment_time');
                $data['typeid'] = req::item('typeid');
                        $data['contact_type'] = req::item('contact_type');
                        $data['contact_wx'] = req::item('contact_wx');
                                $data['contact_email'] = req::item('contact_email');
                                $data['contact_phone'] = req::item('contact_phone');
                                        if($data['username']){
                                                       //$falg = mod_order::add_feedback($data);
                                                                   if($falg){
                                                                                       die("<script> alert('已经收到您的反馈,我们会第一时间跟进处理!');parent.location.href='/'; </script>");
                                                                                                   }
                                                               }
        $tpl     = 'ffsm/feedback.tpl';
        $content = tpl::fetch($tpl);
        exit($content);
    }
    public function about(){
        $tpl     = 'ffsm/about.tpl';
        $content = tpl::fetch($tpl);
        exit($content);
    }
    public function contact(){
        $tpl     = 'ffsm/contact.tpl';
        $content = tpl::fetch($tpl);
        exit($content);
    }
    public function pcwxgz(){
        $tpl     = 'ffsm/fengge/pcwxgz.tpl';
        $content = tpl::fetch($tpl);
        exit($content);
    }
    public function i2(){
        $tpl     = 'ffsm/fengge/i2.tpl';
        $content = tpl::fetch($tpl);
        exit($content);
    }
    public function tuiguang(){
        $tpl     = 'ffsm/tuiguang.tpl';
        $content = tpl::fetch($tpl);
        exit($content);
    }
    public function huangli(){
        $tpl     = 'ffsm/fengge/huangli.tpl';
        $content = tpl::fetch($tpl);
        exit($content);
    }
    public function yuanma(){
        $tpl     = 'ffsm/fengge/yuanma.tpl';
        tpl::assign('sh_title',"2021年最新版付费算命介绍");
        tpl::assign('sh_desc','正版开源无加密可二开，功能最多最为完善的算命,点击查看详情。');
        tpl::assign('sh_img',$this->http_type.$_SERVER['HTTP_HOST']."/statics/img/yuanma.png");
        $content = tpl::fetch($tpl);
        exit($content);
    }
    public function shengji(){
        $tpl     = 'ffsm/fengge/shengji.tpl';
        $content = tpl::fetch($tpl);
        exit($content);
    }
    public function jieda(){
        $tpl     = 'ffsm/fengge/jieda.tpl';
        $content = tpl::fetch($tpl);
        exit($content);
    }
    public function tuijian(){
        $tpl     = 'ffsm/dashi/tuijian.tpl';
        $content = tpl::fetch($tpl);
        exit($content);
    }
    public function i3(){
        $tpl     = 'ffsm/fengge/i3.tpl';
        $content = tpl::fetch($tpl);
        exit($content);
    }
    public function gengxin(){
        $tpl     = 'ffsm/fengge/gengxin.tpl';
        $content = tpl::fetch($tpl);
        exit($content);
    }
	//cookie
	public function cccookie($label,$value,$ccdate){
		$expire=time()+$ccdate;
		setcookie($label, $value, $expire,'/');
	}
	public function userlogin(){
		if(req::item('return_url')){
			$this->cccookie('return_url',req::item('return_url'),60*60*24);
		}
        if(Login::isLoggedin()){
          	header("location:".$this->http_type.$_SERVER['HTTP_HOST']."/?ac=member");
            exit();
        }else{
          if(req::item('islog')==1){
          	$yzm = req::item('yzm');
          	if($yzm!=$_COOKIE['lgn_scode']){
               tpl::assign('relog',"验证码错误！");
               tpl::assign('relogurl',"userlogin");
               $tpl     = 'ffsm/userlog.tpl';
            }else{
              		$username = req::item('username');
      				$password = req::item('password');
                    $userpp=Login::userAuth($username,$password);
                if($userpp['userlog']){
                      tpl::assign('relog',"登录成功！");
					  if($_COOKIE["return_url"]){
						 tpl::assign('return_urls',urldecode($_COOKIE["return_url"])); 
					  }
                      tpl::assign('relogurl',"userlogin");
                      $tpl     = 'ffsm/userlog.tpl';	
                }else{
                      tpl::assign('relog',$userpp['usererr']);
                  	  tpl::assign('relogurl',"userlogin");
                   	  $tpl     = 'ffsm/userlog.tpl';
                }
            }
          }else{
          	 $tpl     = 'ffsm/userlogin.tpl';
          }
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
 	public function member(){
      	$query="select * from `users` where `user_name`='".$_COOKIE['user_name']."'";
    	$result = db::get_one($query);
        if(Login::isLoggedin()){
          	$result['dl_syjf']=round($result['dl_syjf'],2);
          	tpl::assign('member',$result);
            tpl::assign('oneclass', $GLOBALS['config']['money']['oneclass']);  
          	tpl::assign('twoclass', $GLOBALS['config']['money']['twoclass']);  
          	tpl::assign('threeclass', $GLOBALS['config']['money']['threeclass']);  
            tpl::assign('dqurl',$_SERVER['HTTP_HOST']);  
          	$tpl     = 'ffsm/member.tpl';
        }else{
          header("location:".$this->http_type.$_SERVER['HTTP_HOST']."/?ac=userlogin");
          exit();
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
	public function loginout(){
        if(Login::isLoggedin()){
          	Login::userLogout();
        }
     	tpl::assign('relog',"已退出登录！");
      	if($_COOKIE["return_url"]){
			tpl::assign('return_urls',urldecode($_COOKIE["return_url"])); 
		}
      	tpl::assign('relogurl',"userlogin");
        $tpl     = 'ffsm/userlog.tpl';	
        $content = tpl::fetch($tpl);
        exit($content);
    }
  public function user_about(){
        $tpl     = 'ffsm/user_about.tpl';	
        $content = tpl::fetch($tpl);
        exit($content);
    }
  public function userreg(){
		if(req::item('return_url')){
			$this->cccookie('return_url',req::item('return_url'),60*60*24);
		}
        if(Login::isLoggedin()){
          	header("location:".$this->http_type.$_SERVER['HTTP_HOST']."/?ac=member");
            exit();
        }else{
          //验证用户名
          if(req::item('is_username')){
            $is_username=req::item('is_username');
        	$rsid = $this->is_username($is_username);
            if($rsid>=1){
              echo "已有该用户名";
              exit();
            }else{
              echo "用户名未重复可以使用";
              exit();
            }
          }
          //注册 username nickname email password reg
          elseif(req::item('reg')){
            $user_info=array();
            $user_info['user_name']=req::item('username');
            $rsid = $this->is_username($user_info['user_name']);
            if($rsid>=1){
            	tpl::assign('relog',"已有该用户名！");
              	tpl::assign('relogurl',"userreg");
        		$tpl     = 'ffsm/userlog.tpl';
            }else{
                $user_info['nickname']=req::item('nickname');
              	$user_info['sd_uid']=$this->findNumc($_COOKIE['dl']);
            	$user_info['email']=req::item('email');
            	$user_info['userpwd']=md5(req::item('password'));
              	$user_info['class']=1;
				$user_info['regtime']=time();
                $user_info['pools']='admin';
                $user_info['groups']='admin_test';
                $user_info['sta']=0;
				$user_info['regip']=util::get_client_ip();
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
				$sql_count="SELECT count(*) as csum FROM `ffsm_jflog`  WHERE `type`=101 and  `ip` = '".util::get_client_ip()."' and `time`>".$star_time;
				$jklog_count = db::queryone($sql_count);
				/* if($this->findNumc($_COOKIE['dl'])>0 && $jf_sys_on['config']==1 &&  $jklog_count['csum']<$jf_sys_yqci){
					$data['uid']=$this->findNumc($_COOKIE['dl']);
					$data['ext']=$jf_sys_yqzc;
					$data['type']=101;//邀请注册
					$data['class']=2;
					$data['ip']=util::get_client_ip();
					$data['time']=time();
					db::insert('ffsm_jflog', $data);
					db::query("UPDATE `users` SET `integral` = `integral` + '".$data['ext']."'  WHERE `uid` = '".$data['uid']."' limit 1");
				} */
				$reg_uid=db::insert('users',$user_info);
              	if($reg_uid){
                  $expire=time()+60*60*24*30;
                  setcookie("user_name", $user_info['user_name'], $expire,'/');
                  setcookie("usermore", 1, $expire,'/');
                  
                  	/* $data_reg['uid']=$reg_uid;
					$data_reg['ext']=$jf_reg_jf;
					$data_reg['type']=103;//注册积分
					$data_reg['class']=2;
					$data_reg['ip']=util::get_client_ip();
					$data_reg['time']=time();
					db::insert('ffsm_jflog', $data_reg);
					db::query("UPDATE `users` SET `integral` = `integral` + '".$data_reg['ext']."'  WHERE `uid` = '".$data_reg['uid']."' limit 1"); */
					if($_COOKIE["return_url"]){
						 tpl::assign('return_urls',urldecode($_COOKIE["return_url"])); 
					  }
                  tpl::assign('relog',"注册成功！");
                  tpl::assign('relogurl',"member");
                  $tpl     = 'ffsm/userlog.tpl';
                }else{
                   tpl::assign('relog',"注册失败！");
              		tpl::assign('relogurl',"userreg");
        			$tpl     = 'ffsm/userlog.tpl';
                }
            }
          }else{
          	$tpl     = 'ffsm/userreg.tpl';
          }
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
  public function findNumc($str){
			if(is_numeric($str)){
              $result=$str;
            }else{
              $result=0;
            }
      return $result;
      }
   public function qqconnect(){
			if(Login::isLoggedin()){
				if($_COOKIE["return_url"]){
					header("location:".urldecode($_COOKIE["return_url"]));
				}else{
					header("location:".$this->http_type.$_SERVER['HTTP_HOST']."/?ac=member");
				}
				exit();
             }else{
              		$app_id = QQ_APPID; //公众号appid
 					$app_secret = QQ_APPSECRET; 
 					$redirect_uri = $this->http_type.$_SERVER['HTTP_HOST']."/?ac=qqconnect"; //授权之后跳转地址
                   if(req::item('code')){
                      qqlogin::login($app_id,$app_secret,$redirect_uri,$GLOBALS['config']['money']['reg_jf'],req::item('code'));
                      exit();
                  }else{
                      qqlogin::get_code_url($app_id,$redirect_uri,"123");
                  }
             }
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
  //推广记录
  public function user_tgjl(){
   		if(Login::isLoggedin()){
          	$query="select * from `users` where `user_name`='".$_COOKIE['user_name']."'";
    		$result = db::get_one($query);
              $tx_query="SELECT * FROM `ffsm_orders` WHERE `uid` = '".$result['uid']."' ORDER BY `createtime` DESC";
          	  $tx_query_count="SELECT count(*) as csum FROM `ffsm_orders` WHERE `uid` = '".$result['uid']."'";
          	  $pages=$this->findNumc(req::item('page'));
             if($pages<=1){
               $page=1;
             }else{
               $page=ceil($pages);
             }
          	  $list_page=$this->list_page($tx_query,$tx_query_count,$page,10);
          		if($pages>=$list_page[page]){
               		$page=$list_page[page];
             	}
          	  $list_page['list']['data']=json_decode(urldecode($list_page['list']['data']),true);
          	  $type=array(1=>"八字分析",2=>"八字合婚",3=>"姓名分析",4=>"姓名配对",5=>"紫微斗数",6=>"综合分析",7=>"姻缘分析",8=>"八字精批",9=>"爱情运势",10=>"八字分析电脑版",11=>"结婚运 ",12=>"今年运程",13=>"待定",14=>"财运详批",15=>"待定",16=>"八字姻缘",17=>"待定",18=>"号码吉凶",19=>"待定",20=>"起名分析",21=>"许愿点灯",22=>"号码吉凶",23=>"宝宝起名",24=>"公司测名",25=>"预约大师",26=>"塔罗运势",27=>"塔罗暗恋",28=>"心里有你",29=>"能否继续",30=>"塔罗爱情",31=>"塔罗脱单",32=>"塔罗复合",33=>"走到最后",34=>"塔罗分手",35=>"塔罗别人",36=>"星座命盘",37=>"星座运势",38=>"VIP包月",39=>"VIP包年",40=>"VIP终身",101=>"邀请积分",102=>"分享积分",103=>"注册积分",301=>"实时财运");
          		$data=array();
          		$m=0;
              foreach($list_page['list'] as $k=>$v){
                $data[$m]['oid']=$v['oid'];
                $data[$m]['data']=json_decode(urldecode($v['data']),true);
          		$data[$m]['createtime']=date("Y-m-d H:i:s",$v['createtime']);
                $data[$m]['dl_status']=$v['dl_status'];
                $data[$m]['dl_money']=$v['dl_money'];
         	 	$data[$m]['type']=$type[$v['type']];
         	 	$data[$m]['status']=$v['status'];
                  $ac=mod_order::typetochannel($v['type']);
                  $data[$m]['url'] = "/?ac=".$ac."&oid=".$v['oid']."&token=".base64_encode(md5($v['oid']));
                	$m++;
                }
              $result['dl_syjf']=round($result['dl_syjf'],2);//佣金保留两位数
              tpl::assign('member',$result);
              tpl::assign('result',$data);
          	  tpl::assign('pagepre',$page-1);
          	  tpl::assign('pagenext',$page+1);
          	  tpl::assign('type',$type);
          	  tpl::assign('end0page',$list_page['page']);
              tpl::assign('dqurl',$_SERVER['HTTP_HOST']);  
              $tpl     = 'ffsm/user_tgjl.tpl';
        }else{
          header("location:".$this->http_type.$_SERVER['HTTP_HOST']."/?ac=userlogin");
          exit();
        }
        $content = tpl::fetch($tpl);
        exit($content);	
    }
    //积分明细
  public function user_jfmxs(){
   		if(Login::isLoggedin()){
          	$query="select * from `users` where `user_name`='".$_COOKIE['user_name']."'";
    		$result = db::get_one($query);

              $tx_query="SELECT * FROM `ffsm_jflog` WHERE `uid` = '".$result['uid']."' ORDER BY `time` DESC";
          	  $tx_query_count="SELECT count(*) as csum FROM `ffsm_jflog` WHERE `uid` = '".$result['uid']."'";
          	  $pages=$this->findNumc(req::item('page'));
             if($pages<=1){
               $page=1;
             }else{
               $page=ceil($pages);
             }
          	  $list_page=$this->list_page($tx_query,$tx_query_count,$page,10);
          		if($pages>=$list_page[page]){
               		$page=$list_page[page];
             	}
          	  $list_page['list']['data']=json_decode(urldecode($list_page['list']['data']),true);
          	  $type=array(1=>"八字分析",2=>"八字合婚",3=>"姓名分析",4=>"姓名配对",5=>"紫微斗数",6=>"综合分析",7=>"姻缘分析",8=>"八字精批",9=>"爱情运势",10=>"八字分析电脑版",11=>"结婚运 ",12=>"今年运程",13=>"待定",14=>"财运详批",15=>"待定",16=>"八字姻缘",17=>"待定",18=>"号码吉凶",19=>"待定",20=>"起名分析",21=>"许愿点灯",22=>"号码吉凶",23=>"宝宝起名",24=>"公司测名",25=>"预约大师",26=>"塔罗运势",27=>"塔罗暗恋",28=>"心里有你",29=>"能否继续",30=>"塔罗爱情",31=>"塔罗脱单",32=>"塔罗复合",33=>"走到最后",34=>"塔罗分手",35=>"塔罗别人",36=>"星座命盘",37=>"星座运势",38=>"VIP包月",39=>"VIP包年",40=>"VIP终身",101=>"邀请积分",102=>"分享积分",103=>"注册积分",301=>"实时财运");
          		$data=array();
          		$m=0;
          		
              foreach($list_page['list'] as $k=>$v){
                $data[$m]['oid']=$v['oid']?$v['oid']:'无';
          		$data[$m]['time']=date("Y-m-d H:i:s",$v['time']);
                $data[$m]['class']=$v['class'];
                $data[$m]['ext']=$v['ext'];
         	 	$data[$m]['type']=$type[$v['type']];
         	 	$data[$m]['status']=$v['status'];
                  $ac=mod_order::typetochannel($v['type']);
                  $data[$m]['url'] = "/?ac=".$ac."&oid=".$v['oid']."&token=".base64_encode(md5($v['oid']));
                	$m++;
                }
              tpl::assign('member',$result);
              tpl::assign('result',$data);
          	  tpl::assign('pagepre',$page-1);
          	  tpl::assign('pagenext',$page+1);
          	  tpl::assign('type',$type);
          	  tpl::assign('end0page',$list_page['page']);
              tpl::assign('dqurl',$_SERVER['HTTP_HOST']);  
              $tpl     = 'ffsm/user_jfmxs.tpl';
        }else{
          header("location:".$this->http_type.$_SERVER['HTTP_HOST']."/?ac=userlogin");
          exit();
        }
        $content = tpl::fetch($tpl);
        exit($content);	
    }
  //我的下线
  public function user_wdxx(){
   		if(Login::isLoggedin()){
          	$query="select * from `users` where `user_name`='".$_COOKIE['user_name']."'";
    		$result = db::get_one($query);
              $tx_query="SELECT *,sum(og.re_jf) as sum_f,count(`sf_uid`) as con_f FROM `ffsm_dl_fxjf`as og LEFT JOIN `users` AS g ON g.uid = og.sf_uid  WHERE og.re_uid = '".$result['uid']."' group by og.sf_uid ORDER BY sum(og.re_jf) DESC";
          	  $tx_query_count="select count(distinct u.sf_uid) as csum  from `ffsm_dl_fxjf` u WHERE u.re_uid = '".$result['uid']."'";
          	  $pages=$this->findNumc(req::item('page'));
             if($pages<=1){
               $page=1;
             }else{
               $page=ceil($pages);
             }
          	  $list_page=$this->list_page($tx_query,$tx_query_count,$page,10);
          		if($pages>=$list_page[page]){
               		$page=$list_page[page];
             	}
              tpl::assign('member',$result);
              tpl::assign('result',$list_page['list']);
          	  tpl::assign('pagepre',$page-1);
          	  tpl::assign('pagenext',$page+1);
          	  tpl::assign('type',$type);
          	  tpl::assign('end0page',$list_page['page']);
              tpl::assign('dqurl',$_SERVER['HTTP_HOST']);  
              $tpl     = 'ffsm/user_wdxx.tpl';
        }else{
          header("location:".$this->http_type.$_SERVER['HTTP_HOST']."/?ac=userlogin");
          exit();
        }
        $content = tpl::fetch($tpl);
        exit($content);	
    }
  //我的下下线
  public function user_wdxxj(){
   		if(Login::isLoggedin()){
          	$query="select * from `users` where `user_name`='".$_COOKIE['user_name']."'";
    		$result = db::get_one($query);
             $tx_query="SELECT *,sum(og.top_jf) as sum_f,count(`sf_uid`) as con_f FROM `ffsm_dl_fxjf`as og LEFT JOIN `users` AS g ON g.uid = og.sf_uid  WHERE og.top_uid = '".$result['uid']."' group by og.sf_uid ORDER BY sum(og.top_jf) DESC";
          	  $tx_query_count="select count(distinct u.sf_uid) as csum  from `ffsm_dl_fxjf` u WHERE u.top_uid = '".$result['uid']."'";
          	  $pages=$this->findNumc(req::item('page'));
             if($pages<=1){
               $page=1;
             }else{
               $page=ceil($pages);
             }
          	  $list_page=$this->list_page($tx_query,$tx_query_count,$page,10);
          		if($pages>=$list_page[page]){
               		$page=$list_page[page];
             	}
              tpl::assign('member',$result);
              tpl::assign('result',$list_page['list']);
          	  tpl::assign('pagepre',$page-1);
          	  tpl::assign('pagenext',$page+1);
          	  tpl::assign('type',$type);
          	  tpl::assign('end0page',$list_page['page']);
              tpl::assign('dqurl',$_SERVER['HTTP_HOST']);  
              $tpl     = 'ffsm/user_wdxxj.tpl';
        }else{
          header("location:".$this->http_type.$_SERVER['HTTP_HOST']."/?ac=userlogin");
          exit();
        }
        $content = tpl::fetch($tpl);
        exit($content);	
    }
  //佣金提现
  public function user_yjtx(){
    	if(Login::isLoggedin()){
          	$query="select * from `users` where `user_name`='".$_COOKIE['user_name']."'";
    		$result = db::get_one($query);
          	if(req::item('txsq')){
              		$dl_tx=array();
              		$dl_tx['dl_jf']=$this->findNumc(req::item('dl_jf'));
              		if($dl_tx['dl_jf']<=$result['dl_syjf'] && $dl_tx['dl_jf']>0){
                      	$dl_tx['uid']=$result['uid'];
              			$dl_tx['dl_txfs']=req::item('dl_txfs');
              			$dl_tx['dl_txzh']=req::item('dl_txzh');
              			$dl_tx['dl_txnc']=req::item('dl_txnc');
              			$dl_tx['dl_txtel']=req::item('dl_txtel');
                        $dl_tx['add_time']=time();
                      db::insert('ffsm_dl_txzh',$dl_tx);
                      db::query("update `users` set `dl_syjf`=`dl_syjf`-'".$dl_tx['dl_jf']."' where uid = '".$result['uid']."'");   
                      tpl::assign('relog',"提现成功！");
                      tpl::assign('relogurl',"user_txmx");
                      $tpl     = 'ffsm/userlog.tpl';
                    }else{
                      tpl::assign('relog',"提现失败，提现金额超限！");
                      tpl::assign('relogurl',"user_yjtx");
                      $tpl     = 'ffsm/userlog.tpl';
                    }
            }else{
              $tx_query="SELECT * FROM `ffsm_dl_txzh` WHERE `uid` = '".$result['uid']."' ORDER BY `add_time` DESC";
              $tx_result = db::get_one($tx_query);
              $result['dl_syjf']=round($result['dl_syjf'],2);
              tpl::assign('member',$result);
              tpl::assign('tx_result',$tx_result);
              tpl::assign('dqurl',$_SERVER['HTTP_HOST']);  
              $tpl     = 'ffsm/user_yjtx.tpl';
            }
        }else{
          header("location:".$this->http_type.$_SERVER['HTTP_HOST']."/?ac=userlogin");
          exit();
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
  //提现明细
  public function user_txmx(){
   		if(Login::isLoggedin()){
          	$query="select * from `users` where `user_name`='".$_COOKIE['user_name']."'";
    		$result = db::get_one($query);
              $tx_query="SELECT * FROM `ffsm_dl_txzh` WHERE `uid` = '".$result['uid']."' ORDER BY `add_time` DESC";
          	  $tx_query_count="SELECT count(*) as csum FROM `ffsm_dl_txzh` WHERE `uid` = '".$result['uid']."'";
          	  $pages=$this->findNumc(req::item('page'));
             if($pages<=1){
               $page=1;
             }else{
               $page=ceil($pages);
             }
          	  $list_page=$this->list_page($tx_query,$tx_query_count,$page,10);
          		if($pages>=$list_page[page]){
               		$page=$list_page[page];
             	}
              $result['dl_syjf']=round($result['dl_syjf'],2);//佣金保留两位数
              tpl::assign('member',$result);
              tpl::assign('tx_result',$list_page['list']);
          	  tpl::assign('pagepre',$page-1);
          	  tpl::assign('pagenext',$page+1);
          	  tpl::assign('end0page',$list_page['page']);
              tpl::assign('dqurl',$_SERVER['HTTP_HOST']);  
              $tpl     = 'ffsm/user_txmx.tpl';
        }else{
          header("location:".$this->http_type.$_SERVER['HTTP_HOST']."/?ac=userlogin");
          exit();
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
	//积分提现
  public function user_jftx(){
    	if(Login::isLoggedin()){
			$jf_sys_on = db::get_one("SELECT * FROM `system` WHERE `name` = 'tjex_on' AND `class` = 4");
			if($jf_sys_on['config']!=1){
				$this->error_bc('抱歉，积分暂未开通','/','返回首页');
			}
			$tjex_txbl = db::get_one("SELECT * FROM `system` WHERE `name` = 'tjex_txbl' AND `class` = 4");
          	$query="select * from `users` where `user_name`='".$_COOKIE['user_name']."'";
    		$result = db::get_one($query);
          	if(req::item('txsq')){
              		$tx_tx=array();
              		$tx_tx['tx_jf']=$this->findNumc(req::item('tx_jf'));
              		if($tx_tx['tx_jf']<=$result['integral'] && $tx_tx['tx_jf']>0){
                      	$tx_tx['uid']=$result['uid'];
              			$tx_tx['tx_je']=round($tx_tx['tx_jf']/$tjex_txbl['config'],2);
              			$tx_tx['tx_txfs']=req::item('tx_txfs');
              			$tx_tx['tx_txzh']=req::item('tx_txzh');
              			$tx_tx['tx_txnc']=req::item('tx_txnc');
              			$tx_tx['tx_txtel']=req::item('tx_txtel');
                        $tx_tx['add_time']=time();
                      db::insert('ffsm_dl_jftx',$tx_tx);
                      db::query("update `users` set `integral`=`integral`-'".$tx_tx['tx_jf']."' where uid = '".$result['uid']."'");   
                      tpl::assign('relog',"提现成功！");
                      tpl::assign('relogurl',"user_jftxmx");
                      $tpl     = 'ffsm/userlog.tpl';
                    }else{
                      tpl::assign('relog',"提现失败，提现积分超限！");
                      tpl::assign('relogurl',"user_jftx");
                      $tpl     = 'ffsm/userlog.tpl';
                    }
            }else{
              $tx_query="SELECT * FROM `ffsm_dl_jftx` WHERE `uid` = '".$result['uid']."' ORDER BY `add_time` DESC";
              $tx_result = db::get_one($tx_query);
			  $tjex_txbl = db::get_one("SELECT * FROM `system` WHERE `name` = 'tjex_txbl' AND `class` = 4");
              $result['integral']=round($result['integral'],2);
              tpl::assign('member',$result);
              tpl::assign('tx_result',$tx_result);
              tpl::assign('tjex_txbl',$tjex_txbl['config']);
              tpl::assign('dqurl',$_SERVER['HTTP_HOST']);  
              $tpl     = 'ffsm/user_jftx.tpl';
            }
        }else{
          header("location:".$this->http_type.$_SERVER['HTTP_HOST']."/?ac=userlogin");
          exit();
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
	
	//积分提现明细
  public function user_jftxmx(){
   		if(Login::isLoggedin()){
          	$query="select * from `users` where `user_name`='".$_COOKIE['user_name']."'";
    		$result = db::get_one($query);
              $tx_query="SELECT * FROM `ffsm_dl_jftx` WHERE `uid` = '".$result['uid']."' ORDER BY `add_time` DESC";
          	  $tx_query_count="SELECT count(*) as csum FROM `ffsm_dl_jftx` WHERE `uid` = '".$result['uid']."'";
          	  $pages=$this->findNumc(req::item('page'));
             if($pages<=1){
               $page=1;
             }else{
               $page=ceil($pages);
             }
          	  $list_page=$this->list_page($tx_query,$tx_query_count,$page,10);
          		if($pages>=$list_page[page]){
               		$page=$list_page[page];
             	}
              tpl::assign('member',$result);
              tpl::assign('tx_result',$list_page['list']);
          	  tpl::assign('pagepre',$page-1);
          	  tpl::assign('pagenext',$page+1);
          	  tpl::assign('end0page',$list_page['page']);
              tpl::assign('dqurl',$_SERVER['HTTP_HOST']);  
              $tpl     = 'ffsm/user_jfmx.tpl';
        }else{
          header("location:".$this->http_type.$_SERVER['HTTP_HOST']."/?ac=userlogin");
          exit();
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
   //资料设置
  public function user_spacecp(){
    	if(Login::isLoggedin()){
          	$query="select * from `users` where `user_name`='".$_COOKIE['user_name']."'";
    		$result = db::get_one($query);
          	if(req::item('zlbc')){
              db::query("UPDATE `users` SET `phone` = '".req::item('phone')."', `qq` = '".req::item('qq')."' WHERE `users`.`uid` = '".$result['uid']."'");   
              tpl::assign('relog',"设置成功！");
              tpl::assign('relogurl',"member");
              $tpl     = 'ffsm/userlog.tpl';
            }else{
              tpl::assign('member',$result);
              $tpl     = 'ffsm/user_spacecp.tpl';
            }
        }else{
          header("location:".$this->http_type.$_SERVER['HTTP_HOST']."/?ac=userlogin");
          exit();
        }
        $content = tpl::fetch($tpl);
        exit($content);
    }
  //我的测算
  public function user_wdcs(){
   		if(Login::isLoggedin()){
          	$query="select * from `users` where `user_name`='".$_COOKIE['user_name']."'";
    		$result = db::get_one($query);
              $tx_query="SELECT * FROM `ffsm_orders` WHERE `pay_uid` = '".$result['uid']."' ORDER BY `createtime` DESC";
          	  $tx_query_count="SELECT count(*) as csum FROM `ffsm_orders` WHERE `pay_uid` = '".$result['uid']."'";
          	  $pages=$this->findNumc(req::item('page'));
             if($pages<=1){
               $page=1;
             }else{
               $page=ceil($pages);
             }
          	  $list_page=$this->list_page($tx_query,$tx_query_count,$page,10);
          		if($pages>=$list_page[page]){
               		$page=$list_page[page];
             	}
          	  $list_page['list']['data']=json_decode(urldecode($list_page['list']['data']),true);
          	  $type=array(1=>"八字分析",2=>"八字合婚",3=>"姓名分析",4=>"姓名配对",5=>"紫微斗数",6=>"综合分析",7=>"姻缘分析",8=>"八字精批",9=>"爱情运势",10=>"八字分析电脑版",11=>"结婚运 ",12=>"今年运程",13=>"待定",14=>"财运详批",15=>"待定",16=>"八字姻缘",17=>"待定",18=>"号码吉凶",19=>"待定",20=>"起名分析",21=>"许愿点灯",22=>"号码吉凶",23=>"宝宝起名",24=>"公司测名",25=>"预约大师",26=>"塔罗运势",27=>"塔罗暗恋",28=>"心里有你",29=>"能否继续",30=>"塔罗爱情",31=>"塔罗脱单",32=>"塔罗复合",33=>"走到最后",34=>"塔罗分手",35=>"塔罗别人",36=>"星座命盘",37=>"星座运势",38=>"VIP包月",39=>"VIP包年",40=>"VIP终身",101=>"邀请积分",102=>"分享积分",103=>"注册积分",301=>"实时财运");
          		$data=array();
          		$m=0;
              foreach($list_page['list'] as $k=>$v){
                $data[$m]['oid']=$v['oid'];
                $data[$m]['data']=json_decode(urldecode($v['data']),true);
          		$data[$m]['createtime']=date("Y-m-d H:i:s",$v['createtime']);
         	 	$data[$m]['type']=$type[$v['type']];
         	 	$data[$m]['status']=$v['status'];
                  $ac=mod_order::typetochannel($v['type']);
                  $data[$m]['url'] = "/?ac=".$ac."&oid=".$v['oid']."&token=".base64_encode(md5($v['oid']));
                	$m++;
                }
              $result['dl_syjf']=round($result['dl_syjf'],2);//佣金保留两位数
              tpl::assign('member',$result);
              
              tpl::assign('result',$data);
          	  tpl::assign('pagepre',$page-1);
          	  tpl::assign('pagenext',$page+1);
          	  tpl::assign('type',$type);
          	  tpl::assign('end0page',$list_page['page']);
              tpl::assign('dqurl',$_SERVER['HTTP_HOST']);  
              $tpl     = 'ffsm/user_wdcs.tpl';
        }else{
          header("location:".$this->http_type.$_SERVER['HTTP_HOST']."/?ac=userlogin");
          exit();
        }
        $content = tpl::fetch($tpl);
        exit($content);		
    }
	public function is_username($is_username){
			$sql1 ="select count(*) as num from `users` where `user_name`='".$is_username."'";
        	$rsid = db::fetch_one(db::query($sql1));
			return $rsid['num'];
    }
  //分页调用数据$ppp 每页显示多少条 $sql_count 获取共多少条数据sql $page页码
    public function list_page($sql,$sql_count,$page = 1,$ppp = 10){
        $sp_count = db::queryone($sql_count);
        if($sp_count['csum']<=$ppp){
            $pagecount=1;
        }else{
            $pagecount=ceil($sp_count['csum']/$ppp);
        }
		if($page<1){
            $page=1;
        }elseif($page>$pagecount){
          $page=$pagecount;
        }else{
            $page=intval($page);
        }
        $sp_limit=" limit ".($page-1)*$ppp.",".$ppp;
        $row['list'] = db::querylist($sql.$sp_limit);
        $row['page'] = $pagecount;
        if($page>1){
            $row['pm']=($page-1)*$ppp;
        }
        return $row;
    }
    public function send_test(){
        $post_data = array('Sex'=>1,'Solar'=>1,'Year'=>'1988','Month'=>1,'Day'=>'2','Hour'=>'1','Leap'=>'0','FUNC'=>'Basic');
        $msg = send("https://fate.windada.com/cgi-bin/predict", $post_data);
        print_r($msg);
    }
    /** API */
    public function car_bieren(){
        $sql = 'select * from `ffsm_taluo_bieren` where `lie`=1 ORDER BY rand() limit 1';
        $one = db::queryone($sql);
        if($one['img']==''){
            $one['img'] = self::carimg($one['pid'],$one['zf']);
        }
        $one['titles'] = preg_replace('|[0-9a-zA-Z/]+|','',$one['title']);
        $one['titles'] = preg_replace("/\t/","",$one['titles']);


        $sql = 'select * from `ffsm_taluo_bieren` where `lie`=2 and `pid`!="'.$one['pid'].'" ORDER BY rand() limit 1';
        $two = db::queryone($sql);

        if($two['img']==''){
            $two['img'] = self::carimg($two['pid'],$two['zf']);
        }
        $two['titles'] = preg_replace('|[0-9a-zA-Z/]+|','',$two['title']);
        $two['titles'] = preg_replace("/\t/","",$two['titles']);

        $sql = 'select * from `ffsm_taluo_bieren` where `lie`=3 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" ORDER BY rand() limit 1';
        $three = db::queryone($sql);

        if($three['img']==''){
            $three['img'] = self::carimg($three['pid'],$three['zf']);
        }
        $three['titles'] = preg_replace('|[0-9a-zA-Z/]+|','',$three['title']);
        $three['titles'] = preg_replace("/\t/","",$three['titles']);


        $sql = 'select * from `ffsm_taluo_bieren` where `lie`=4 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" and `pid`!="'.$three['pid'].'" ORDER BY rand() limit 1';
        $four = db::queryone($sql);

        if($four['img']==''){
            $four['img'] = self::carimg($four['pid'],$four['zf']);
        }
        $four['titles'] = preg_replace('|[0-9a-zA-Z/]+|','',$four['title']);
        $four['titles'] = preg_replace("/\t/","",$four['titles']);


        $sql = 'select * from `ffsm_taluo_bieren` where `lie`=5 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" and `pid`!="'.$three['pid'].'" and `pid`!="'.$four['pid'].'" ORDER BY rand() limit 1';
        $five = db::queryone($sql);

        if($five['img']==''){
            $five['img'] = self::carimg($five['pid'],$five['zf']);
        }
        $five['titles'] = preg_replace('|[0-9a-zA-Z/]+|','',$five['title']);
        $five['titles'] = preg_replace("/\t/","",$five['titles']);


        $sql = 'select * from `ffsm_taluo_bieren` where `lie`=6 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" and `pid`!="'.$three['pid'].'" and `pid`!="'.$four['pid'].'" and `pid`!="'.$five['pid'].'" ORDER BY rand() limit 1';
        $six = db::queryone($sql);

        if($six['img']==''){
            $six['img'] = self::carimg($six['pid'],$six['zf']);
        }
        $six['titles'] = preg_replace('|[0-9a-zA-Z/]+|','',$six['title']);
        $six['titles'] = preg_replace("/\t/","",$six['titles']);

        echo json_encode(array('one'=>$one,'two'=>$two,'three'=>$three,'four'=>$four,'five'=>$five,'six'=>$six));
      
  }
  /**抽取数据库牌库-1-2-3列随机抽取*/
    public function car(){
        $sql = 'select * from `ffsm_taluo_yunshi` where `lie`=1 ORDER BY rand() limit 1';
        $one = db::queryone($sql);

        if($one['img']==''){
            $one['img'] = self::carimg($one['pid'],$one['zf']);
        }


        $sql = 'select * from `ffsm_taluo_yunshi` where `lie`=2 and `pid`!="'.$one['pid'].'" ORDER BY rand() limit 1';
        $two = db::queryone($sql);

        if($two['img']==''){
            $two['img'] = self::carimg($two['pid'],$two['zf']);
        }

        $sql = 'select * from `ffsm_taluo_yunshi` where `lie`=3 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" ORDER BY rand() limit 1';
        $three = db::queryone($sql);

        if($three['img']==''){
            $three['img'] = self::carimg($three['pid'],$three['zf']);
        }

        echo json_encode(array('one'=>$one,'two'=>$two,'three'=>$three));

    }

    /***卡牌图库*/
	public function carimg($pid,$zf){
	    $imgdir = '/statics/ffsm/taluo/yunshi/images/';
	    return $imgdir.$pid.'_'.$zf.'.jpg';
    }
    /**抽取数据库牌库-1-2-3列随机抽取*/
    public function car_xinli(){
        $sql = 'select * from `ffsm_taluo_xinli` where `lie`=1 ORDER BY rand() limit 1';
        $one = db::queryone($sql);

        if($one['img']==''){
            $one['img'] = self::carimg($one['pid'],$one['zf']);
        }
        $sql = 'select * from `ffsm_taluo_xinli` where `lie`=2 and `pid`!="'.$one['pid'].'" ORDER BY rand() limit 1';
        $two = db::queryone($sql);

        if($two['img']==''){
            $two['img'] = self::carimg($two['pid'],$two['zf']);
        }
        $sql = 'select * from `ffsm_taluo_xinli` where `lie`=3 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" ORDER BY rand() limit 1';
        $three = db::queryone($sql);
        if($three['img']==''){
            $three['img'] = self::carimg($three['pid'],$three['zf']);
        }
        $sql = 'select * from `ffsm_taluo_xinli` where `lie`=4 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" and `pid`!="'.$three['pid'].'" ORDER BY rand() limit 1';
        $four = db::queryone($sql);

        if($four['img']==''){
            $four['img'] = self::carimg($four['pid'],$four['zf']);
        }

        echo json_encode(array('one'=>$one,'two'=>$two,'three'=>$three,'four'=>$four));

    }
    /**抽取数据库牌库-1-2-3列随机抽取*/
    public function car_anlian(){
        $sql = 'select * from `ffsm_taluo_anlian` where `lie`=1 ORDER BY rand() limit 1';
        $one = db::queryone($sql);

        if($one['img']==''){
            $one['img'] = self::carimg($one['pid'],$one['zf']);
        }
        $sql = 'select * from `ffsm_taluo_anlian` where `lie`=2 and `pid`!="'.$one['pid'].'" ORDER BY rand() limit 1';
        $two = db::queryone($sql);

        if($two['img']==''){
            $two['img'] = self::carimg($two['pid'],$two['zf']);
        }

        $sql = 'select * from `ffsm_taluo_anlian` where `lie`=3 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" ORDER BY rand() limit 1';
        $three = db::queryone($sql);

        if($three['img']==''){
            $three['img'] = self::carimg($three['pid'],$three['zf']);
        }
        $sql = 'select * from `ffsm_taluo_anlian` where `lie`=4 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" and `pid`!="'.$three['pid'].'" ORDER BY rand() limit 1';
        $four = db::queryone($sql);

        if($four['img']==''){
            $four['img'] = self::carimg($four['pid'],$four['zf']);
        }
        echo json_encode(array('one'=>$one,'two'=>$two,'three'=>$three,'four'=>$four));
    }
    /**抽取数据库牌库-1-2-3列随机抽取*/
    public function car_jixu(){
        $sql = 'select * from `ffsm_taluo_jixu` where `lie`=1 ORDER BY rand() limit 1';
        $one = db::queryone($sql);

        if($one['img']==''){
            $one['img'] = self::carimg($one['pid'],$one['zf']);
        }
        $sql = 'select * from `ffsm_taluo_jixu` where `lie`=2 and `pid`!="'.$one['pid'].'" ORDER BY rand() limit 1';
        $two = db::queryone($sql);

        if($two['img']==''){
            $two['img'] = self::carimg($two['pid'],$two['zf']);
        }
        $sql = 'select * from `ffsm_taluo_jixu` where `lie`=3 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" ORDER BY rand() limit 1';
        $three = db::queryone($sql);
        if($three['img']==''){
            $three['img'] = self::carimg($three['pid'],$three['zf']);
        }
        $sql = 'select * from `ffsm_taluo_jixu` where `lie`=4 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" and `pid`!="'.$three['pid'].'" ORDER BY rand() limit 1';
        $four = db::queryone($sql);

        if($four['img']==''){
            $four['img'] = self::carimg($four['pid'],$four['zf']);
        }
        echo json_encode(array('one'=>$one,'two'=>$two,'three'=>$three,'four'=>$four));
    }
    /**抽取数据库牌库-1-2-3列随机抽取*/
    public function car_aiqing(){
        $sql = 'select * from `ffsm_taluo_aiqing` where `lie`=1 ORDER BY rand() limit 1';
        $one = db::queryone($sql);

        if($one['img']==''){
            $one['img'] = self::carimg($one['pid'],$one['zf']);
        }
        $one['titles'] = preg_replace('|[0-9a-zA-Z/]+|','',$one['title']);
        $one['titles'] = preg_replace("/\t/","",$one['titles']);
        $sql = 'select * from `ffsm_taluo_aiqing` where `lie`=2 and `pid`!="'.$one['pid'].'" ORDER BY rand() limit 1';
        $two = db::queryone($sql);

        if($two['img']==''){
            $two['img'] = self::carimg($two['pid'],$two['zf']);
        }
        $two['titles'] = preg_replace('|[0-9a-zA-Z/]+|','',$two['title']);
        $two['titles'] = preg_replace("/\t/","",$two['titles']);

        $sql = 'select * from `ffsm_taluo_aiqing` where `lie`=3 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" ORDER BY rand() limit 1';
        $three = db::queryone($sql);

        if($three['img']==''){
            $three['img'] = self::carimg($three['pid'],$three['zf']);
        }
        $three['titles'] = preg_replace('|[0-9a-zA-Z/]+|','',$three['title']);
        $three['titles'] = preg_replace("/\t/","",$three['titles']);
        $sql = 'select * from `ffsm_taluo_aiqing` where `lie`=4 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" and `pid`!="'.$three['pid'].'" ORDER BY rand() limit 1';
        $four = db::queryone($sql);
        $four['des'] = explode(',',$four['des']);
        if($four['img']==''){
            $four['img'] = self::carimg($four['pid'],$four['zf']);
        }
        $four['titles'] = preg_replace('|[0-9a-zA-Z/]+|','',$four['title']);
        $four['titles'] = preg_replace("/\t/","",$four['titles']);
        $sql = 'select * from `ffsm_taluo_aiqing` where `lie`=5 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" and `pid`!="'.$three['pid'].'" and `pid`!="'.$four['pid'].'" ORDER BY rand() limit 1';
        $five = db::queryone($sql);
        if($five['img']==''){
            $five['img'] = self::carimg($five['pid'],$five['zf']);
        }
        $five['titles'] = preg_replace('|[0-9a-zA-Z/]+|','',$five['title']);
        $five['titles'] = preg_replace("/\t/","",$five['titles']);
        $sql = 'select * from `ffsm_taluo_aiqing` where `lie`=6 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" and `pid`!="'.$three['pid'].'" and `pid`!="'.$four['pid'].'" and `pid`!="'.$five['pid'].'" ORDER BY rand() limit 1';
        $six = db::queryone($sql);
        if($six['img']==''){
            $six['img'] = self::carimg($six['pid'],$six['zf']);
        }
        $six['titles'] = preg_replace('|[0-9a-zA-Z/]+|','',$six['title']);
        $six['titles'] = preg_replace("/\t/","",$six['titles']);

        echo json_encode(array('one'=>$one,'two'=>$two,'three'=>$three,'four'=>$four,'five'=>$five,'six'=>$six));
    }
    /**car_tuodan*/
    public function car_tuodan(){
        $sql = 'select * from `ffsm_taluo_tuodan` where `lie`=1 ORDER BY rand() limit 1';
        $one = db::queryone($sql);

        if($one['img']==''){
            $one['img'] = self::carimg($one['pid'],$one['zf']);
        }
        $sql = 'select * from `ffsm_taluo_tuodan` where `lie`=2 and `pid`!="'.$one['pid'].'" ORDER BY rand() limit 1';
        $two = db::queryone($sql);

        if($two['img']==''){
            $two['img'] = self::carimg($two['pid'],$two['zf']);
        }
        $two['day'] = explode(',',$two['day']);

        if($two['day']==''){
            $two['day'] = array('05月06日','06月13日','07月14日');
        }
        $sql = 'select * from `ffsm_taluo_tuodan` where `lie`=3 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" ORDER BY rand() limit 1';
        $three = db::queryone($sql);

        if($three['img']==''){
            $three['img'] = self::carimg($three['pid'],$three['zf']);
        }
        $sql = 'select * from `ffsm_taluo_tuodan` where `lie`=4 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" and `pid`!="'.$three['pid'].'" ORDER BY rand() limit 1';
        $four = db::queryone($sql);

        if($four['img']==''){
            $four['img'] = self::carimg($four['pid'],$four['zf']);
        }
        $sql = 'select * from `ffsm_taluo_tuodan` where `lie`=5 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" and `pid`!="'.$three['pid'].'" and `pid`!="'.$four['pid'].'" ORDER BY rand() limit 1';
        $five = db::queryone($sql);

        if($five['img']==''){
            $five['img'] = self::carimg($five['pid'],$five['zf']);
        }
        echo json_encode(array('one'=>$one,'two'=>$two,'three'=>$three,'four'=>$four,'five'=>$five));
    }
    public function car_fuhe(){
        $sql = 'select * from `ffsm_taluo_fuhe` where `lie`=1 ORDER BY rand() limit 1';
        $one = db::queryone($sql);

        if($one['img']==''){
            $one['img'] = self::carimg($one['pid'],$one['zf']);
        }
        $sql = 'select * from `ffsm_taluo_fuhe` where `lie`=2 and `pid`!="'.$one['pid'].'" ORDER BY rand() limit 1';
        $two = db::queryone($sql);

        if($two['img']==''){
            $two['img'] = self::carimg($two['pid'],$two['zf']);
        }
        $sql = 'select * from `ffsm_taluo_fuhe` where `lie`=3 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" ORDER BY rand() limit 1';
        $three = db::queryone($sql);

        if($three['img']==''){
            $three['img'] = self::carimg($three['pid'],$three['zf']);
        }
        $sql = 'select * from `ffsm_taluo_fuhe` where `lie`=4 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" and `pid`!="'.$three['pid'].'" ORDER BY rand() limit 1';
        $four = db::queryone($sql);

        if($four['img']==''){
            $four['img'] = self::carimg($four['pid'],$four['zf']);
        }
        echo json_encode(array('one'=>$one,'two'=>$two,'three'=>$three,'four'=>$four));
    }
    public function car_zuihou(){
        $sql = 'select * from `ffsm_taluo_zuihou` where `lie`=1 ORDER BY rand() limit 1';
        $one = db::queryone($sql);

        if($one['img']==''){
            $one['img'] = self::carimg($one['pid'],$one['zf']);
        }
        $sql = 'select * from `ffsm_taluo_zuihou` where `lie`=2 and `pid`!="'.$one['pid'].'" ORDER BY rand() limit 1';
        $two = db::queryone($sql);

        if($two['img']==''){
            $two['img'] = self::carimg($two['pid'],$two['zf']);
        }

        $sql = 'select * from `ffsm_taluo_zuihou` where `lie`=3 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" ORDER BY rand() limit 1';
        $three = db::queryone($sql);

        if($three['img']==''){
            $three['img'] = self::carimg($three['pid'],$three['zf']);
        }
        $sql = 'select * from `ffsm_taluo_zuihou` where `lie`=4 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" and `pid`!="'.$three['pid'].'" ORDER BY rand() limit 1';
        $four = db::queryone($sql);

        if($four['img']==''){
            $four['img'] = self::carimg($four['pid'],$four['zf']);
        }
        echo json_encode(array('one'=>$one,'two'=>$two,'three'=>$three,'four'=>$four));
    }
	public function car_fenshou(){
        $sql = 'select * from `ffsm_taluo_fenshou` where `lie`=1 ORDER BY rand() limit 1';
        $one = db::queryone($sql);

        if($one['img']==''){
            $one['img'] = self::carimg($one['pid'],$one['zf']);
        }
        $sql = 'select * from `ffsm_taluo_fenshou` where `lie`=2 and `pid`!="'.$one['pid'].'" ORDER BY rand() limit 1';
        $two = db::queryone($sql);
        if($two['img']==''){
            $two['img'] = self::carimg($two['pid'],$two['zf']);
        }
        $sql = 'select * from `ffsm_taluo_fenshou` where `lie`=3 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" ORDER BY rand() limit 1';
        $three = db::queryone($sql);
        if($three['img']==''){
            $three['img'] = self::carimg($three['pid'],$three['zf']);
        }
        $sql = 'select * from `ffsm_taluo_fenshou` where `lie`=4 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" and `pid`!="'.$three['pid'].'" ORDER BY rand() limit 1';
        $four = db::queryone($sql);
        if($four['img']==''){
            $four['img'] = self::carimg($four['pid'],$four['zf']);
        }
        echo json_encode(array('one'=>$one,'two'=>$two,'three'=>$three,'four'=>$four));
    }
}