<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8"/>
<title><{$ming}>恭喜<{$username}>成功开通<{$des_f}>-<{$zhanming}></title>
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
<meta content="telephone=no" name="format-detection"/>
<link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
<link href="/statics/ffsm/public/wap.min-v=0817.css" rel="stylesheet" type="text/css"/>
<link href="/statics/VIP/vip.css" rel="stylesheet" type="text/css"/>
<{include file='./ffsm/wx_share.tpl'}>
<script src="https://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
<header class="public_header J_testFixedShow">
<h1 class="public_h_con"><{$username}>的<{$des_f}></h1>
<a class="public_h_home" href="/"></a><a href="?ac=history" class="public_h_menu">我的测试</a></header>

<div class="aui-loan-body">
<h1>成功开通<{$des_f}></h1>
<p>vip到期时间:<{$vip_time}></p>
</div>

<div class="after_sales_link"><a href="/?ac=member" hidetxt="积分支付">个人中心</a></div>

<div class="aui-image-text b-line">
			<a href="javascript:;" class="aui-flex ">
				<div class="aui-flex-box">
					<h2>欢迎成为VIP会员</h2>
				</div>
			</a>
		</div>
<div class="wenxintishi">
<h5>温馨提示</h5>
<p>把测试链接分享到朋友圈或好友，好友付款后你可获得相应积分</p>
<p>购买VIP会员可免费测试所有付费项目</p>
<p>详情查看：<a href="/?ac=member">个人中心</a></p>
</div>
<div class="public_banner">
	<img src="/statics/VIP/king.png" alt="积分支付"/>
</div>

<{include file='./ffsm/footers.tpl'}>
<{include file='./ffsm/dl_ck.tpl'}>
<script type="text/javascript">
function _resize(){
    var html= document.getElementsByTagName('html')[0];
    var hW = html.offsetWidth > 750 ? 750 : html.offsetWidth;
    var fS = 100/750 * hW;
    html.style.fontSize = fS+"px"
}
_resize();
window.onresize = function(){
    _resize();
};
</script>
</body>
</html>