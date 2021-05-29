<?php
require 'curl.php';
echo $_COOKIE["openid"];
echo $_GET['code'];
define("redirect_uri", "http://www.yiabs.com/?ac=qiming&teacher=lyl");
$redirect_uri=urlencode(redirect_uri);

  MyCurl::user_login(client_id,client_secret,$redirect_uri,$_GET['code']);
 






