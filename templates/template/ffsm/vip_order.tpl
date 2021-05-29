<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8"/>
<title><{$username}>的<{$des}>-<{$zhanming}></title>
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
<h1 class="public_h_con"><{$username}>的<{$des}></h1>
<a class="public_h_home" href="/"></a><a href="?ac=history" class="public_h_menu">我的测试</a></header>

<div class="aui-loan-body">
<h1><{$money}>元开通<{$des}></h1>
<p>订单号:<{$oid}></p>
</div>

<div class="container pay" style="padding-bottom:0px;">
  <div class="wrap">
<div class="price">
      <p class="tit1 tcenter">支付方式</p>
      <div class="clearfix inner">
        <ul class="pay-type">
          <{if $sys_pay_type==0 || $sys_pay_type==1 || $sys_pay_type==3 || $sys_pay_type==6}>
          <a class="weixin" target="_self" href="/?ct=pay&ac=go&oid=<{$oid}>&type=1"><li class="on" id="wx_zf">
            <span class="pay-icon icon-wechat"></span>
            <span>微信支付</span>
            <span class="gopaywx">立即支付</span>
          </li></a>
            <{/if}>
          <{if  $sys_pay_type==0 || $sys_pay_type==2 || $sys_pay_type==3 || $sys_pay_type==6}>
              <a class="alipay" target="_self" href="/?ct=pay&ac=go&oid=<{$oid}>&type=2"><li id="zfb_zf">
            <span class="pay-icon icon-zfb"></span>
            <span>支付宝支付</span>
            <span class="gopayzfb">立即支付</span>
          </li></a>
            <{/if}>
		<{if  $sys_pay_type==0 || $sys_pay_type==4}>
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
		
		 <{if $jf_sys_on==1}>
 			 <a class="weixin" target="_self" href="/?ac=extgo&oid=<{$oid}>"><li class="on" id="wx_zf">
            <span class="pay-icon icon-extpay"></span>
            <span>积分支付</span>
            <em class="ico-arrow"></em>
          </li></a>
		<{/if}>
        </ul>
      </div>
    </div>
</div>

<div class="aui-image-text b-line">
			<a href="javascript:;" class="aui-flex ">
				<div class="aui-flex-box">
					<h2>当前已有127用户成为vip</h2>
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
<script>
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
            testBtn.add('.J_testScrollTop').on('click',function(){$('html,body').scrollTop(topNum)})
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
<{include file='./ffsm/footers.tpl'}>
<{include file='./ffsm/dl_ck.tpl'}>
</body>
</html>