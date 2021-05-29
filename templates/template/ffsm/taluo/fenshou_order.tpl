<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=0"/>
    <title>你和TA该分手吗？塔罗占卜-<{$zhanming}></title>
	<{include file='./ffsm/wx_share.tpl'}>
    <script src="/statics/ffsm/taluo/aiqing/rem_tool.js"></script>
    <link rel="stylesheet" href="/statics/ffsm/taluo/fenshou/common.css">
    <link rel="stylesheet" href="/statics/ffsm/taluo/fenshou/preview.css">
</head>
<body>
<header class="public_header">
<h1 class="public_h_con">塔罗占卜</h1>
<a class="public_h_home" href="/"></a><a href="/?ac=history" class="public_h_menu">我的订单</a></header>
<section class="page">
    <section class="main-wrap flex-column">
        <div class="banner-wrap flex-center">
            <img class="banner" src="/statics/ffsm/taluo/fenshou/img/banner.png">
        </div>

        <div class="content-wrap flex-column">
            <div class="content-box flex-column">
                <img class="border border-top" src="/statics/ffsm/taluo/fenshou/img/border_top.png">
                <div class="content-panel">
                    <div class="content flex-column">
                        <div class="top-wrap flex-column">
                            <div class="guide-wrap flex-column J_testFixedShow">
                                <div class="guide flex-column">
                                    <p class="guide-text first-line" id="first_line">亲爱的<em>测试者</em>：</p>
                                    <p class="guide-text" id="second_line">
                                        你抽到的每张塔罗牌，都有着神圣且独特的意义！接下来，我将透过你所选择的<em>4张牌</em>，揭示你和昔日的爱人是否应该分手...
                                    </p>
                                </div>
                            </div>
                            <div class="card-group flex-column">
                                <img class="card-wall" src="/statics/ffsm/taluo/fenshou/img/card_wall.png">
                                <div class="tarot-card tarot-card-1 flex-column">
                                        <img src="<{$data.data.carinfo.0.img}>">
                                        <p class="card-name"><{$data.data.carinfo.0.title}></p>
                                        <span>(<{if $data.data.carinfo.0.zf==0}>逆位<{else}>正位<{/if}>)</span>
                                    </div><div class="tarot-card tarot-card-2 flex-column">
                                        <img src="<{$data.data.carinfo.1.img}>">
                                        <p class="card-name"><{$data.data.carinfo.1.title}></p>
                                        <span>(<{if $data.data.carinfo.1.zf==0}>逆位<{else}>正位<{/if}>)</span>
                                    </div><div class="tarot-card tarot-card-3 flex-column">
                                        <img src="<{$data.data.carinfo.2.img}>">
                                        <p class="card-name"><{$data.data.carinfo.2.title}></p>
                                        <span>(<{if $data.data.carinfo.2.zf==0}>逆位<{else}>正位<{/if}>)</span>
                                    </div><div class="tarot-card tarot-card-4 flex-column">
                                        <img src="<{$data.data.carinfo.3.img}>">
                                        <p class="card-name"><{$data.data.carinfo.3.title}></p>
                                        <span>(<{if $data.data.carinfo.3.zf==0}>逆位<{else}>正位<{/if}>)</span>
                                    </div>                            </div>
                            <div class="price-wrap flex-column">
                                <p class="project-name flex-center">咨询项目: 你和TA该分手吗？</p>
                                <div class="price-content flex-row" style="border-top: none">
                                    <div class="price-box flex-column">
                                        <span class="false-price flex-row"><label>原价：</label><em>￥88.80</em></span>
                                        <span class="true-price flex-row"><label>限时优惠</label><em>￥<{$data.money}></em></span>
                                    </div>
                                    <div class="time-box flex-column">
                                        <span class="time-title">距优惠结束</span>
                                        <span class="time-discount">00: 20: 00</span>
                                    </div>
                                </div>
                            </div>
                            <div class="user-count flex-row">
                                <span>已有<em>114160</em>人测算</span>
                                <span>好评率: <em>99.8%</em></span>
                            </div>
                            <img class="start-btn-top J_payPopupShow" src="/statics/ffsm/taluo/fenshou/img/pay_btn.png">
                        </div>
                    </div>
                </div>
                <img class="border border-bot" src="/statics/ffsm/taluo/fenshou/img/border_bot.png">
            </div>

            <div class="content-box flex-column">
                <img class="title" src="/statics/ffsm/taluo/fenshou/img/guide_title.png">
                <img class="border border-top" src="/statics/ffsm/taluo/fenshou/img/border_top.png">
                <div class="content-panel">
                    <div class="content flex-column">
                        <img class="desc-subtitle" src="/statics/ffsm/taluo/fenshou/img/nav_01.png">
                        <div class="tarot-box flex-column">
                            <img class="card-image" src="<{$data.data.carinfo.0.img}>">
                            <div class="card-intro flex-center">
                                <img src="/statics/ffsm/taluo/fenshou/img/num_01.png">
                                <span><{$data.data.carinfo.0.title}>&nbsp;<em>(<{if $data.data.carinfo.0.zf==0}>逆位<{else}>正位<{/if}>)</em></span>
                            </div>
                            <div class="explain-box flex-column">
                                <p class="explain-title">对方想法:</p>
                                <p class="explain-text"><{$data.data.carinfo.0.c1|truncate:40:"...":true}></p>
                            </div>
                            <div class="card-desc flex-center">
                                <img class="blur-img" src="/statics/ffsm/taluo/fenshou/img/blurry_01.png">
                                <div class="parse-box flex-column">
                                    <img class="start-btn-mid J_payPopupShow" data-no="1" src="/statics/ffsm/taluo/fenshou/img/unlock.png">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <img class="border border-bot" src="/statics/ffsm/taluo/fenshou/img/border_bot.png">
            </div>

            <div class="content-box flex-column">
                <img class="border border-top" src="/statics/ffsm/taluo/fenshou/img/border_top.png">
                <div class="content-panel">
                    <div class="content flex-column">
                        <img  class="desc-subtitle" src="/statics/ffsm/taluo/fenshou/img/nav_02.png">
                        <div class="tarot-box flex-column">
                            <img class="card-image" src="<{$data.data.carinfo.1.img}>">
                            <div class="card-intro flex-center">
                                <img src="/statics/ffsm/taluo/fenshou/img/num_02.png">
                                <span><{$data.data.carinfo.1.title}>&nbsp;<em>(<{if $data.data.carinfo.1.zf==0}>逆位<{else}>正位<{/if}>)</em></span>
                            </div>
                            <div class="explain-box flex-column">
                                <p class="explain-title">感情现状:</p>
                            </div>
                            <div class="card-desc flex-center">
                                <img class="blur-img" src="/statics/ffsm/taluo/fenshou/img/blurry_02.png">
                                <div class="parse-box flex-column">
                                    <ul class="parse-list flex-column">
                                        <li class="item flex-row"><img src="/statics/ffsm/taluo/fenshou/img/point.png"><span>目前感情还有挽回的必要吗？</span></li>
                                        <li class="item flex-row"><img src="/statics/ffsm/taluo/fenshou/img/point.png"><span>感情的根本问题到底在哪？</span></li>
                                        <li class="item flex-row"><img src="/statics/ffsm/taluo/fenshou/img/point.png"><span>为什么总是付出得不到回报？</span></li>
                                    </ul>
                                    <img class="start-btn-mid J_payPopupShow" data-no="2" src="/statics/ffsm/taluo/fenshou/img/unlock.png">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <img class="border border-bot" src="/statics/ffsm/taluo/fenshou/img/border_bot.png">
            </div>

            <div class="content-box flex-column">
                <img class="border border-top" src="/statics/ffsm/taluo/fenshou/img/border_top.png">
                <div class="content-panel">
                    <div class="content flex-column">
                        <img  class="desc-subtitle" src="/statics/ffsm/taluo/fenshou/img/nav_03.png">
                        <div class="tarot-box flex-column">
                            <img class="card-image" src="<{$data.data.carinfo.2.img}>">
                            <div class="card-intro flex-center">
                                <img src="/statics/ffsm/taluo/fenshou/img/num_03.png">
                                <span><{$data.data.carinfo.2.title}>&nbsp;<em>(<{if $data.data.carinfo.2.zf==0}>逆位<{else}>正位<{/if}>)</em></span>
                            </div>
                            <div class="explain-box flex-column">
                                <p class="explain-title">是否分手:</p>
                            </div>
                            <div class="card-desc flex-center">
                                <img class="blur-img" src="/statics/ffsm/taluo/fenshou/img/blurry_03.png">
                                <div class="parse-box flex-column">
                                    <ul class="parse-list flex-column">
                                        <li class="item flex-row"><img src="/statics/ffsm/taluo/fenshou/img/point.png"><span>你们的感情走向会如何？</span></li>
                                        <li class="item flex-row"><img src="/statics/ffsm/taluo/fenshou/img/point.png"><span>是否还会在一起？</span></li>
                                        <li class="item flex-row"><img src="/statics/ffsm/taluo/fenshou/img/point.png"><span>到底应该分手吗？</span></li>
                                    </ul>
                                    <img class="start-btn-mid J_payPopupShow" data-no="3"src="/statics/ffsm/taluo/fenshou/img/unlock.png">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <img class="border border-bot" src="/statics/ffsm/taluo/fenshou/img/border_bot.png">
            </div>

            <div class="content-box flex-column">
                <img class="border border-top" src="/statics/ffsm/taluo/fenshou/img/border_top.png">
                <div class="content-panel">
                    <div class="content flex-column">
                        <img class="desc-subtitle" src="/statics/ffsm/taluo/fenshou/img/nav_04.png">
                        <div class="tarot-box flex-column">
                            <img class="card-image" src="<{$data.data.carinfo.3.img}>">
                            <div class="card-intro flex-center">
                                <img src="/statics/ffsm/taluo/fenshou/img/num_04.png">
                                <span><{$data.data.carinfo.3.title}>&nbsp;<em>(<{if $data.data.carinfo.3.zf==0}>逆位<{else}>正位<{/if}>)</em></span>
                            </div>
                            <div class="explain-box flex-column">
                                <p class="explain-title">塔罗指引:</p>
                            </div>
                            <div class="card-desc flex-center">
                                <img class="blur-img" src="/statics/ffsm/taluo/fenshou/img/blurry_04.png">
                                <div class="parse-box flex-column">
                                    <ul class="parse-list flex-column">
                                        <li class="item flex-row"><img src="/statics/ffsm/taluo/fenshou/img/point.png"><span>如何调整自己当下的心态？</span></li>
                                        <li class="item flex-row"><img src="/statics/ffsm/taluo/fenshou/img/point.png"><span>如何改善你们当前的相处模式？</span></li>
                                        <li class="item flex-row"><img src="/statics/ffsm/taluo/fenshou/img/point.png"><span>怎样改变消极的感情现状？</span></li>
                                    </ul>
                                    <img class="start-btn-mid J_payPopupShow" data-no="4" src="/statics/ffsm/taluo/fenshou/img/unlock.png">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <img class="border border-bot" src="/statics/ffsm/taluo/fenshou/img/border_bot.png">
            </div>

            <div class="content-box flex-column">
                <img class="border border-top" src="/statics/ffsm/taluo/fenshou/img/border_top.png">
                <div class="content-panel">
                    <div class="content flex-column comment-box">
                        <p class="comment-title flex-center">已为超过<em>12万</em>人提供情感指引</p>
                        <div class="detail-data flex-row">
                            <span class="person-count flex-row">已测算人数:<em>123343</em></span>
                            <span class="rate-num flex-row"><img src="/statics/ffsm/taluo/fenshou/img/emoji.png">好评率:<em>99.8%</em></span>
                        </div>
                        <div class="labels flex-row">
                            <span id="label_0">非常有用(<em>24234</em>)</span>
                            <span id="label_1">符合现状(<em>4532</em>)</span>
                            <span id="label_2">超级准(<em>3842</em>)</span>
                            <span id="label_3">很专业(<em>2408</em>)</span>
                            <span id="label_4">真实(<em>64543</em>)</span>
                        </div>
                        <div class="upto-wrap">
                            <ul class="comment-list info-list-box">
                                <li>
                                        <p class="user">刁*女士</p>
                                        <p class="detail">塔罗牌算的真的是太准了，完全说出了我当前感情存在的问题，也给了我建议，我知道该怎么做了！鲁*女士</p>
                                    </li><li>
                                        <p class="user">吴*先生</p>
                                        <p class="detail">准确！比之前测过其他家的好很多，当下问题、状态都很对，建议也很中肯，太值了！
