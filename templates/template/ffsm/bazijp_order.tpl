<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8"/>
<title>八字综合详批、专业测试机构-<{$zhanming}></title>
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
<meta content="telephone=no" name="format-detection"/>
<link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
<link href="statics/ffsm/bazimf/wap.min.css?v=0817" rel="stylesheet" type="text/css"/>
<link href="statics/ffsm/bazimf/index.css" rel="stylesheet" type="text/css"/>
<link href="statics/ffsm/bazimf/style.min.css" rel="stylesheet" type="text/css"/>
<{include file='./ffsm/wx_share.tpl'}>
<script src="statics/ffsm/public/js/require/require.min.js" data-main="/statics/ffsm/public/js/common.min.js?v=0817"></script>
<script src="https://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
<header class="public_header">
<h1 class="public_h_con">八字精批</h1>
<a class="public_h_home" href="/"></a><a href="/?ac=history" class="public_h_menu">我的测试</a></header>
<{if $gundong}><div class="alert-marquee" id="alertMarquee"><p class="inner"><{$gundong}></p></div><{/if}>
<div class="container pay" style="padding-bottom:0px;">
  <div class="wrap">
    <div class="person">
      <div class="hd">
        <img src="statics/ffsm/bazimf/images/hd.jpg"></div>
      <div class="infos">
        <p>姓名：<{$names.username}></p>
        <p>性别：<{if $names.gender==1}>男<{else}>女<{/if}></p>
        <p>生日：<{$names.y}>年<{$names.m}>月<{$names.d}>日<{if $names.h>=0}><{$names.h}><{else}>未知<{/if}>时</p>
      </div>
    </div>
    <p class="gk">已有
      <span class="red3">69852134</span>人进行测试，
      <span class="red3">98.7%</span>以上的测试用户都觉得对自身的前程有很大的帮助。
      <span class="red3">大师团队利用传统四柱八字推测出你的一生财运、事业、感情、健康、人际等重要问题！</span></p>
    <div class="price">
      <p class="tit1">测试项目：八字命格详批</p>
      <div class="clearfix inner">
        <div class="fl">
          <span class="yh">限时优惠￥<{$money}>元</span>
          <s class="gray">原价：￥118.00</s></div>
        <div class="fr">
          <p>距优惠结束</p>
          <p class="red">
            <span class="h" id="hour_show">00：</span>
            <span class="f" id="minute_show">57：</span>
            <span class="m" id="second_show">42</span></p>
        </div>
      </div>
    </div>
    <div class="price">
      <p class="tit1 tcenter">支付方式</p>
      <div class="clearfix inner">
        <ul class="pay-type">
          <{if $sys_pay_type==0 || $sys_pay_type==1 || $sys_pay_type==3}>
          <a class="weixin" target="_self" href="/?ct=pay&ac=go&oid=<{$oid}>&type=1"><li class="on" id="wx_zf">
            <span class="pay-icon icon-wechat"></span>
            <span>微信支付</span>
            <span class="gopaywx">立即支付</span>
          </li></a>
            <{/if}>
          <{if $sys_pay_type==0 || $sys_pay_type==2 || $sys_pay_type==3}>
              <a class="alipay" target="_self" href="/?ct=pay&ac=go&oid=<{$oid}>&type=2"><li id="zfb_zf">
            <span class="pay-icon icon-zfb"></span>
            <span>支付宝支付</span>
            <span class="gopayzfb">立即支付</span>
          </li></a>
            <{/if}>
		<{if $sys_pay_type==0 || $sys_pay_type==4}>
 			 <a class="weixin" target="_self" href="/?ct=pay&ac=pay_go&oid=<{$oid}>&type=wxpay"><li class="on" id="wx_zf">
            <span class="pay-icon icon-wechat"></span>
            <span>微信支付</span>
            <em class="ico-arrow"></em>
          </li></a>
              <a class="alipay" target="_self" href="/?ct=pay&ac=pay_go&oid=<{$oid}>&type=alipay"><li id="zfb_zf">
            <span class="pay-icon icon-zfb"></span>
            <span>支付宝支付</span>
            <em class="ico-arrow"></em>
          </li></a>
		<{/if}>
          <{if $sys_pay_type==0 || $sys_pay_type==5}>
           <a class="alipay" target="_self" href="/?ct=pay&ac=paypal_go&oid=<{$oid}>"><li id="zfb_zf">
            <span class="pay-icon icon-paypal"></span>
            <span>paypal支付</span>
            <em class="ico-arrow"></em>
          </li></a>
         <{/if}>
		 <{if $jf_sys_on==1}>
 			 <a class="weixin" target="_self" href="/?ac=extgo&oid=<{$oid}>"><li class="on" id="wx_zf">
            <span class="pay-icon icon-extpay"></span>
            <span>积分支付</span>
            <em class="ico-arrow"></em>
          </li></a>
		<{/if}>
		<{if $vip_on==1}>
		 <a class="weixin" target="_self" href="/?ac=vip_pay&oid=<{$oid}>"><li class="on" id="wx_zf">
            <span class="pay-icon icon-vip_pay"></span>
            <span>vip免支付</span>
            <em class="ico-arrow"></em>
          </li></a>
          <{/if}>
        </ul>
      </div>
