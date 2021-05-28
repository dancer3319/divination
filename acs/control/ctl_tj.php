<?php
if( !defined('CORE') ) exit('Request Error!');

class ctl_tj extends common{
    // 自动验证设置
    protected $_submit_validate     =   array(
        'oid'=>array('','notempty','','all'),
        'id'=>array('id','notempty','主键必须！','update'),
    );

    protected $_db_validate     =   array(
       // 'title'=>array('title','unique','已经存在！','all','extend'=>array('cp','type')),
    );
	protected $_uploadFile = array(
        'img'=>array('name'=>'img','size'=>'','format'=>array('jpg','png','gif'),'save_path'=>PATH_ROOT),
    );
    // 自动填充设置
    protected $_auto     =   array(
        'cp'=>array('cp','value','1','all'),
        //入表时间和更新时间放到构造函数中执行，因为此处不支持动态赋值
    );
    protected $_allowAction = array();//允许操作的方法列表


    //对应的菜单项分类，1：内涵图；2：视频；3：段子手；4：微博热帖。
	protected $paytype = array( 1=>'微信', 2=>'支付宝');
    protected $status = array(0=>'待付费',1=>'已付费');
  	protected $dl_status = array(0=>'未结算',1=>'已结算');

    protected $jiesuan = array(0=>'未结算',1=>'申请提现',2=>'已打款',3=>'无效退款');

    protected $type = array(1=>'事业财运', 2=>'八字合婚', 3=>'姓名分析', 4=>'姓名配对', 5=>'紫薇命盘', 6=>'八字综合', 7=>'姻缘测算', 8=>'八字精批', 9=>'爱情运势', 10=>'精批PC版', 25=>'在线预约', 12=>'今年运程', 21=>'许愿点灯', 16=>'月老姻缘', 18=>'号码测算',23=>'宝宝起名',24=>'公司起名',26=>'塔罗运势',27=>'塔罗暗恋',28=>'塔罗心里',29=>'塔罗继续',30=>'塔罗爱情',31=>'塔罗脱单',32=>'塔罗复合',33=>'塔罗最后',34=>'塔罗分手',35=>'塔罗别人',37=>'星座运势',36=>'等待开发');


    public function __construct()
    {
        parent::__construct();
    }


    public function checkorder($go,$en,$uid){


        /*
        $sql = 'select * from `ffsm_orders` where status=1 and paytime>'.$go.' and paytime<'.$en;
        $row = db::querylist($sql);

        $sql = 'select count(id) as num from `ffsm_orders` where  createtime>'.$go.' and createtime<'.$en;
        $numall = db::queryone($sql);

        $sqli = 'select count(id) as num from `ffsm_orders` where status=1 and createtime>'.$go.' and createtime<'.$en;
        $numpay = db::queryone($sqli);


        $sql = 'select * from `ffsm_orders` where status=1 and paytime like "'.date('Y-m-d',$go).'%"';
        $row = db::querylist($sql);

        $sql = 'select count(id) as num from `ffsm_orders` where  createtime like "'.date('Y-m-d',$go).'%"';
        $numall = db::queryone($sql);

        $sqli = 'select count(id) as num from `ffsm_orders` where status=1 and createtime like "'.date('Y-m-d',$go).'%"';
        $numpay = db::queryone($sqli);
        */

        $sql = 'select * from `ffsm_orders` where status=1 and uid="'.$uid.'" and createtime>"'.strtotime(date('Y-m-d H:i:s',$go)).'" and createtime<"'.strtotime(date('Y-m-d H:i:s',$en)).'"  and status=1 ' ;


        $row = db::querylist($sql);

        $sql = 'select count(id) as num from `ffsm_orders` where uid="'.$uid.'" and  createtime>"'.strtotime(date('Y-m-d H:i:s',$go)).'" and createtime<"'.strtotime(date('Y-m-d H:i:s',$en)).'"';
        $numall = db::queryone($sql);

        $sqli = 'select count(id) as num from `ffsm_orders` where status=1 and uid="'.$uid.'" and  createtime>"'.strtotime(date('Y-m-d H:i:s',$go)).'" and createtime<"'.strtotime(date('Y-m-d H:i:s',$en)).'" and status=1 ';
        
        $numpay = db::queryone($sqli);

        $total = 0;
        foreach($row as $k=>$v){
            $total = $total+$v['money'];
        }

        $data['numall'] = $numall['num'];
        $data['numpay'] = $numpay['num'];

        $bili = $data['numpay']/$data['numall']*100;
        $bili==''?$bili=0:$bili=$bili;

        $data['bili'] = round($bili,2).'%';
        $data['total'] = $total;


        return $data;
    }


