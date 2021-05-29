<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8"/>
<title><{$data.data.username}>的大师在线服务预约结果-<{$zhanming}></title>
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
<meta content="telephone=no" name="format-detection"/>
<link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
<link href="/statics/ffsm/dashi/dashi.css" rel="stylesheet" type="text/css"/>
<{include file='./ffsm/wx_share.tpl'}>
<script src="statics/ffsm/public/js/require/require.min.js"></script>
<script src="statics/ffsm/public/js/common.min.js"></script>
<script src="https://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
<header class="public_header">
<h1 class="public_h_con"><{$data.data.username}>的预约</h1>
<a class="public_h_home" href="/?ac=dashi"></a><a href="?ac=history" class="public_h_menu">我的测算</a></header>
<div class="public_banner">
	<img src="<{$data.data.images}>" alt="<{$data.data.title}>"/>
	<span><{$data.data.title}></span>
</div>
<div class="person J_testFixedShow">
  <div class="hd">
    <img src="/statics/ffsm/dashi/images/renx.png"></div>
  <div class="infos">
    <p>姓名：<{$data.data.username}></p>
    <p>性别：<{if $data.data.gender==1}>男<{else}>女<{/if}></p>
    <p>生日：<{$data.data.y}>年<{$data.data.m}>月<{$data.data.d}>日<{$data.data.h}>时</p>
    <p>电话：<{$data.data.tel}></p>
  </div>
</div>
<div class="fenge"></div>

<div class="yuy_1">
<h2>为你预约到的大师</h2>
<p>大师名称：<{$data.data.teacher}></p>
<p>预约时间：<{if $data.paytime>0}><{$data.paytime|date_format:'%Y-%m-%d %H:%M:%S'}><{else}><{$data.createtime|date_format:'%Y-%m-%d %H:%M:%S'}><{/if}></p>


<!--

<a class="btn-primary" href="https://www.yiabs.com/yixue/plugin.php?id=aljol&act=talk&friendid=<{$data.data.about}>"><i class="huihua"></i>与<{$data.data.teacher}>会话</a>
-->

<a class="btn-primary" href="http://wpa.qq.com/msgrd?v=3&uin=<{$data.data.about}>&site=qq&menu=yes"><i class="huihua"></i>与<{$data.data.teacher}>会话</a>




<h3>如长时间未响应请联系下方信息</h3>
<dd>微信公众号：<{$weixinhao}></dd>
<img src="<{$weixintp}>" width="50%" />
<dd>微信内二维码长按识别</dd>
</div>
<div class="ainuo_foot_nav cl" id="testFixedBtn" style="display: none;">
    <ul>
     <li><a href="/"><i class="shouye_1"></i><p>测算首页</p></a></li>
     <li><a href="/?ac=history"><i class="wddd_1"></i><p>订单查询</p></a></li>
     <li><a href="/?ac=dashi"class="botpost"><em><i class="lijics_1"></i></em><p>其他预约</p></a></li>
     <li><a href="/"><i class="gengduo_1"></i><p>更多测算</p></a></li>
     <li><a href="/?ac=member"><i class="grzx_1"></i><p>个人中心</p></a></li>
    </ul>
</div>
<style type="text/css">
.ainuo_foot_nav{display: block; padding: 2px 0; background:#d6b168; position: fixed; bottom: 0; width: 100%; z-index: 99999;max-width: 640px;}
.ainuo_foot_nav li{width: 20%; text-align: center; float: left;}
.ainuo_foot_nav li a{width: 100%; display: block;}
.ainuo_foot_nav .foothover i{color: #f13030;}
.ainuo_foot_nav li i{display: block; line-height: 25px; height: 25px; margin: auto; padding: 0; width: 25px; overflow: hidden; background-size: 100%;}
.ainuo_foot_nav li a.botpost{position: relative; margin-top: -11px; background-color: rgba(0,0,0,0.0);}
.ainuo_foot_nav li a.botpost em{background: #ffffff; padding: 2px; border: 1px solid #d6b168; display: block; border-radius: 50%; width: 30px; height: 30px; margin: 0 auto; margin-bottom: 2px;padding-bottom: 0px;}
.ainuo_foot_nav li p{overflow: hidden; font-size: 12px; height: 16px; line-height: 16px; color: #fff; font-weight: 400;}
.shouye_1{background: url(/statics/ffsm/public/images/shouye.png) no-repeat;}
.wddd_1{background: url(/statics/ffsm/public/images/dingdan.png) no-repeat;}
.lijics_1{background: url(/statics/ffsm/public/images/wen.png) no-repeat;width: 28px!important;}
.gengduo_1{background: url(/statics/ffsm/public/images/gengduo.png) no-repeat;}
.grzx_1{background: url(/statics/ffsm/public/images/grzx.png) no-repeat;}
</style>
<script>
    //测算底部悬浮
    (function(){
    	var topShow=$(".J_testFixedShow");
    	if(topShow.length){
            var topShow=topShow.offset().top;
    		var testBtn=$("#testFixedBtn");
    		$(window).scroll(function(){
                var wt=$(window).scrollTop();
                wt>topShow?(testBtn.fadeIn(),$('.public_footer_servers').css('padding-bottom','50px')):(testBtn.fadeOut(),$('.public_footer_servers').css('padding-bottom','20px'));
            });
            testBtn.add('.J_testScrollTop').on('click',function(){$('html,body').scrollTop(topNum)})
    	}
    })()
</script>
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
<{include file='./ffsm/dashi/tuijian.tpl'}>
<div style="height: 0.7rem;"></div>
<{include file='./ffsm/footers.tpl'}>
<{include file='./ffsm/dl_ck.tpl'}>
</body>
</html>