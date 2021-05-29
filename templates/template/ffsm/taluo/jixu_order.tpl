<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=0"/>
    <title>付费解锁-你和TA该继续下去吗？-<{$zhanming}>塔罗牌占卜</title>
	<{include file='./ffsm/wx_share.tpl'}>
    <script src="/statics/ffsm/taluo/jixu/rem_tool.js"></script>
    <link rel="stylesheet" href="/statics/ffsm/taluo/jixu/common-v=1.4.css">
    <link rel="stylesheet" href="/statics/ffsm/taluo/jixu/preview.css?v=1.5">
</head>
<body>
<header class="public_header">
<h1 class="public_h_con">塔罗占卜</h1>
<a class="public_h_home" href="/"></a><a href="/?ac=history" class="public_h_menu">我的订单</a></header>
<section class="page">
    <section class="main-wrap flex-column">
        <div class="banner-wrap flex-center">
            <img class="banner" src="/statics/ffsm/taluo/jixu/image/banner.png">
        </div>

        <div class="content-wrap flex-column">
            <div class="content-box flex-column">
                <img class="border border-top" src="/statics/ffsm/taluo/jixu/image/border_top.png">
                <div class="content-panel">
                    <div class="content flex-column">
                        <img class="main-title" src="/statics/ffsm/taluo/jixu/image/main_title.png">
                        <div class="top-wrap flex-column">
                            <div class="guide-wrap flex-column J_testFixedShow">
                                <div class="guide flex-column">
                                    <p class="guide-text first-line" id="first_line">亲爱的<em>测试者</em>：</p>
                                    <p class="guide-text" id="second_line">
                                        曾经亲密的人，心中还有你吗？你到底该放手还是该坚持？关于你们该不该继续，我将根据你所选择的4张牌，给予进一步指引...
                                    </p>
                                </div>
                            </div>
                            <div class="card-group flex-column">
                                <img class="card-wall" src="/statics/ffsm/taluo/jixu/image/card_wall2.png">
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
                                <p class="project-name flex-center">咨询项目: 你和TA该继续吗？</p>
                                <div class="price-content flex-row" style="border-top: none">
                                    <div class="price-box flex-column">
                                        <span class="false-price flex-row"><label>原价：</label><em>￥88.80</em></span>
                                        <span class="true-price flex-row"><label style="background-color: #e0706f;">限时优惠</label><em>￥<{$data.money}></em></span>
                                    </div>
                                    <div class="time-box flex-column">
                                        <span class="time-title">距优惠结束</span>
                                        <span class="time-discount">02: 00: 00</span>
                                    </div>
                                </div>
                            </div>
                            <div class="user-count flex-row">
                                <span>已有<em>374718</em>人测算</span>
                                <span>好评率: <em>99.8%</em></span>
                            </div>
                            <img class="start-btn" id="publicPayBottom" src="/statics/ffsm/taluo/jixu/image/pay_btn.png">
                        </div>
                    </div>
                </div>
                <img class="border border-bot" src="/statics/ffsm/taluo/jixu/image/border_bot.png">
            </div>

            <div class="content-box flex-column">
                <img class="title" src="/statics/ffsm/taluo/jixu/image/guide_title.png">
                <img class="border border-top" src="/statics/ffsm/taluo/jixu/image/border_top.png">
                <div class="content-panel">
                    <div class="content flex-column">
                        <img class="desc-subtitle" src="/statics/ffsm/taluo/jixu/image/nav_01.png">
                        <div class="tarot-box flex-column">
                            <img class="card-image" src="<{$data.data.carinfo.0.img}>">
                            <div class="card-intro flex-center">
                                <img src="/statics/ffsm/taluo/jixu/image/num_01.png">
                                <span><{$data.data.carinfo.0.title}>&nbsp;<em>(<{if $data.data.carinfo.0.zf==0}>逆位<{else}>正位<{/if}>)</em></span>
                            </div>
                            <div class="explan-box flex-column">
                                <p class="explan-title">象征意义:</p>
                                <p class="explan-text"><{$data.data.carinfo.0.des}></p>
                                <p class="explan-title">对方想法:</p>
                                <p class="explan-text"><{$data.data.carinfo.0.content|truncate:40:"...":true}></p>
                            </div>
                            <div class="card-desc flex-center">
                                <img class="blur-img" src="/statics/ffsm/taluo/jixu/image/blurry_01.png">
                                <div class="parse-box flex-column">
                                    <img class="start-btn-mid J_payPopupShow" data-no="1" src="/statics/ffsm/taluo/jixu/image/unlock.png">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <img class="border border-bot" src="/statics/ffsm/taluo/jixu/image/border_bot.png">
            </div>

            <div class="content-box flex-column">
                <img class="border border-top" src="/statics/ffsm/taluo/jixu/image/border_top.png">
                <div class="content-panel">
                    <div class="content flex-column">
                        <img  class="desc-subtitle" src="/statics/ffsm/taluo/jixu/image/nav_02.png">
                        <div class="tarot-box flex-column">
                            <img class="card-image" src="<{$data.data.carinfo.1.img}>">
                            <div class="card-intro flex-center">
                                <img src="/statics/ffsm/taluo/jixu/image/num_02.png">
                                <span><{$data.data.carinfo.1.title}>&nbsp;<em>(<{if $data.data.carinfo.1.zf==0}>逆位<{else}>正位<{/if}>)</em></span>
                            </div>
                            <div class="card-desc flex-center">
                                <img class="blur-img" src="/statics/ffsm/taluo/jixu/image/blurry_02.png">
                                <div class="parse-box flex-column">
                                    <ul class="parse-list flex-column">
                                        <li class="item flex-row"><img src="/statics/ffsm/taluo/jixu/image/point.png"><span>对方心里有你吗？</span></li>
                                        <li class="item flex-row"><img src="/statics/ffsm/taluo/jixu/image/point.png"><span>你的付出值得吗？</span></li>
                                        <li class="item flex-row"><img src="/statics/ffsm/taluo/jixu/image/point.png"><span>你们之间<em>真的合适吗</em>？</span></li>
                                    </ul>
                                    <img class="start-btn-mid J_payPopupShow" data-no="2" src="/statics/ffsm/taluo/jixu/image/unlock.png">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <img class="border border-bot" src="/statics/ffsm/taluo/jixu/image/border_bot.png">
            </div>

            <div class="content-box flex-column">
                <img class="border border-top" src="/statics/ffsm/taluo/jixu/image/border_top.png">
                <div class="content-panel">
                    <div class="content flex-column">
                        <img  class="desc-subtitle" src="/statics/ffsm/taluo/jixu/image/nav_03.png">
                        <div class="tarot-box flex-column">
                            <img class="card-image" src="<{$data.data.carinfo.2.img}>">
                            <div class="card-intro flex-center">
                                <img src="/statics/ffsm/taluo/jixu/image/num_03.png">
                                <span><{$data.data.carinfo.2.title}>&nbsp;<em>(<{if $data.data.carinfo.2.zf==0}>逆位<{else}>正位<{/if}>)</em></span>
                            </div>
                            <div class="card-desc flex-center">
                                <img class="blur-img" src="/statics/ffsm/taluo/jixu/image/blurry_03.png">
                                <div class="parse-box flex-column">
                                    <ul class="parse-list flex-column">
                                        <li class="item flex-row"><img src="/statics/ffsm/taluo/jixu/image/point.png"><span>你们的感情<em>会有什么阻碍</em>？</span></li>
                                        <li class="item flex-row"><img src="/statics/ffsm/taluo/jixu/image/point.png"><span>你会因此失去TA吗？</span></li>
                                        <li class="item flex-row"><img src="/statics/ffsm/taluo/jixu/image/point.png"><span>应当如何面对这些阻碍？</span></li>
                                    </ul>
                                    <img class="start-btn-mid J_payPopupShow" data-no="3"src="/statics/ffsm/taluo/jixu/image/unlock.png">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <img class="border border-bot" src="/statics/ffsm/taluo/jixu/image/border_bot.png">
            </div>

            <div class="content-box flex-column">
                <img class="border border-top" src="/statics/ffsm/taluo/jixu/image/border_top.png">
                <div class="content-panel">
                    <div class="content flex-column">
                        <img class="desc-subtitle" src="/statics/ffsm/taluo/jixu/image/nav_04.png">
                        <div class="tarot-box flex-column">
                            <img class="card-image" src="<{$data.data.carinfo.3.img}>">
                            <div class="card-intro flex-center">
                                <img src="/statics/ffsm/taluo/jixu/image/num_04.png">
                                <span><{$data.data.carinfo.3.title}>&nbsp;<em>(<{if $data.data.carinfo.3.zf==0}>逆位<{else}>正位<{/if}>)</em></span>
                            </div>
                            <div class="card-desc flex-center">
                                <img class="blur-img" src="/statics/ffsm/taluo/jixu/image/blurry_04.png">
                                <div class="parse-box flex-column">
                                    <ul class="parse-list flex-column">
                                        <li class="item flex-row"><img src="/statics/ffsm/taluo/jixu/image/point.png"><span>你们的感情能够维持多久？</span></li>
                                        <li class="item flex-row"><img src="/statics/ffsm/taluo/jixu/image/point.png"><span>你们的关系还能否更进一步？</span></li>
                                        <li class="item flex-row"><img src="/statics/ffsm/taluo/jixu/image/point.png"><span>你们还<em>应该继续走下去吗</em>？</span></li>
                                    </ul>
                                    <img class="start-btn-mid J_payPopupShow" data-no="4" src="/statics/ffsm/taluo/jixu/image/unlock.png">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <img class="border border-bot" src="/statics/ffsm/taluo/jixu/image/border_bot.png">
            </div>

            <div class="content-box flex-column">
                <img class="border border-top" src="/statics/ffsm/taluo/jixu/image/border_top.png">
                <div class="content-panel">
                    <div class="content flex-column comment-box">
                        <p class="comment-title flex-center">已为超过<em>12万</em>人提供情感指引</p>
                        <div class="detail-data flex-row">
                            <span class="person-count flex-row">已测算人数:<em>123343</em></span>
                            <span class="rate-num flex-row"><img src="/statics/ffsm/taluo/jixu/image/emoji.png">好评率:<em>99.8%</em></span>
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
                                        <p class="detail">以前一直觉得他不好，占卜完以后我试着去理解他，才发现原来他真的很爱我！</p>
                                    </li><li>
                                        <p class="user">吴*先生</p>
                                        <p class="detail">还可以，比之前测过其他家的好很多，当下感情遇到的阻碍跟我本身很匹配！比较推荐！
