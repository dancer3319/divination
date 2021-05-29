<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=0">
    <title>2021年星座运势分析_十二星座-<{$zhanming}></title>
	<{include file='./ffsm/wx_share.tpl'}>
    <link rel="stylesheet" href="/statics/ffsm/xingzuo/css/common.css">
    <link rel="stylesheet" href="/statics/ffsm/xingzuo/css/preview_2.css">
    <link rel="stylesheet" href="/statics/ffsm/xingzuo/css/alert.css">
    <link rel="stylesheet" href="/statics/ffsm/xingzuo/css/success.css">
    <script type="text/javascript" src="/statics/ffsm/xingzuo/css/rem.js"></script>
</head>
<body>
<section class="alert" style="display: none">
    <div class="alert-wrap flex-column">
        <div class="alert-box flex-column">
            <div class="alert-banner-box flex-center">
                <img class="close-btn" src="/statics/ffsm/xingzuo/img/close_btn.png">
                <img class="alert-banner" src="/statics/ffsm/xingzuo/img/banner.png">
                <div class="banner-desc flex-column">
                    <p class="banner-title">选择星座</p>
                    <p class="banner-tips">查看对应星座的2021运势</p>
                </div>
            </div>
            <div class="alert-item flex-row">
                <div class="star-item flex-column" data-star="1">
                    <img class="star-img" src="/statics/ffsm/xingzuo/img/s1.png">
                    <span class="star-name">白羊座</span>
                    <span class="star-time">3.21-4.19</span>
                </div>
                <div class="star-item flex-column" data-star="2">
                    <img class="star-img" src="/statics/ffsm/xingzuo/img/s2.png">
                    <span class="star-name">金牛座</span>
                    <span class="star-time">4.20-5.20</span>
                </div>
                <div class="star-item flex-column" data-star="3">
                    <img class="star-img" src="/statics/ffsm/xingzuo/img/s3.png">
                    <span class="star-name">双子座</span>
                    <span class="star-time">5.21-6.21</span>
                </div>
                <div class="star-item flex-column" data-star="4">
                    <img class="star-img" src="/statics/ffsm/xingzuo/img/s4.png">
                    <span class="star-name">巨蟹座</span>
                    <span class="star-time">6.22-7.22</span>
                </div>
            </div>
            <div class="alert-item flex-row">
                <div class="star-item flex-column" data-star="5">
                    <img class="star-img" src="/statics/ffsm/xingzuo/img/s5.png">
                    <span class="star-name">狮子座</span>
                    <span class="star-time">7.23-8.22</span>
                </div>
                <div class="star-item flex-column" data-star="6">
                    <img class="star-img" src="/statics/ffsm/xingzuo/img/s6.png">
                    <span class="star-name">处女座</span>
                    <span class="star-time">8.23-9.22</span>
                </div>
                <div class="star-item flex-column" data-star="7">
                    <img class="star-img" src="/statics/ffsm/xingzuo/img/s7.png">
                    <span class="star-name">天秤座</span>
                    <span class="star-time">9.23-10.23</span>
                </div>
                <div class="star-item flex-column" data-star="8">
                    <img class="star-img" src="/statics/ffsm/xingzuo/img/s8.png">
                    <span class="star-name">天蝎座</span>
                    <span class="star-time">10.24-11.22</span>
                </div>
            </div>
            <div class="alert-item flex-row">
                <div class="star-item flex-column" data-star="9">
                    <img class="star-img" src="/statics/ffsm/xingzuo/img/s9.png">
                    <span class="star-name">射手座</span>
                    <span class="star-time">11.23-12.21</span>
                </div>
                <div class="star-item flex-column" data-star="10">
                    <img class="star-img" src="/statics/ffsm/xingzuo/img/s10.png">
                    <span class="star-name">摩羯座</span>
                    <span class="star-time">12.22-1.19</span>
                </div>
                <div class="star-item flex-column" data-star="11">
                    <img class="star-img" src="/statics/ffsm/xingzuo/img/s11.png">
                    <span class="star-name">水瓶座</span>
                    <span class="star-time">1.20-2.18</span>
                </div>
                <div class="star-item flex-column" data-star="12">
                    <img class="star-img" src="/statics/ffsm/xingzuo/img/s12.png">
                    <span class="star-name">双鱼座</span>
                    <span class="star-time">2.19-3.20</span>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="page">

    <section class="main-wrap flex-column">
        <div class="banner-wrap flex-column">
            <div class="xinzuo-wrap flex-column">
                <div class="switch-wrap flex-row">
                    <div class="star-box flex-row-2"><label for="star_name">当前星座:</label><span data-sid="1" id="star_name"><{$data.data.username}></span></div>
                    <img class="switch-btn" src="/statics/ffsm/xingzuo/img/switch_btn.png">
                </div>
                <img class="xinzuo-name" src="/statics/ffsm/xingzuo/img/<{$data.data.img}>.png">
            </div>
            <img class="banner" src="/statics/ffsm/xingzuo/img/banner_2.png">
        </div>

        <div class="pay-wrap flex-column">
            <div class="pay-box flex-column">
                <img class="guide-text" src="/statics/ffsm/xingzuo/img/guide_text.png" >
                <div class="price-box flex-row">
                    <div class="prices flex-column">
                        <div class="first-line flex-row">
                            <span class="title">原价</span>
                            <span class="false-price">￥138.8<em id="publicPayBottom"></em></span>
                        </div>
                        <div class="second-line flex-row">
                            <span class="title">限时优惠</span>
                            <span class="true-price">￥<{$data.money}></span>
                        </div>
                    </div>
                    <div class="times flex-column">
                        <span>距优惠结束</span>
                        <span class="run-time">02: 00: 00</span>
                    </div>
                </div>
                <img class="pay-btn J_payPopupShow" src="/statics/ffsm/xingzuo/img/pay_btn.png">
