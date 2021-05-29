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
<link href="/statics/ffsm/yunyincs/1/wap.min.css" rel="stylesheet" type="text/css"/>
<link href="/statics/ffsm/yunyincs/1/style.min.css" rel="stylesheet" type="text/css"/>
<{include file='./ffsm/wx_share.tpl'}>
<script src="https://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="statics/ffsm/public/js/require/require.min.js" data-main="/statics/ffsm/public/js/common.min.js?v=0817"></script>
</head>
<body>
<header class="public_header">
<h1 class="public_h_con">姻缘测试</h1>
<a class="public_h_home" href="/"></a><a href="/?ac=history" class="public_h_menu">我的测试</a></header>
<{if $gundong}><div class="alert-marquee" id="alertMarquee"><p class="inner"><{$gundong}></p></div><{/if}>
<div class="order_box_pay">
<div class="beijingse">
	<div class="obp_user">
		<img src="/statics/ffsm/yunyincs/1/images/1_img_1.png" alt="大师"/>
		<div class="obp_txt">
			<p class="obp_left">
				<b>郭易申先生</b>
				<span>知名命理学专家</span>
			</p>
			<p class="obp_right">
				<b><{$names.username}>(<{if $names.gender==1}>男<{else}>女<{/if}>)</b>
				<span><{$names.y}>年<{$names.m}>月<{$names.d}>日<{if $names.h>=0}><{$names.h}><{else}>未知<{/if}>时</span>
			</p>
		</div>
	</div>
	<div class="obp_pirce">
		<del>原价：￥168</del><em>&nbsp; &nbsp;&nbsp;<strong>吉时特价：<span style="color:#ff0000;">￥<{$money}></span></strong></em>
<div class="time-item">
	<em>倒计时：</em>
	<em id="hour_show">1小时</em>
	<em id="minute_show">35分</em>
	<em id="second_show">34秒</em>
</div>
		<div class="public_pay_box">
			<{if $sys_pay_type==0 || $sys_pay_type==1 || $sys_pay_type==3}>
			<a class="weixin" target="_self" href="/?ct=pay&ac=go&oid=<{$oid}>&type=1">微信安全支付</a>
          <{/if}>
             <{if  $sys_pay_type==0 || $sys_pay_type==2 || $sys_pay_type==3}>
            <a class="alipay" target="_self" href="/?ct=pay&ac=go&oid=<{$oid}>&type=2">支付宝安全支付</a>
          <{/if}>
            <{if  $sys_pay_type==0 || $sys_pay_type==4}>
          <a class="weixin" target="_self" href="/?ct=pay&ac=pay_go&oid=<{$oid}>&type=wxpay">微信支付</a>
          <a class="alipay" target="_self" href="/?ct=pay&ac=pay_go&oid=<{$oid}>&type=alipay">支付宝支付</a>
              <{/if}>
			<{if $jf_sys_on==1}>
				<a class="m-extpay" target="_self" href="/?ac=extgo&oid=<{$oid}>">积分支付</a>
            <{/if}>
            <{if $vip_on==1}>
				<a class="m-vippay" target="_self" href="/?ac=vip_pay&oid=<{$oid}>">vip免支付</a>
			<{/if}>
		</div>
	</div>
	<div style='text-align:center;font-size:14px !important'>
	<span style='color:#ff0000'>付款成功后赠送高级面相教程一套</span><br/>
	<span style='color:#0D8000'>关注微信公众号【<{$weixinhao}>】免费姓名详批</span><br/>
	<span style='color:#0D8000'>长按复制微信号在微信内搜索</span>

	<p>订单编号：<{$oid}></p>
	<div class="obp_tip J_testFixedShow">
		已有<span>23302574</span>人进行了测试知晓了自己的<span>婚姻情感、桃花运势</span>的情况，并根据老师建议做出调整，<span>98.6%</span>的用户对自己的婚姻情感生活产生巨大帮助！
	</div>
</div>
</div>
<div class="public_bg_wrap mt10 J_payBottomShow">
  <div class="public_title_1">老师综合点评</div>
  <div class="start_tip"></div>
  <div class="order_unpaid_tip">
    <p>对于婚姻，大多数人都会有这样那样的疑问。这一生的婚姻会是怎样？是好还是坏？如何才能提高婚姻质量，过上理想的婚姻生活？在此综合命理纲要，给你一个圆满答案。</p>
    <a href="javascript:;" class="J_payPopupShow">马上揭晓</a></div>
</div>
<div class="public_bg_wrap mt10">
  <div class="public_title_1">结婚建议</div>
  <div class="order_unpaid_tip">
    <p>针对我的一生的婚姻运势，专业老师为我提供了哪些建议和方法？我该采取哪些具体措施来助旺自己的姻缘运势？面对未来未知的情感生活，什么样的选择是最稳妥的？</p>
    <a href="javascript:;" class="J_payPopupShow">马上揭晓</a></div>