</p>
                                    </li><li>
                                        <p class="user">季*女士</p>
                                        <p class="detail">和婚姻师说的很相像 厉害了 希望时间能解决一切 我希望大家都能成长！
</p>
                                    </li><li>
                                        <p class="user">刘*先生</p>
                                        <p class="detail">不管怎么样，解开了我心里的疑惑，以后感情发展更有方向啦。
</p>
                                    </li><li>
                                        <p class="user">左*女士</p>
                                        <p class="detail">坦白说这回答令我觉得不可思议。第一张牌就直入重点。经过详细的分析和指导我更明确下一步和每一步感恩！
</p>
                                    </li><li>
                                        <p class="user">张*女士</p>
                                        <p class="detail">内容很丰富，对分手与否的建议也是比较具体的。
</p>
                                    </li><li>
                                        <p class="user">简*先生</p>
                                        <p class="detail">真的很准，钱没有白花，一开始的时候确实很犹豫，结果真的是很准，真的很棒！
</p>
                                    </li><li>
                                        <p class="user">谢*女士</p>
                                        <p class="detail">最近感情比较反复，根据建议的方法调整了一下，很多事都变得顺利了。
</p>
                                    </li><li>
                                        <p class="user">冯*女士</p>
                                        <p class="detail">还行，比之前的好多占卜详细很多，也得到了一些有用的建议！