<style type="text/css">
@media screen and (max-width:1222px){.ydgz{display:none}}
.ydgz{margin: 1rem;width: 50%;}
.ydgz img{display: block;margin: 0 auto;width: 100%;}
.ydgz p{color: #fff;font-size: 0.4rem;text-align: center;margin-top: 0.5rem;}
</style>
                <{include file='./ffsm/fengge/pcwxgz.tpl'}>
            </div>
        </div>

        <div class="title-wrap flex-center">
            <img class="guide-title" src="/statics/ffsm/xingzuo/img/guide_title.png">
        </div>

        <div class="items-wrap flex-column love-wrap">
            <div class="items-box flex-column">
                <span class="items-title">2021爱情运势详解</span>
                <div class="month-wrap flex-column">
                    <div class="rate-box flex-row">
                        <span class="rate-title">综合评分：</span>
                        <div class="star-line flex-row-2" id="love_star"></div>
                    </div>
                    <img class="month-img" src="/statics/ffsm/xingzuo/img/month_love.png">
                </div>
                <div class="item-box flex-column">
                    <div class="item flex-column">
                        <span class="item-title flex-row">你的感情态度：</span>
                        <img class="item-img J_payPopupShow" src="/statics/ffsm/xingzuo/img/item_01.png">
                    </div>
                    <div class="item flex-column">
                        <span class="item-title flex-row">单身桃花运势：</span>
                        <img class="item-img J_payPopupShow" src="/statics/ffsm/xingzuo/img/item_02.png">
                    </div>
                    <div class="item flex-column">
                        <span class="item-title flex-row">情侣感情运势：</span>
                        <img class="item-img J_payPopupShow" src="/statics/ffsm/xingzuo/img/item_03.png">
                    </div>
                </div>
            </div>
        </div>

        <div class="items-wrap flex-column cash-wrap">
            <div class="items-box flex-column">
                <span class="items-title">2021财富运势详解</span>
                <div class="month-wrap flex-column">
                    <div class="rate-box flex-row">
                        <span class="rate-title">综合评分：</span>
                        <div class="star-line flex-row-2" id="cash_star"></div>
                    </div>
                    <img class="month-img" src="/statics/ffsm/xingzuo/img/month_cash.png">
                </div>
                <div class="item-box flex-column">
                    <div class="item flex-column">
                        <span class="item-title flex-row">财运总评：</span>
                        <img class="item-img J_payPopupShow" src="/statics/ffsm/xingzuo/img/item_04.png">
                    </div>
                    <div class="item flex-column">
                        <span class="item-title flex-row">投资状况：</span>
                        <img class="item-img J_payPopupShow" src="/statics/ffsm/xingzuo/img/item_05.png">
                    </div>
                    <div class="item flex-column">
                        <span class="item-title flex-row">支出详解：</span>
                        <img class="item-img J_payPopupShow" src="/statics/ffsm/xingzuo/img/item_06.png">
                    </div>
                </div>
            </div>
        </div>

        <div class="items-wrap flex-column job-wrap">
            <div class="items-box flex-column">
                <span class="items-title">2021事业运势详解</span>
                <div class="month-wrap flex-column">
                    <div class="rate-box flex-row">
                        <span class="rate-title">综合评分：</span>
                        <div class="star-line flex-row-2" id="job_star"></div>
                    </div>
                    <img class="month-img" src="/statics/ffsm/xingzuo/img/month_job.png">
                </div>
                <div class="item-box flex-column">
                    <div class="item flex-column">
                        <span class="item-title flex-row">事业运势总评：</span>
                        <img class="item-img J_payPopupShow" src="/statics/ffsm/xingzuo/img/item_07.png">
                    </div>
                    <div class="item flex-column">
                        <span class="item-title flex-row">工作学习情况：</span>
                        <img class="item-img J_payPopupShow" src="/statics/ffsm/xingzuo/img/item_08.png">
                    </div>
                    <div class="item flex-column">
                        <span class="item-title flex-row">职场学业发展：</span>
                        <img class="item-img J_payPopupShow" src="/statics/ffsm/xingzuo/img/item_09.png">
                    </div>
                </div>
            </div>
        </div>

    </section>
    <div class="float-wrap flex-center" style="display:none;">
        <div class="float-btn flex-center">
            <div class="ceshi-box flex-center J_payPopupShow">
                <img class="start-btn" src="/statics/ffsm/xingzuo/img/pay_btn_bg.png">
                <span class="price-text flex-center">查看完整解析( <em>￥<{$data.money}></em>)</span>
            </div>
        </div>
    </div>

    <div class="success-wrap flex-center" style="display:none;">
        <div class="success-box flex-column">
            <div class="success-banner flex-column">
                <img class="banners" src="/statics/ffsm/xingzuo/img/banner.png">
            </div>
            <div class="owner-wrap flex-column">
                <span class="owner flex-center"><em>白羊座</em>的</span>
                <span class="owner-2 flex-center">2021运势分析已购买</span>
            </div>
            <span class="over-text flex-center">正在进入...</span>
        </div>
    </div>

</section>

</body>
<link href="/statics/user/css/extend_module.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/statics/ffsm/xingzuo/css/jquery.min.js"></script>
<script type="text/javascript" src="/statics/ffsm/xingzuo/css/zwSdk.js"></script>

<script>

    $(document).ready(function () {
        //初始化星级
        var love_on = '<{$data.zh_on.love_on}>';
        love_on = Number(love_on);
        var cash_on = '<{$data.zh_on.cash_on}>';
        cash_on = Number(cash_on);
        var job_on = '<{$data.zh_on.job_on}>';
        job_on = Number(job_on);
        var love_on_m = parseInt(love_on);
        var love_bool = love_on_m<love_on?true:false;
        var cash_on_m = parseInt(cash_on);
        var cash_bool = cash_on_m<cash_on?true:false;
        var job_on_m = parseInt(job_on);
        var job_bool = job_on_m<job_on?true:false;
        initStar();
        function initStar() {
            for (var i = 0; i < 5; i++) {
                if(i<love_on_m){
                    $('#love_star').append("<img class='star' src='/statics/ffsm/xingzuo/img/star_d.png'>");
                }else{
                    if(love_bool){
                        $('#love_star').append("<img class='star' src='/statics/ffsm/xingzuo/img/star_d_0.png'>");
                        love_bool = false;
                    }else{
                        $('#love_star').append("<img class='star' src='/statics/ffsm/xingzuo/img/star_a.png'>");
                    }
                }
                if(i<cash_on_m){
                    $('#cash_star').append("<img class='star' src='/statics/ffsm/xingzuo/img/star_c.png'>");
                }else{
                    if(cash_bool){
                        $('#cash_star').append("<img class='star' src='/statics/ffsm/xingzuo/img/star_c_0.png'>");
                        cash_bool = false;
                    }else{
                        $('#cash_star').append("<img class='star' src='/statics/ffsm/xingzuo/img/star_a.png'>");
                    }
                }
                if(i<job_on_m){
                    $('#job_star').append("<img class='star' src='/statics/ffsm/xingzuo/img/star_b.png'>");
                }else{
                    if(job_bool){
                        $('#job_star').append("<img class='star' src='/statics/ffsm/xingzuo/img/star_b_0.png'>");
                        job_bool = false;
                    }else{
                        $('#job_star').append("<img class='star' src='/statics/ffsm/xingzuo/img/star_a.png'>");
                    }
                }
            }
        }
        //倒计时
        var remain = parseInt("7200");
        initTimer(remain--);
        var animate = setInterval(function () {
            initTimer(remain--);
        }, 1000);

        function initTimer(seconds) {
            if (seconds > 0) {
                var h = Math.floor(seconds / 3600);
                var m = Math.floor((seconds % 3600) / 60);
                var s = Math.ceil((seconds % 3600) % 60);
                h = h < 10 ? ('0' + h) : h;
                m = m < 10 ? ('0' + m) : m;
                s = s < 10 ? ('0' + s) : s;
                $('.run-time').text(h + ': ' + m + ': ' + s);
            } else {
                window.clearInterval(animate);
                window.location.href = "/?ac=xingzuo";
            }
        }

        $('.switch-btn').click(function () {
            $('.page').css({height: "100%", overflow: "hidden"});
            $('.alert').fadeIn();
        });
        $('.close-btn').click(function () {
            $('.page').css({height: "auto", overflow: "auto"});
            $('.alert').fadeOut();
        });
        var stars = ["白羊座","金牛座","双子座","巨蟹座","狮子座","处女座","天秤座","天蝎座","射手座","摩羯座","水瓶座","双鱼座"];
        var starid = 1;
        $('.star-item').click(function (event) {
            starid = parseInt(event.currentTarget.dataset.star);
            var star_name_old = "白羊座";
            $('#star_name').text(stars[starid-1]);
            $('.owner em').text(stars[starid-1]);
            var star_name_new = $('#star_name').text();
            if(star_name_old ==star_name_new){
                $('.page').css({height: "auto", overflow: "auto"});
                $('.alert').fadeOut();
                return null;
            }
        });

    });

    window.onscroll = function () {
        var top = document.documentElement.scrollTop || document.body.scrollTop;
        top > 740 ? $('.float-wrap').fadeIn() : $('.float-wrap').fadeOut();
    }
</script>
<div class="public_pay_popup" id="publicPayPopup">
	<div class="public_pp_box">
		<div class="public_pp_close" id="publicPPClose">
			X
		</div>
		<div class="public_pp_tit">
			解锁查看所有测算结果
		</div>
		<div class="public_pp_price">
			<span>统一鉴定价：</span><strong>￥<{$data.money}>元</strong>
		</div>
		<div class="public_pay_box">
			<{if $sys_pay_type==0 || $sys_pay_type==1 || $sys_pay_type==3}>
			<a class="weixin" target="_self" href="/?ct=pay&ac=go&oid=<{$data.oid}>&type=1">微信安全支付</a>
          <{/if}>
             <{if $sys_pay_type==0 || $sys_pay_type==2 || $sys_pay_type==3}>
            <a class="alipay" target="_self" href="/?ct=pay&ac=go&oid=<{$data.oid}>&type=2">支付宝安全支付</a>
          <{/if}>
            <{if $sys_pay_type==0 || $sys_pay_type==4}>
          <a class="weixin" target="_self" href="/?ct=pay&ac=pay_go&oid=<{$data.oid}>&type=wxpay">微信支付</a>
          <a class="alipay" target="_self" href="/?ct=pay&ac=pay_go&oid=<{$data.oid}>&type=alipay">支付宝支付</a>
              <{/if}>
            <{if $sys_pay_type==0 || $sys_pay_type==5}>
          <a class="paypal" target="_self" href="/?ct=pay&ac=paypal_go&oid=<{$data.oid}>">paypal支付</a>
            <{/if}>
			<{if $jf_sys_on==1}>
				<a class="m-extpay" target="_self" href="/?ac=extgo&oid=<{$data.oid}>">积分支付</a>
            <{/if}>
            <{if $vip_on==1}>
				<a class="m-vippay" target="_self" href="/?ac=vip_pay&oid=<{$data.oid}>">vip免支付</a>
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
</script>
<{include file='./ffsm/footers.tpl'}>
<{include file='./ffsm/dl_ck.tpl'}>
</html>