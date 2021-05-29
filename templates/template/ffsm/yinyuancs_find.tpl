<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8"/>
	<title>精准八字解析-揭开婚姻奥秘-<{$zhanming}></title>
	<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<meta content="yes" name="apple-mobile-web-app-capable"/>
	<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
	<meta content="telephone=no" name="format-detection"/>
	<link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
	<link href="/statics/ffsm/yunyincs/1/wap.min.css?v=0817" rel="stylesheet" type="text/css"/>
	<link href="/statics/ffsm/yunyincs/style.min.css" rel="stylesheet" type="text/css"/>
	<{include file='./ffsm/wx_share.tpl'}>
	<script src="https://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
<header class="public_header">
	<h1 class="public_h_con">姻缘测试</h1>
	<a class="public_h_home" href="/"></a><a href="/?ac=history" class="public_h_menu">我的测试</a></header>
<div class="public_banner">
	<img src="/statics/ffsm/yunyincs/1/images/banner.jpg" alt="八字精批"/>
</div>
<div class="order_box_pay">
	<div class="obp_nun">
		订单编号:<{$data.oid}>
	</div>
</div>
<div id="showList">
	<div class="sl_box">
		<p class="public_words_title J_listTit">
			您的八字命盘
		</p>
		<div class="J_listCon" style="display: block;">
			<div class="base_info">
				<p>
					<span>姓名:</span><{$data.data.username}>
				</p>
				<p>
					<span>性别:</span><{if $data.data.gender==1}>男<{else}>女<{/if}>
				</p>
				<p>
					<span>公历:</span><{$data.data.y}>年<{$data.data.m}>月<{$data.data.d}>日 <{$data.data.h}>时
				</p>
				<p>
					<span>农历:</span><{$data.data.lDate}>
				</p>
			</div>
			<ul class="detail_info">
				<li><span class="info_head info_heads info_ts">&nbsp;</span><span class="info_head info_heads">年柱</span><span class="info_head info_heads">月柱</span><span class="info_head info_heads">日柱</span><span class="info_head info_heads">时柱</span></li>
				<li><span class="info_head">十神</span><span><{$pp.shishen1}></span><span><{$pp.shishen2}></span><span><{$pp.shishen3}></span><span><{$pp.shishen4}></span></li>
				<li><span class="info_head">&nbsp; 八</span><span><{$return.user.bazi.0}></span><span><{$return.user.bazi.2}></span><span><{$return.user.bazi.4}></span><span><{$return.user.bazi.6}></span></li>
				<li><span class="info_head">&nbsp; 字</span><span><{$return.user.bazi.1}></span><span><{$return.user.bazi.3}></span><span><{$return.user.bazi.5}></span><span><{$return.user.bazi.7}></span></li>
				<li><span class="info_head">藏干</span><span><{$pp.zanggan1}></span><span><{$pp.zanggan2}></span><span><{$pp.zanggan3}></span><span><{$pp.zanggan4}></span></li>
				<li><span class="info_head">纳音</span><span><{$pp.nayin1}></span><span><{$pp.nayin2}></span><span><{$pp.nayin3}></span><span><{$pp.nayin4}></span></li>

			</ul>
			<div class="main_info">
				<ul>
					<li>
						<div class="tss">
							<span>喜用神:</span><{$return.data.xiyongshen.data.xishen}>
						</div>
						<div class="tss">
							<span>胎元:</span><{$pp.taiyuan}>
						</div>
						<div class="tss">
							<span>命宫:</span><{$pp.minggong}>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="sl_box">
		<p class="public_words_title J_listTit">
			感情综合点评
		</p>
		<div class="J_listCon">
			<div class="public_con_word">
				<p>
					<{$rglm.aqfx}>
				</p>
			</div>
		</div>
	</div>
	<div class="sl_box">
		<p class="public_words_title J_listTit">
			您的感情婚姻总评
		</p>
		<div class="J_listCon">

			<div class="public_con_word">

			</div>
			<{foreach from=$return.sx.yf item=v}>

			<div class="public_con_word">
				<p>
					<{$v.yinyuanb}>
				</p>
			</div>
			<{/foreach}>
		</div>
	</div>	
	<div class="sl_box">
		<p class="public_words_title J_listTit">
			您的婚配建议与补救
		</p>
		<div class="J_listCon">

			<div class="public_con_word">

			</div>
			<{foreach from=$return.sx.yf item=v}>

			<div class="public_con_word">
				<p>
					<{$v.yinyuanc}>
				</p>
			</div>
			<{/foreach}>
		</div>
	</div>	
	<div class="sl_box">
		<p class="public_words_title J_listTit">
			您今年流年感情运程
		</p>
		<div class="J_listCon">

			<div class="public_con_word">

			</div>
			<{foreach from=$return.sx.yf item=v}>

			<div class="public_con_word">
				<p>
					<{$v.yinyuana}>
				</p>
			</div>
			<{/foreach}>
		</div>
	</div>	

	<div class="sl_box">
		<p class="public_words_title J_listTit">
			您的感情婚姻建议
		</p>
		<div class="J_listCon">

			<div class="public_con_word">

			</div>
			<{foreach from=$return.sx.yf item=v}>

			<div class="public_con_word">
				<p>
					<{$v.yinyuanf}>
				</p>
			</div>
			<{/foreach}>
		</div>
	</div>
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
<style type="text/css">
.ainuo_foot_nav{display: block; padding: 2px 0; background:#904c38; position: fixed; bottom: 0; width: 100%; z-index: 99999;max-width: 640px;}
.ainuo_foot_nav li{width: 20%; text-align: center; float: left;}
.ainuo_foot_nav li a{width: 100%; display: block;}
.ainuo_foot_nav .foothover i{color: #f13030;}
.ainuo_foot_nav li i{display: block; line-height: 25px; height: 25px; margin: auto; padding: 0; width: 25px; overflow: hidden; background-size: 100%;}
.ainuo_foot_nav li a.botpost{position: relative; margin-top: -11px; background-color: rgba(0,0,0,0.0);}
.ainuo_foot_nav li a.botpost em{background: #ffffff; padding: 2px; border: 1px solid #ff5e5e; display: block; border-radius: 50%; width: 30px; height: 30px; margin: 0 auto; margin-bottom: 2px;padding-bottom: 0px;}
.ainuo_foot_nav li p{overflow: hidden; font-size: 12px; height: 16px; line-height: 16px; color: #fff; font-weight: 400;}
.shouye_1{background: url(/statics/ffsm/public/images/shouye.png) no-repeat;}
.wddd_1{background: url(/statics/ffsm/public/images/dingdan.png) no-repeat;}
.lijics_1{background: url(/statics/ffsm/public/images/suan.png) no-repeat;}
.gengduo_1{background: url(/statics/ffsm/public/images/gengduo.png) no-repeat;}
.grzx_1{background: url(/statics/ffsm/public/images/grzx.png) no-repeat;}
</style>
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