</p>
                                    </li><li>
                                        <p class="user">王*女士</p>
                                        <p class="detail">第一次用塔罗测试，本来是不太信的，但是测了两次结果都比较接近，最重要的是前天他联系我要求婚，太太太惊喜了!
</p>
                                    </li><li>
                                        <p class="user">张*女士</p>
                                        <p class="detail">解牌马上就看出了问题的关键，说的很到位，感觉对未来不再是那么迷茫了！
</p>
                                    </li><li>
                                        <p class="user">魏*先生</p>
                                        <p class="detail">跟简介很匹配，想看的都看到了，希望能像说的那样，通过调整在感情中不再被动！
</p>
                                    </li><li>
                                        <p class="user">许*先生</p>
                                        <p class="detail">通过调整顺利和好！！！简直不要太开心，真的这是我做过最准的一次占卜！
</p>
                                    </li><li>
                                        <p class="user">冯*先生</p>
                                        <p class="detail">我是朋友介绍过来的，本来以为必须得分手，没想到调节好了
</p>
                                    </li><li>
                                        <p class="user">沈*女士</p>
                                        <p class="detail">非常有用，不仅有用还给了我很客观的建议！
</p>
                                    </li><li>
                                        <p class="user">许*先生</p>
                                        <p class="detail">塔罗牌真是个神奇的东西，跟自身95%像了，特别是解决方法特别实用。