    public function index(){
		global $config;
        require(PATH_CONFIG.'/inc_groups_name.php');
        $acc_ctl = cls_access::get_instance();
      	$sql1 = "SELECT * FROM `users` WHERE uid ='".$acc_ctl->fields['uid']."'";
		$rsid = db::fetch_one(db::query($sql1));
        $groups = cls_access_cfg::get_acc_groups($acc_ctl->fields['uid'], 'admin', $acc_ctl->fields['groups']);
     
        tpl::assign('users',$rsid);
        tpl::assign('groups', $groups);
        tpl::assign('config_apps', $config['apps']);
        
        $userinfo = cls_access::$accctl->get_userinfos();
        $uid = ($userinfo['uid']);

        //今天
        $beginToday=mktime(0,0,0,date('m'),date('d'),date('Y'));
        $endToday=mktime(0,0,0,date('m'),date('d')+1,date('Y'))-1;
        $data['total_today'] = self::checkorder($beginToday,$endToday,$uid);
        $data['total_today']['lirun'] = $data['total_today']['total']*('0.'.$userinfo['dl_tcbl']);

        //昨天
        $beginYesterday=mktime(0,0,0,date('m'),date('d')-1,date('Y'));
        $endYesterday=mktime(0,0,0,date('m'),date('d'),date('Y'))-1;
        $data['total_yesterday'] = self::checkorder($beginYesterday,$endYesterday,$uid);
        $data['total_yesterday']['lirun'] = $data['total_yesterday']['total']*('0.'.$userinfo['dl_tcbl']);


        //本月
        $beginThismonth=mktime(0,0,0,date('m'),1,date('Y'));
        $endThismonth=mktime(23,59,59,date('m'),date('t'),date('Y'));
        $data['total_smonth'] = self::checkorder($beginThismonth,$endThismonth,$uid);
        $data['total_smonth']['lirun'] = $data['total_smonth']['total']*('0.'.$userinfo['dl_tcbl']);


        $sql = 'select `money` from `ffsm_orders` where status=1 and paytype<>3  and uid="'.$uid.'"';
        $row =  db::querylist($sql);
        $total = 0;
        foreach($row as $k=>$v){
            $total = $total+$v['money'];
        }

        $sql = 'select count(id) as num from `ffsm_orders`  where uid="'.$uid.'"';
        $numall = db::queryone($sql);

        $sqli = 'select count(id) as num from `ffsm_orders` where status=1 and paytype<>3  and uid="'.$uid.'"';
        $numpay = db::queryone($sqli);

        $data['total']['total'] = $total;
        $data['total']['numall'] = $numall['num'];
        $data['total']['numpay'] = $numpay['num'];
        $bili = $data['total']['numpay']/$data['total']['numall']*100;
        $bili==''?$bili=0:$bili=$bili;

        $data['total']['bili'] = round($bili,2).'%';
        $data['total']['lirun'] = $data['total']['total']*('0.'.$userinfo['dl_tcbl']);


        //历史

        tpl::assign('data',$data);
		
		
		//--------------------------------------------------
		
		if($uid==1){
		
			//全部
			$sql_all = 'select *,sum(`money`) as money_sum,count(status) as con from `ffsm_orders` where paytype<>3 GROUP BY `status`';
			$row_all =  db::querylist($sql_all);
			
			$row_alls=array();
			foreach($row_all as $kk=>$vv){
				if($vv['status']==1){
					$row_alls['s_money']+=$vv['money_sum'];
					$row_alls['s_count']+=$vv['con'];
				}
				else{
					$row_alls['f_count']+=$vv['con'];
				}
				$row_alls['all_money']+=$vv['money_sum'];
			}
			$row_alls['wcl']=round($row_alls['s_count']/($row_alls['s_count']+$row_alls['f_count'])*100,2)."%";
			
			tpl::assign('row_alls',$row_alls);

			
			//今天
			$beginToday=mktime(0,0,0,date('m'),date('d'),date('Y'));
			$endToday=mktime(0,0,0,date('m'),date('d')+1,date('Y'))-1;
			$sql_Today = 'select *,sum(`money`) as money_sum,count(status) as con from `ffsm_orders` where createtime>"'.strtotime(date('Y-m-d H:i:s',$beginToday)).'" and createtime<"'.strtotime(date('Y-m-d H:i:s',$endToday)).'" and paytype<>3 GROUP BY `status`';
			$row_Today =  db::querylist($sql_Today);
			
			$row_Todays=array();
			foreach($row_Today as $kk=>$vv){
				if($vv['status']==1){
					$row_Todays['s_money']+=$vv['money_sum'];
					$row_Todays['s_count']+=$vv['con'];
				}
				else{
					$row_Todays['f_count']+=$vv['con'];
				}
				$row_Todays['all_money']+=$vv['money_sum'];
			}
			$row_Todays['wcl']=round($row_Todays['s_count']/($row_Todays['s_count']+$row_Todays['f_count'])*100,2)."%";
			tpl::assign('row_Todays',$row_Todays);
			
			//昨天
			$beginYesterday=mktime(0,0,0,date('m'),date('d')-1,date('Y'));
			$endYesterday=mktime(0,0,0,date('m'),date('d'),date('Y'))-1;
			$sql_Yesterday = 'select *,sum(`money`) as money_sum,count(status) as con from `ffsm_orders` where createtime>"'.strtotime(date('Y-m-d H:i:s',$beginYesterday)).'" and createtime<"'.strtotime(date('Y-m-d H:i:s',$endYesterday)).'" and paytype<>3 GROUP BY `status`';
			$row_Yesterday =  db::querylist($sql_Yesterday);
			
			$row_Yesterdays=array();
			foreach($row_Yesterday as $kk=>$vv){
				if($vv['status']==1){
					$row_Yesterdays['s_money']+=$vv['money_sum'];
					$row_Yesterdays['s_count']+=$vv['con'];
				}
				else{
					$row_Yesterdays['f_count']+=$vv['con'];
				}
				$row_Yesterdays['all_money']+=$vv['money_sum'];
			}
			$row_Yesterdays['wcl']=round($row_Yesterdays['s_count']/($row_Yesterdays['s_count']+$row_Yesterdays['f_count'])*100,2)."%";
			tpl::assign('row_Yesterdays',$row_Yesterdays);
			
			
			//本月
			$beginThismonth=mktime(0,0,0,date('m'),1,date('Y'));
			$endThismonth=mktime(23,59,59,date('m'),date('t'),date('Y'));
			$sql_Thismonth = 'select *,sum(`money`) as money_sum,count(status) as con from `ffsm_orders` where createtime>"'.strtotime(date('Y-m-d H:i:s',$beginThismonth)).'" and createtime<"'.strtotime(date('Y-m-d H:i:s',$endThismonth)).'" and paytype<>3 GROUP BY `status`';
			$row_Thismonth =  db::querylist($sql_Thismonth);
			
			$row_Thismonths=array();
			foreach($row_Thismonth as $kk=>$vv){

				if($vv['status']==1){
					$row_Thismonths['s_money']+=$vv['money_sum'];
					$row_Thismonths['s_count']+=$vv['con'];
				}
				else{
					$row_Thismonths['f_count']+=$vv['con'];
				}
				$row_Thismonths['all_money']+=$vv['money_sum'];
			}
			$row_Thismonths['wcl']=round($row_Thismonths['s_count']/($row_Thismonths['s_count']+$row_Thismonths['f_count'])*100,2)."%";
			tpl::assign('row_Thismonths',$row_Thismonths);
			
			
		}

        

        tpl::assign('userinfo',$userinfo);

        tpl::display('tj.index.tpl');


    }