</div>
<div class="public_bg_wrap mt10">
  <div class="public_title_1">桃花运数</div>
  <div class="fraction_div">
    <div class="fd_left"></div>
    <div class="fd_right"></div>
    <div class="fd_con">
      <b>?</b>分</div>
  </div>
  <div class="order_unpaid_tip">
    <p>我的命里到底有没有桃花运？异性缘是多还是寡？爱慕和追求我的人会多吗？为何至今依然单身？是不是非得通过相亲才有结婚的可能？</p>
    <a href="javascript:;" class="J_payPopupShow">马上揭晓</a></div>
</div>
<div class="public_bg_wrap mt10">
  <div class="public_title_1">结婚时间</div>
  <div class="order_unpaid_tip">
    <p>最适合我的结婚时间是什么时候呢？是会年纪轻轻就已结婚，还是会年老色衰依然孤家寡人？我命中注定的那个人究竟在何方？</p>
    <a href="javascript:;" class="J_payPopupShow">马上揭晓</a></div>
</div>
<div class="public_bg_wrap mt10">
  <div class="public_title_1">配偶性格</div>
  <div class="fraction_div">
    <div class="fd_left"></div>
    <div class="fd_right"></div>
    <div class="fd_con">
      <b>?</b>分</div>
  </div>
  <div class="order_unpaid_tip">
    <p>我命中注定的那位会是个怎样的人呢？这样的性格对我会不会有什么影响？我又该如何面对配偶的性格才能使彼此更好的生活在一起？</p>
    <a href="javascript:;" class="J_payPopupShow">马上揭晓</a></div>
</div>
<div class="public_bg_wrap mt10">
  <div class="public_title_1">稳定系数</div>
  <div class="fraction_div">
    <div class="fd_left"></div>
    <div class="fd_right"></div>
    <div class="fd_con">
      <b>?</b>分</div>
  </div>
  <div class="order_unpaid_tip">
    <p>我的婚姻稳定吗？会不会有携手到白头的婚姻呢？有没有多婚的可能？命里的婚姻不良信息多还是少，会对婚姻的基石造成多大冲击？</p>
    <a href="javascript:;" class="J_payPopupShow">马上揭晓</a></div>
</div>
<div class="public_bg_wrap mt10">
  <div class="public_title_1">幸福指数</div>
  <div class="fraction_div">
    <div class="fd_left"></div>
    <div class="fd_right"></div>
    <div class="fd_con">
      <b>?</b>分</div>
  </div>
  <div class="order_unpaid_tip">
    <p>我会不会拥有幸福的婚姻？什么不必要的行为和决定可能会让我失去挚爱？婚后的感情会是甜蜜幸福还是争吵不休？该怎样才能拥有一段幸福恩爱的婚姻生活？</p>
    <a href="javascript:;" class="J_payPopupShow">马上揭晓</a></div>
</div>
<div class="public_bg_wrap mt10">
  <div class="public_title_1">助旺指数</div>
  <div class="fraction_div">
    <div class="fd_left"></div>
    <div class="fd_right"></div>
    <div class="fd_con">
      <b>?</b>分</div>
  </div>
  <div class="order_unpaid_tip">
    <p>我能旺妻或旺夫吗？能成为配偶的得力助手还是对方的累赘呢？又或者能有这样一个ta，能够与自己互相助旺、优势互补吗？</p>
    <a href="javascript:;" class="J_payPopupShow">马上揭晓</a></div>
</div>
<div class="public_bg_wrap mt10">
  <div class="public_title_1">子女运数</div>
  <div class="fraction_div">
    <div class="fd_left"></div>
    <div class="fd_right"></div>
    <div class="fd_con">
      <b>?</b>分</div>
  </div>
  <div class="order_unpaid_tip">
    <p>命中的我是儿孙满堂，还是膝下空空呢？子女能否健康快乐的成长？将来能否出人头地，孝顺父母？</p>
    <a href="javascript:;" class="J_payPopupShow">马上揭晓</a></div>
</div>
<{include file='./ffsm/footer.tpl'}>
<div class="public_pay_popup" id="publicPayPopup">
	<div class="public_pp_box">
		<div class="public_pp_close" id="publicPPClose">
			X
		</div>
		<div class="public_pp_tit">
			解锁查看所有测试结果
		</div>
		<div class="public_pp_price">
			<span>统一鉴定价：</span><strong>￥<{$money}>元</strong>
		</div>
		<div class="public_pay_box">
			<{if $sys_pay_type==0 || $sys_pay_type==1 || $sys_pay_type==3}>
			<a class="weixin" target="_self" href="/?ct=pay&ac=go&oid=<{$oid}>&type=1">微信安全支付</a>
          <{/if}>
             <{if  $sys_pay_type==0 || $sys_pay_type==2 || $sys_pay_type==3}>
            <a class="alipay" target="_self" href="/?ct=pay&ac=go&oid=<{$oid}>&type=2">支付宝安全支付</a>
          <{/if}>
            <{if  $sys_pay_type==0 || $sys_pay_type==4}>
          <a class="weixin" target="_self" href="/?ct=pay&ac=pay_go&oid=<{$oid}>&type=wxpay">微信支付</a>
          <a class="alipay" target="_self" href="/?ct=pay&ac=pay_go&oid=<{$oid}>&type=alipay">支付宝支付</a>
              <{/if}>
			<{if $jf_sys_on==1}>
			<{if $jf_sys_on==1}>
				<a class="m-extpay" target="_self" href="/?ac=extgo&oid=<{$oid}>">积分支付</a>
            <{/if}>
            <{if $vip_on==1}>
				<a class="m-vippay" target="_self" href="/?ac=vip_pay&oid=<{$oid}>">vip免支付</a>
			<{/if}>
			<{/if}>
		</div>
	</div>
