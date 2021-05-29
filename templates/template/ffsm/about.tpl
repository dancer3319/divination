<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8"/>
<title>关于我们</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
<meta content="telephone=no" name="format-detection"/>
<link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
<link href="/statics/ffsm/public/wap.min-v=0817.css" rel="stylesheet" type="text/css"/>
<link href="/statics/ffsm/index/1/index.css" rel="stylesheet" type="text/css"/>
<{include file='./ffsm/wx_share.tpl'}>
<script src="https://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
<header class="public_header">
<h1 class="public_h_con">关于我们</h1>
<a class="public_h_home" href="/"></a><a href="/?ac=history" class="public_h_menu">我的测试</a></header>
<{if $gundong}><div class="alert-marquee" id="alertMarquee"><p class="inner"><{$gundong}></p></div><{/if}>
<div class="about_content">
	<p class="about_content_title">
		<{$zhanming}>
	</p>
<p style="text-indent: 2em;">本测试服务为<{$zhanming}>旗下产品、<{$zhanming}>专注于提供易学领域服务、欢迎各界同仁加入我们。</p>
<p style="text-indent: 2em;">未来我们将完善线上与线下的各类产品整合、致力于服务大众。</p>
<p style="text-indent: 2em;">如果你拥有互联网媒体资源、期待与你一起实现共赢。目前我们不断挖掘互联网媒体资源合作、致力于积聚良好的行业人脉和丰富的互联网媒体资源、为<{$zhanming}>扬帆起航做沉稳牢固的基石。</p>
<p style="text-indent: 2em;">遥望未来，我司将不忘初心，精益求精，以其专业的技术、一流的服务、优良的信用为用户创造更大的价值。</p>
<div style="text-align:center;">
	<img src="<{$weixintp}>" width="50%" />
</div>
	<script>
		(function(){
    var num=['<{$weixinhao}>','<{$weixinhao}>','<{$weixinhao}>'];
    var rNum=parseInt(Math.random()*num.length,10);
    document.write('<div style="text-align: center;margin:10px 0 0;padding:0 0 10px;overflow: hidden;"><p style="font-size: 16px;">更多测试功能，请咨询微信号：</p><p style="color:#FF6632;padding:6px 0;font-size: 18px">'+num[rNum]+'</p><div style="width: 240px;text-align: left;margin:0 auto;line-height: 24px;"><p style="position: relative;padding-left:24px;"><i style="font-style: normal;position: absolute;width: 20px;height:20px;line-height: 20px;left:2px;top:2px;line-height: 20px;color: #fff;background: #000;text-align: center;border-radius: 50%">1</i>【长按上方数字复制微信号】</p><a href="weixin://" style="position: relative;padding-left:24px;color: #FF6632;display: block;text-decoration: none;"><i style="font-style: normal;position: absolute;width: 20px;height:20px;line-height: 20px;left:2px;top:2px;line-height: 20px;color: #fff;background: #000;text-align: center;border-radius: 50%"">2</i>【点我打开微信】</a></div></div>');
})();
	</script>
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