    public function add()
    {
        cls_msgbox::show('系统提示','你无权限操作',-1);
        exit();
    }


    public function edit()
    {
        cls_msgbox::show('系统提示','你无权限操作',-1);
        exit();
    }

    public function delete()
    {
        cls_msgbox::show('系统提示','你无权限操作',-1);
        exit();
    }

    /**
     * 批量删除
     */
    public function batch_delete(){

        cls_msgbox::show('系统提示','你无权限操作',-1);

    }


    public function links(){

        $userinfo = cls_access::$accctl->get_userinfos();

        preg_match('/[\w][\w-]*\.(?:com\.cn|com|cn|co|net|org|gov|cc|biz|info|top)/isU', URL, $domain);

        $sql = 'select * from `system`';
        $lists = db::querylist($sql);

        tpl::assign('lists',$lists);

        tpl::assign('userinfo',$userinfo);
        tpl::assign('domain',$domain);

        tpl::display($this->ct.'.'.$this->ac.'.tpl');

    }
  


    private function _deleteImage($image){
        if(is_array($image)){
            foreach($image as $v){
                $this->_deleteImage($v);
            }
        }elseif($image && file_exists(PATH_ROOT.$image)){
            @unlink(PATH_ROOT.$image);
        }
    }
    
    

    //更新采集资源的状态 最新采集的资源status为99 正常status为1
    public function updatestatus(){
        echo 'start<br />';
        if(db::query('update news_data set `status`="1" where `status`="99" limit 1000')){
            echo 'success!';
        }else{
            echo 'fail!';
        }
        exit();
    }

}

