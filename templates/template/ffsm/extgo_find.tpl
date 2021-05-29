<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8"/>
<title>积分支付</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
<meta content="telephone=no" name="format-detection"/>
<link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
<link href="/statics/ffsm/public/wap.min-v=0817.css" rel="stylesheet" type="text/css"/>
<link href="/statics/ffsm/inquiry/1/inquiry.min.css" rel="stylesheet" type="text/css"/>
<{include file='./ffsm/wx_share.tpl'}>
<script src="https://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
<header class="public_header">
<h1 class="public_h_con">积分支付</h1>
<a class="public_h_home" href="/"></a><a href="/?ac=history" class="public_h_menu">我的测试</a></header>
<p class="public_banner">
	<img src="/statics/ffsm/public/images/banner_wd.png" alt="付费测试"/>
</p>
<div class="public_orders_search">
	<div class="public_os_info">
		提示：订单支付成功！
	</div>
	<ul class="problem_feedback">
		<li><a class="after_sales_link" href="<{$order_url}>" hidetxt="查看订单">查看订单</a></li>
		<li><a href="javascript:;" onclick="history.go(-1);" class="btn_back">返回</a></li>
	</ul>
</div>
<div class="ainuo_foot_nav cl" id="testFixedBtn">
    <ul>
     <li><a href="/"><i class="shouye_1"></i><p>测试首页</p></a></li>
     <li><a href="/?ac=history"><i class="wddd_1"></i><p>订单查询</p></a></li>
     <li><a href="/"class="botpost"><em><i class="lijics_1"></i></em><p>继续测试</p></a></li>
     <li><a href="/"><i class="gengduo_1"></i><p>更多测试</p></a></li>
     <li><a href="/?ac=member"><i class="grzx_1"></i><p>个人中心</p></a></li>
    </ul>
</div>
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
<{include file='./ffsm/footer.tpl'}>
<{include file='./ffsm/dl_ck.tpl'}>
</body>
</html>