</p>
                                    </li><li>
                                        <p class="user">李*先生</p>
                                        <p class="detail">好评，很专业！
</p>
                                    </li><li>
                                        <p class="user">陈*先生</p>
                                        <p class="detail">总的感觉还是挺准确的，尤其当前的状态和建议，特别对我自己的现状。
</p>
                                    </li><li>
                                        <p class="user">魏*女士</p>
                                        <p class="detail">特别特别有用，瞬间释然了，摆脱渣男！！
</p>
                                    </li><li>
                                        <p class="user">钱*女士</p>
                                        <p class="detail">准！感觉自己瞬间都有方向了
</p>
                                    </li>                            </ul>
                        </div>
                    </div>
                </div>
                <img class="border border-bot" src="/statics/ffsm/taluo/fenshou/img/border_bot.png">
            </div>

        </div>

        <div class="float-wrap flex-center" style="display:none;">
            <div class="float-btn flex-center">
                <img class="start-btn start-btn-bot" style="margin: 0rem" src="/statics/ffsm/taluo/fenshou/img/pay_btn_bot.png">
            </div>
        </div>

    </section>
</section>
<div class="ainuo_foot_nav cl" id="testFixedBtn" style="display: none;">
    <ul>
     <li><a href="/"><i class="shouye_1"></i><p>测算首页</p></a></li>
     <li><a href="/?ac=history"><i class="wddd_1"></i><p>订单查询</p></a></li>
     <li><a href="javascript:;" id="publicPayBottom" class="botpost J_payPopupShow"><em><i class="lijijs_1"></i></em><p>付费解锁</p></a></li>
     <li><a href="/"><i class="gengduo_1"></i><p>更多测算</p></a></li>
     <li><a href="/?ac=member"><i class="grzx_1"></i><p>个人中心</p></a></li>
    </ul>
