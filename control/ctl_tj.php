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

    protected $type = array(1=>'八字精批', 2=>'姓名分析', 3=>'姓名配对', 4=>'八字合婚', 5=>'年度运势',6=>'八字事业运',7=>'姻缘测试',8=>'综合测试',9=>'紫微斗数',10=>'号码吉凶');


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

        $sql = 'select * from `ffsm_orders` where status=1 and cp="'.$uid.'" and paytime>"'.date('Y-m-d H:i:s',$go).'" and paytime<"'.date('Y-m-d H:i:s',$en).'"';


        $row = db::querylist($sql);

        $sql = 'select count(id) as num from `ffsm_orders` where cp="'.$uid.'" and  createtime>"'.date('Y-m-d H:i:s',$go).'" and createtime<"'.date('Y-m-d H:i:s',$en).'"';
        $numall = db::queryone($sql);

        $sqli = 'select count(id) as num from `ffsm_orders` where status=1 and cp="'.$uid.'" and  createtime>"'.date('Y-m-d H:i:s',$go).'" and createtime<"'.date('Y-m-d H:i:s',$en).'" and paytime>0';
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

        $userinfo = cls_access::$accctl->get_userinfos();
        $uid = ($userinfo['uid']);

        //今天
        $beginToday=mktime(0,0,0,date('m'),date('d'),date('Y'));
        $endToday=mktime(0,0,0,date('m'),date('d')+1,date('Y'))-1;
        $data['total_today'] = self::checkorder($beginToday,$endToday,$uid);
        $data['total_today']['lirun'] = $data['total_today']['total']*('0.'.$userinfo['fencheng']);

        //昨天
        $beginYesterday=mktime(0,0,0,date('m'),date('d')-1,date('Y'));
        $endYesterday=mktime(0,0,0,date('m'),date('d'),date('Y'))-1;
        $data['total_yesterday'] = self::checkorder($beginYesterday,$endYesterday,$uid);
        $data['total_yesterday']['lirun'] = $data['total_yesterday']['total']*('0.'.$userinfo['fencheng']);


        //本月
        $beginThismonth=mktime(0,0,0,date('m'),1,date('Y'));
        $endThismonth=mktime(23,59,59,date('m'),date('t'),date('Y'));
        $data['total_smonth'] = self::checkorder($beginThismonth,$endThismonth,$uid);
        $data['total_smonth']['lirun'] = $data['total_smonth']['total']*('0.'.$userinfo['fencheng']);


        $sql = 'select `money` from `ffsm_orders` where status=1 and paytime>0 and cp="'.$uid.'"';
        $row =  db::querylist($sql);
        $total = 0;
        foreach($row as $k=>$v){
            $total = $total+$v['money'];
        }

        $sql = 'select count(id) as num from `ffsm_orders`  where cp="'.$uid.'"';
        $numall = db::queryone($sql);

        $sqli = 'select count(id) as num from `ffsm_orders` where status=1 and paytime>0  and cp="'.$uid.'"';
        $numpay = db::queryone($sqli);

        $data['total']['total'] = $total;
        $data['total']['numall'] = $numall['num'];
        $data['total']['numpay'] = $numpay['num'];
        $bili = $data['total']['numpay']/$data['total']['numall']*100;
        $bili==''?$bili=0:$bili=$bili;

        $data['total']['bili'] = round($bili,2).'%';
        $data['total']['lirun'] = $data['total']['total']*('0.'.$userinfo['fencheng']);


        //历史

        tpl::assign('data',$data);

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

