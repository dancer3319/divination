<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<title>运势测算程序后台登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="/acs/images/login/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="/acs/images/login/js/login.js"></script>
<link href="/acs/images/login/css/login2.css" rel="stylesheet" type="text/css" />
</head>
<body>
<h1>《思考牛文化》测算程序后台登录<sup></sup></h1>
<div class="login" style="margin-top:50px;">
<div class="header">
<div class="switch" id="switch"><a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">快速登录</a>
<a class="switch_btn" id="switch_login" href="javascript:void(0);" tabindex="8">代理注册</a><div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;"></div>
</div>
</div>
<div class="web_qr_login" id="web_qr_login" style="display: block; height: 235px;">

<div class="web_login" id="web_login">
<div class="login-box">
<div class="login_form">
<form action="?ct=index&ac=login" name="loginform" accept-charset="utf-8" id="login_form" class="loginForm" method="post">
<input type="hidden" name="gourl" value="<{$gourl}>" />
<div class="uinArea" id="uinArea">
<label class="input-tips" for="username">帐号：</label>
<div class="inputOuter" id="uArea">
<input type="text" id="u" name="username" class="inputstyle" />
</div>
</div>
<div class="pwdArea" id="pwdArea">
<label class="input-tips" for="password">密码：</label>
<div class="inputOuter" id="pArea">
<input type="password" id="p" name="password" class="inputstyle" />
</div>
</div>
<div style="margin-top:20px;"><input type="submit" value="登 录" style="width:100%;" class="button_blue" /></div>
</form>
</div>
</div>
</div>

</div>

<div class="qlogin" id="qlogin" style="display: none; ">
<div class="web_login"><form name="form2" id="regUser" accept-charset="utf-8" action="?ct=index&ac=login" method="post">
<input type="hidden" name="reg" value="1" />
<input type="hidden" name="gourl" value="<{$gourl}>" />
<ul class="reg_form" id="reg-ul">
<div id="userCue" class="cue">注册成功后可分销获取提成</div>
<li>
<label for="username" class="input-tips2">用户名：</label>
<div class="inputOuter2">
<input type="text" id="user" name="username" maxlength="16" class="inputstyle2" placeholder="请使用英文或数字" />
</div>
</li>
<li>
<label for="nickname" class="input-tips2">用户昵称：</label>
<div class="inputOuter2">
<input type="text" id="nickname" name="nickname" maxlength="16" class="inputstyle2" placeholder="请输入昵称（必须汉字）" />
</div>
</li>
<li>
<label for="password" class="input-tips2">密码：</label>
<div class="inputOuter2">
<input type="password" id="password" name="password" maxlength="16" class="inputstyle2" />
</div>
</li>
<li>
<label for="password2" class="input-tips2">确认密码：</label>
<div class="inputOuter2">
<input type="password" id="password2" name="password2" maxlength="16" class="inputstyle2" />
</div>
</li>
<li>
<label for="email" class="input-tips2">Email：</label>
<div class="inputOuter2">
<input type="text" id="email" name="email" maxlength="50" class="inputstyle2" placeholder="必填（方便找回密码）" />
</div>
</li>
<li>
<label for="email" class="input-tips2">验证码：</label>
<div class="inputOuter2">
<img src="gd_sub_num.php" onclick="this.src='gd_sub_num.php?time='+new Date().getTime()" style="cursor:hand;height: 28px;vertical-align: bottom;cursor:hand;" ><input type="text" name="yzm" id="yzm" size="10" maxlength="10" class="inputstyle2" style="width: 35px;height: 25px;margin-left: 5px;">
</div>
</li>
<li>
<div class="inputArea">
<input type="button" id="reg" style="width:100%;" class="button_blue" value="注册" /> 
</div>
</li><div class="cl"></div>
</ul></form>
</div>
</div>
</div>
<div style="text-align:center;">
	<a href="http://www.9nw.cc/" target="_blank"><span style="font-size: 14px;color: #ffffff;margin-top: 30px;display: block;">忘记密码</span></a> 
</div>
<script type="text/javascript" src="#http://www.9nw.cc/api.php?mod=js&bid=84"></script>
</body></html>