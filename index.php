<?php
$dl = isset($_GET['dl'])?($_GET['dl']):'';
if($dl!=""){
	$expire=time()+60*60*24;
	setcookie("dl", $_GET['dl'], $expire,'/');
}
header('Content-Type: text/html; charset=utf-8');$page_start_time = microtime(true);

require './core/init.php';
$config_pool_name = $config_appname  =  $config_cp_url = '';


if(in_array($cts, $cts_arr)){
	req::$forms['ct'] = $cts;
}
run_controller();