</div>
<div style=" height: 25px;">
</div>
<div class="ainuo_foot_nav cl" id="testFixedBtn" style="display: none;">
    <ul>
     <li><a href="/"><i class="shouye_1"></i><p>测试首页</p></a></li>
     <li><a href="/?ac=history"><i class="wddd_1"></i><p>订单查询</p></a></li>
     <li><a href="javascript:;" id="publicPayBottom" class="botpost"><em><i class="lijijs_1"></i></em><p>付费解锁</p></a></li>
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
.lijijs_1{background: url(/statics/ffsm/public/images/jiesuo.png) no-repeat;}
.gengduo_1{background: url(/statics/ffsm/public/images/gengduo.png) no-repeat;}
.grzx_1{background: url(/statics/ffsm/public/images/grzx.png) no-repeat;}
</style>
<script type="text/javascript">
var intDiff = parseInt(5734);//倒计时总秒数量
function timer(intDiff){
	window.setInterval(function(){
	var day=0,
		hour=0,
		minute=0,
		second=0;//时间默认值		
	if(intDiff > 0){
		day = Math.floor(intDiff / (60 * 60 * 24));
		hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
		minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
		second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
	}
	if (minute <= 9) minute = '0' + minute;
	if (second <= 9) second = '0' + second;
	$('#day_show').html(day+"天");
	$('#hour_show').html('<s id="h"></s>'+hour+'小时');
	$('#minute_show').html('<s></s>'+minute+'分');
	$('#second_show').html('<s></s>'+second+'秒');
	intDiff--;
	}, 1000);
} 

$(function(){
	timer(intDiff);
});	
//支付后检测跳转
  <{if $yz_pay==1}>
       var inquiry_lock = 0;
    $(function () {
        setInterval(function () {
            inquiry(); 
        }, 1000);
    });
    function inquiry() {
        if (inquiry_lock) {
            return;
        }
        $.get('/?ct=pay&ac=scanquery&oid=<{$oid}>', {t: Date.parse(new Date())}, function (data) {
            if (data.status) {
                inquiry = 1;
                $('div.weixin .green').html('支付成功');
                window.location = data.url;
            }
        }, 'json');
    }
  <{/if}>
</script>
<script>
    //底部悬浮
    ;(function($){
        $.fn.publicPopup=function(opt){
            var pp=$('#publicPayPopup');
            var ppClose=$('#publicPPClose');
            var topShow=$(".J_payBottomShow").length>0?$(".J_payBottomShow").offset().top:200;
            var ppShow=$(".J_payPopupShow").length>0?$(".J_payPopupShow"):'';
            return this.each(function(){
                var $this=$(this);
                $(window).scroll(function(){
                    var wt=$(window).scrollTop();
                    wt>topShow?$this.fadeIn():$this.fadeOut();
                });
                $this.on('click',function(){
                    pp.show();
                });
                ppClose.on('click',function(){
                    pp.hide();
                })
                ppShow?ppShow.on('click',function(){pp.show()}):'';
            });
        };
    })(jQuery);
    $("#publicPayBottom").publicPopup();
    //测试底部悬浮
    (function(){
    	var topShow=$(".J_testFixedShow");
    	if(topShow.length){
            var topShow=topShow.offset().top;
    		var testBtn=$("#testFixedBtn");
    		$(window).scroll(function(){
                var wt=$(window).scrollTop();
                wt>topShow?(testBtn.fadeIn(),$('.public_footer_servers').css('padding-bottom','50px')):(testBtn.fadeOut(),$('.public_footer_servers').css('padding-bottom','20px'));
            });
    	}
    })()
    //弹出支付功能
    ;(function($){
        $.fn.publicPopup=function(opt){
            var pp=$('#publicPayPopup');
            var ppClose=$('#publicPPClose');
            return this.each(function(){
                var $this=$(this);
                $(window).scroll(function(){
                    var wt=$(window).scrollTop();
                    wt>topShow?$this.fadeIn():$this.fadeOut();
                });
                $this.on('click',function(){
                    pp.show();
                });
                ppClose.on('click',function(){
                    pp.hide();
                })
                ppShow?ppShow.on('click',function(){pp.show()}):'';
            });
        };
    })(jQuery);
    $("#publicPayBottom").publicPopup();
</script>
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