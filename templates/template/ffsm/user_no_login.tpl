<!DOCTYPE html>
<html>
<head>
<title>未登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
<meta name="format-detection" content="telephone=no">
<SCRIPT language=javascript src="/statics/user/js/jquery-1.9.1.min.js"></SCRIPT>
<SCRIPT language=javascript src="/statics/user/js/layer.js"></SCRIPT>
<script language="javascript">
 function login_check(){
 if (LoginForm.username.value==""){
  alert("请输入用户名！");
  LoginForm.username.focus();
  return false;
 }
  if (LoginForm.password.value==""){
  alert("请输入密码！");
  LoginForm.password.focus();
  return false;
 }
   if (LoginForm.yzm.value==""){
  alert("请输入验证码！");
  LoginForm.yzm.focus();
  return false;
 }
}
</script>
<!--a-->
<link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
<link rel="stylesheet"href="/statics/user/css/frozen.min.css">
<link rel="stylesheet"href="/statics/user/css/style.min.css">
<style type="text/css">
#footer{height:56px;}#footer i{font-size:1.6rem}#footer li.active,#footer li:active,#footer li:hover{font-size:.7rem}
.ui-tiled li{font-size:.7rem}
</style> 
<style>
.open_vip{
background-color: lightcyan;;
}
.ui-border li i em{
font-size: 0.75rem;
}
.aboutpic li{
margin-top: 0.6rem
}
.aboutpic li i img{
width: 2.5rem;
height: 2.5rem;
}
</style>
</head>
<body>
<{include file='./ffsm/user_header.tpl'}>
<header id="header" class="ui-header ui-header-positive ui-border-b" >
<h1></h1>
</header>
<section class="register" style="padding:40px 0 40px 0;">
<div style="display:none"><iframe id="msgubotj" name="msgubotj" width=0 height=0></iframe></div> 
<form id="LoginForm" class="LoginForm" action="" >
<div class="botton" >
<br>
<br>
<br>
<br>
<br>
<input name="login" type="button" class="user_reg_but"  value="立即登录" onclick="location.href='?ac=userlogin&mod=<{$mod}>';">
</div><br>
<br>

<div class="botton" >
<input name="reg" type="button" class="user_reg_but" value="注册会员"  onclick="location.href='?ac=userreg';">
</div>
<br><br>
</form>
<div class="log_connect">
          <div class="title"><h4><span class="cg b_e">用第三方账号登录</span></h4></div>
          <div class="item">
            <ul>
              <li class="b_f"><a href="/?ac=wxlogin"><img src="/statics/user/images/weixin.png"></a></li>
			  <li class="b_f"><a href="/?ac=qqconnect"><img src="/statics/user/images/qqlogin.png"></a></li>
                                        </ul>
          </div>
        </div>
</section>
<{include file='./ffsm/user_footer.tpl'}> 
</body>
</html>