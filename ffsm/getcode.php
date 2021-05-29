<?php
/**
 * @author: lion
 * @link: http://lionsay.com/codetoany.html
 */
include '../core/wxpaycf.php';
$money = $_GET['money'];
$app = $_GET['app'];
$cashier_id = $_GET['cashier_id'];
$user_id = $_GET['user_id'];
$oid = $_GET['oid'];
require 'library/Authorize.php';
$http_type = ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') || (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https')) ? 'https://' : 'http://';
$site_url=$http_type . $_SERVER['HTTP_HOST'];
$appId = WX_APPID;
$authorize = new lion\weixin\library\Authorize($appId);
$redirectUrlConfig = ['demo3' => $site_url.'/?ct=pay&ac=wxjsapi&oid='.$oid,];
$authorize->authorizeCodeToUrl($redirectUrlConfig);