</div>
<style type="text/css">
.ainuo_foot_nav{display: block; padding: 2px 0; background:#3a2d30; position: fixed; bottom: 0; width: 100%; z-index: 99999;max-width: 640px;}
.ainuo_foot_nav li{width: 20%; text-align: center; float: left;}
.ainuo_foot_nav li a{width: 100%; display: block;text-decoration: none;}
.ainuo_foot_nav .foothover i{color: #f13030;}
.ainuo_foot_nav li i{display: block; line-height: 25px; height: 25px; margin: auto; padding: 0; width: 25px; overflow: hidden; background-size: 100%;}
.ainuo_foot_nav li a.botpost{position: relative; margin-top: -11px; background-color: rgba(0,0,0,0.0);text-decoration: none;}
.ainuo_foot_nav li a.botpost em{background: #ffffff; padding: 2px; border: 1px solid #ff5e5e; display: block; border-radius: 50%; width: 30px; height: 30px; margin: 0 auto; margin-bottom: 6px;padding-bottom: 0px;}
.ainuo_foot_nav li p{overflow: hidden; font-size: 12px; height: 16px; line-height: 16px; color: #fff; font-weight: 400;}
.shouye_1{background: url(/statics/ffsm/public/images/shouye.png) no-repeat;}
.wddd_1{background: url(/statics/ffsm/public/images/dingdan.png) no-repeat;}
.lijijs_1{background: url(/statics/ffsm/public/images/jiesuo.png) no-repeat;}
.gengduo_1{background: url(/statics/ffsm/public/images/gengduo.png) no-repeat;}
.grzx_1{background: url(/statics/ffsm/public/images/grzx.png) no-repeat;}
</style>
<script type="text/javascript" src="/statics/ffsm/taluo/jixu/jquery.min.js"></script>
<script type="text/javascript" src="/statics/ffsm/taluo/jixu/scroll.js"></script>
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
    	}
    })()
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
    $(document).ready(function () {
        var remain = parseInt("7200");
        remain = 1200;
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
                $('.time-discount').text(h + ': ' + m + ': ' + s);
            } else {
                window.clearInterval(animate);
                window.location.href = "/?ct=pay&ac=go&oid=<{$data.oid}>&type=1";
            }
        }
    });
</script>
<{include file='./ffsm/footer.tpl'}>
<{include file='./ffsm/dl_ck.tpl'}>
</body>
</html>