</p>
                                    </li><li>
                                        <p class="user">马*女士</p>
                                        <p class="detail">总体感觉很准确，其实有些问题自己是想到过的，只是当局者迷，需要一个外界的指引。
</p>
                                    </li><li>
                                        <p class="user">刘*先生</p>
                                        <p class="detail">不管怎么样，解开了我心里的疑惑，以后感情发展更有方向啦。
</p>
                                    </li><li>
                                        <p class="user">樊*女士</p>
                                        <p class="detail">给他测了一份，给我测了一份，两个结果居然出奇的匹配！！！疯狂打call！
</p>
                                    </li><li>
                                        <p class="user">李*女士</p>
                                        <p class="detail">内容很丰富，对未来的预测和建议也是比较具体的。
</p>
                                    </li><li>
                                        <p class="user">简*先生</p>
                                        <p class="detail">真的很准，钱没有白花，一开始的时候确实很犹豫，结果真的是很准，真的很棒！
</p>
                                    </li><li>
                                        <p class="user">谢*女士</p>
                                        <p class="detail">最近感情很糟心，占卜结果说我还不能操之过急，因为勉强为之反而会适得其反，果然我调整了一下心态，很多事都变得顺利了。
</p>
                                    </li><li>
                                        <p class="user">冯*女士</p>
                                        <p class="detail">还行，比之前的好多占卜详细很多，也得到了一些有用的建议！