<style type="text/css">
@media screen and (max-width:1222px){.ydgz{display:none}}
.ydgz{width: 40%;margin: 0 auto;}
.ydgz img{width: 100%;}
.ydgz p{color: #00b98d !important;font-size: 0.19rem !important;text-align: center !important;margin: 0 !important;}
</style>
    <{include file='./ffsm/fengge/pcwxgz.tpl'}>
    </div>
    <p class="tip">98.7%以上用户对分析结果非常满意！</p>
    <p class="tip red3">支付完成后</p>
    <p class="tip mb">将为你
      <span class="red3">解锁</span>以下
      <span class="red3">六项重要内容</span></p>
    <div class="info J_testFixedShow">
      <div class="box-top"></div>
      <div class="box-center">
        <h3 class="tit2">
          <img src="statics/ffsm/bazimf/images/title_1.png"></h3>
        <p>
          <span class="blur">你对金钱的态度非常务实，相信一分耕耘才有一分收你对金钱的态度非常务实，相信一分耕耘才有一分收你对金钱的态度非常务实相信一分耕耘才有一分收你对金钱的态度非常务实信一分耕耘才有一分收你对金钱的态度非常务实相信一分耕耘才有一分收你对金钱的态度非常务实相信一分耕耘才有一分</span></p>
        <p class="btn-lock J_payPopupShow" style="margin-top:1.2rem;">支付后查看分析</p>
        <div class="genre">
          <p>1.想知道你的
            <span class="red3">五行属性？</span></p>
          <p>2.想知道你的
            <span class="red3">好运</span>需要
            <span class="red3">哪种五行帮助？</span></p>
          <p>3.想知道你的
            <span class="red3">人生高峰期</span>在什么时候？</p></div>
      </div>
      <div class="box-bottom"></div>
    </div>
    <div class="info">
      <div class="box-top"></div>
      <div class="box-center">
        <h3 class="tit2">
          <img src="statics/ffsm/bazimf/images/title_2.png"></h3>
        <p>
          <span class="blur">你对金钱的态度非常务实，相信一分耕耘才有一分收你对金钱的态度非常务实，相信一分耕耘才有一分收你对金钱的态度非常务实相信一分耕耘才有一分收你对金钱的态度非常务实信一分耕耘才有一分收你对金钱的态度非常务实相信一分耕耘才有一分收你对金钱的态度非常务实相信一分耕耘才有一分</span></p>
        <p class="btn-lock J_payPopupShow" style="margin-top:.8rem;">支付后查看分析</p>
        <div class="genre">
          <p>1.想知道你
            <span class="red3">是不是有钱人？</span></p>
          <p>2.想知道你这两年的
            <span class="red3">财富机遇在哪？</span></p>
          <p>3.想知道你怎样做才能
            <span class="red3">增加财富？</span></p>
        </div>
      </div>
      <div class="box-bottom"></div>
    </div>
    <div class="info">
      <div class="box-top"></div>
      <div class="box-center">
        <h3 class="tit2">
          <img src="statics/ffsm/bazimf/images/title_3.png"></h3>
        <p>
          <span class="blur">你对金钱的态度非常务实，相信一分耕耘才有一分收你对金钱的态度非常务实，相信一分耕耘才有一分收你对金钱的态度非常务实相信一分耕耘才有一分收你对金钱的态度非常务实信一分耕耘才有一分收你对金钱的态度非常务实相信一分耕耘才有一分收你对金钱的态度非常务实相信一分耕耘才有一分</span></p>
        <p class="btn-lock J_payPopupShow" style="margin-top:1.2rem;">支付后查看分析</p>
        <div class="genre">
          <p>1.想知道你的
            <span class="red3">感情是否顺利？</span></p>
          <p>2.想知道你在感情中的
            <span class="red3">表现和异性对你的看法？</span></p>
          <p>3.想知道你适合
            <span class="red3">哪种类型的对象？</span></p>
        </div>
      </div>
      <div class="box-bottom"></div>
    </div>
    <div class="info">
      <img src="statics/ffsm/bazimf/images/title_other.png"></div>
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
.ainuo_foot_nav{display: block; padding: 2px 0; background:#d13036; position: fixed; bottom: 0; width: 100%; z-index: 99999;max-width: 750px;}
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
  <p style="height:.9rem;background-color: #b10400"></p>
</div>
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
            <{if  $sys_pay_type==0 || $sys_pay_type==5}>
          <a class="paypal" target="_self" href="/?ct=pay&ac=paypal_go&oid=<{$oid}>">paypal支付</a>
            <{/if}>
			<{if $jf_sys_on==1}>
				<a class="m-extpay" target="_self" href="/?ac=extgo&oid=<{$oid}>">积分支付</a>
            <{/if}>
            <{if $vip_on==1}>
				<a class="m-vippay" target="_self" href="/?ac=vip_pay&oid=<{$oid}>">vip免支付</a>
			<{/if}>
		</div>
	</div>
</div>
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
                    
                });
                $this.on('click',function(){
                    pp.show();
                });
                ppClose.on('click',function(){
                    pp.hide();
                })
               
            });
        };
    })(jQuery);
    $("#publicPayBottom").publicPopup();
</script>
<script type="text/javascript">
var intDiff = parseInt(5734);//倒計時總秒數量
function timer(intDiff){
	window.setInterval(function(){
	var day=0,
		hour=0,
		minute=0,
		second=0;//時間默認值		
	if(intDiff > 0){
		day = Math.floor(intDiff / (60 * 60 * 24));
		hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
		minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
		second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
	}
	if (minute <= 9) minute = '0' + minute;
	if (second <= 9) second = '0' + second;
	$('#day_show').html(day+"天");
	$('#hour_show').html('<s id="h"></s>'+hour+'小時');
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