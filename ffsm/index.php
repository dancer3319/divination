<?php
chdir('../');
$ct = isset($_REQUEST['ct'])?($_REQUEST['ct']):'';
$ac = isset($_REQUEST['ac'])?($_REQUEST['ac']):'';
if($ct == ''){
$cts = 'ffsm_h5_index';
}

if($ac=='rtcaiyun' || $ac=='rtcaiyun_example'){
$cts = 'ffsm_sm_ssys';
}
$ctsff_arr=array('ssxo','ssjf','ssjs','ssjk','ssjj','sslg','ssnvp','ssnnp','ssvvp','sscwy','sssx','sscp');

if(in_array($ac, $ctsff_arr)){
	$cts = 'ffsm_sm_'.$ac;
}
require_once './index.php';

?>