</p>
                                    </li><li>
                                        <p class="user">王*女士</p>
                                        <p class="detail">第一次用塔罗测试，本来是不太信的，但是测了两次结果都比较接近，而且当前的状态和阻碍跟我本身也很匹配~
</p>
                                    </li><li>
                                        <p class="user">张*女士</p>
                                        <p class="detail">解牌马上就看出了问题的关键，说的很到位，感觉对未来不再是那么迷茫了！
</p>
                                    </li><li>
                                        <p class="user">曹*先生</p>
                                        <p class="detail">跟简介很匹配，想看的都看到了，希望能像说的那样，跟她一直继续下去！
</p>
                                    </li><li>
                                        <p class="user">许*先生</p>
                                        <p class="detail">对方的家长比较反对，本来有些担心，但牌面显示她会陪我渡过困难，这下我就放心了。
</p>
                                    </li><li>
                                        <p class="user">孙*先生</p>
                                        <p class="detail">我是朋友介绍过来的，没想到这么不错，说的很准！强烈推荐！！！
</p>
                                    </li><li>
                                        <p class="user">沈*女士</p>
                                        <p class="detail">非常有用，不仅有用还给了我很客观的建议！
</p>
                                    </li><li>
                                        <p class="user">赵*先生</p>
                                        <p class="detail">准确，是很好的感情指导工具。
</p>
                                    </li><li>
                                        <p class="user">李*先生</p>
                                        <p class="detail">好评，很专业！
</p>
                                    </li><li>
                                        <p class="user">陈*先生</p>
                                        <p class="detail">赞赞赞！
</p>
                                    </li><li>
                                        <p class="user">魏*女士</p>
                                        <p class="detail">特别特别有用，能说到问题的关键。
</p>
                                    </li><li>
                                        <p class="user">钱*女士</p>
                                        <p class="detail">准！比较详细，我喜欢这种不模棱两可的，比较直接。不过有一些细节不是很深入，想找老师帮忙再详细算一遍。
</p>
                                    </li>                            </ul>
                        </div>
                    </div>
                </div>
                <img class="border border-bot" src="/statics/ffsm/taluo/jixu/image/border_bot.png">
            </div>

        </div>

        <div class="float-wrap flex-center" style="display:none;">
            <div class="float-btn flex-center">
                <img class="start-btn start-btn-bot" style="margin: 0rem" src="/statics/ffsm/taluo/jixu/image/pay_btn_2.png">
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
.ainuo_foot_nav{display: block; padding: 2px 0; background:#602a8d; position: fixed; bottom: 0; width: 100%; z-index: 99999;max-width: 640px;}
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