<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8"/>
<title>常见问题解答-<{$zhanming}></title>
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
<meta content="telephone=no" name="format-detection"/>
<link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
<link href="/statics/ffsm/ssxo/css/wap.css" rel="stylesheet" type="text/css"/>
<link href="/statics/VIP/vip.css" rel="stylesheet" type="text/css"/>
<{include file='./ffsm/wx_share.tpl'}>
<script src="/statics/ffsm/ssxo/js/jquery.min.js"></script>
</head>
<body>
<div class="aui-loan-body">
<h1>常见问题解答</h1>
<p><{$faq_subject}></p>
</div>
<div class="faq-menu">
	<ul>
		<li><a href="javascript:history.back(-1)"><img src="/statics/ffsm/ssxo/img/faq_back.png" alt="" class="bg2"><p>返回上页</p></a></li>
		<li><a href="/?ac=tuiguang"><img src="/statics/ffsm/ssxo/img/tg_icon.png" alt="" class="bg2"><p>赚取佣金</p></a></li>
		<li><a href="/?ac=member"><img src="/statics/ffsm/ssxo/img/faq_member.png" alt="" class="bg3"><p>个人中心</p></a></li>
		<li><a href="javascript:void(0)" onclick="MobileChatWindow.openChatWindow()"><img src="/statics/ffsm/ssxo/img/lx_icon.png" alt="" class="bg5"><p>联系客服</p></a></li>

	</ul>
</div>
<style type="text/css">
  #minxtmsgtitlecontainer,#agentListdiv{display: none !important;}
</style>
<script type="text/javascript" src="https://3.molinsoft.com/jsCode?publishId=297eb8b371f0bce10171f4ea058d77fb"></script>
<div class="wenxintishi">
<{foreach from=$faq key=k item=v}>			  
<h5><{$k+1}>.<{$v.question}></h5>
<p><{$v.answer}></p>
<p></p><br>
<{/foreach}>
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
<{include file='./ffsm/ss_share.tpl'}>
</body>
</html>