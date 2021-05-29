<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=0"/>
    <title>你们有机会复合吗？塔罗占卜-<{$zhanming}></title>
	<{include file='./ffsm/wx_share.tpl'}>
    <script src="/statics/ffsm/taluo/aiqing/rem_tool.js"></script>
    <link rel="stylesheet" href="/statics/ffsm/taluo/fuhe/common.css">
    <link rel="stylesheet" href="/statics/ffsm/taluo/fuhe/unpay_3.css">
</head>
<body>
<header class="public_header">
<h1 class="public_h_con">塔罗占卜</h1>
<a class="public_h_home" href="/"></a><a href="/?ac=history" class="public_h_menu">我的订单</a></header>
<section class="page">
    <section class="main-wrap flex-column">
        <div class="banner-wrap flex-center">
            <img class="banner" src="/statics/ffsm/taluo/fuhe/img/banner.png">
        </div>
        <div class="content-wrap flex-column">
            <div class="content-box flex-column">
                <img class="border border-top" src="/statics/ffsm/taluo/fuhe/img/border_top.png">
                <div class="content-panel">
                    <div class="content flex-column">
                        <div class="top-wrap flex-column">
                            <div class="guide-wrap flex-column J_testFixedShow">
                                <img class="frame frame-top" src="/statics/ffsm/taluo/fuhe/img/frame_top.png">
                                <div class="guide flex-column">
                                    <p class="guide-text first-line" id="first_line">亲爱的<em>测试者</em>：</p>
                                    <p class="guide-text" id="second_line">
                                        曾经相爱的你们，有办法再重修旧好，回到昔日的甜蜜吗？关于你们是否有机会复合，我将根据你所选择的4张牌，给予进一步指引…
                                    </p>
                                </div>
                                <img class="frame frame-bot" src="/statics/ffsm/taluo/fuhe/img/frame_bot.png">
                            </div>
                            <div class="card-group flex-column">
                                <img class="card-wall" src="/statics/ffsm/taluo/fuhe/img/card_wall.png">
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
                                    </div>                           </div>
                            <div class="price-wrap flex-column">
                                <p class="project-name flex-center">咨询项目: 你们还有机会复合吗？</p>
                                <div class="price-content flex-center">
                                    <img src="/statics/ffsm/taluo/fuhe/img/price-wall.png" class="wall">
                                    <div class="wall-content flex-row">
                                        <div class="price-box flex-column">
                                            <span class="false-price flex-row"><label>原价：</label><em>￥88.80</em></span>
                                            <span class="true-price flex-row"><label>限时价</label><em>￥<{$data.money}></em></span>
                                        </div>
                                        <div class="time-box flex-column">
                                            <span class="time-title">距离优惠结束</span>
                                            <span class="time-discount">00: 00: 00</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="user-count flex-row">
                                    <span>已有<em>1215468</em>人测算</span>
                                    <span>好评率: <em>99.8%</em></span>
                                </div>
                            </div>
                            <img class="start-btn J_payPopupShow" src="/statics/ffsm/taluo/fuhe/img/pay_btn.png">
                        </div>
                    </div>
                </div>
                <img class="border border-bot" src="/statics/ffsm/taluo/fuhe/img/border_bot.png">
            </div>

            <div class="content-box flex-column">
                <img class="title" src="/statics/ffsm/taluo/fuhe/img/title.png">
                <img class="border border-top" src="/statics/ffsm/taluo/fuhe/img/border_top.png">
                <div class="content-panel">
                    <div class="content flex-column">
                        <img class="desc-subtitle" src="/statics/ffsm/taluo/fuhe/img/subtitle_01.png">
                        <div class="tarot-box flex-column">
                            <img class="card-image" src="<{$data.data.carinfo.0.img}>">
                            <div class="card-intro flex-center">
                                <img src="/statics/ffsm/taluo/fuhe/img/num_01.png">
                                <span><{$data.data.carinfo.0.title}>&nbsp;(<{if $data.data.carinfo.0.zf==0}>逆位<{else}>正位<{/if}>)</span>
                            </div>
                            <div class="explan-box flex-column">
                                <p class="explan-title">象征意义:</p>
                                <p class="explan-text"><{$data.data.carinfo.0.des}></p>
                                <p class="explan-title">牌面理解:</p>
                                <p class="explan-text"><{$data.data.carinfo.0.c1|truncate:40:"...":true}></p>
                            </div>
                            <div class="card-desc flex-center">
                                <img class="blur-img" src="/statics/ffsm/taluo/fuhe/img/blurry_01.png">
                                <div class="parse-box flex-column">
                                    <img class="start-btn-mid J_payPopupShow" data-no="1" src="/statics/ffsm/taluo/fuhe/img/unlock.png">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <img class="border border-bot" src="/statics/ffsm/taluo/fuhe/img/border_bot.png">
            </div>

            <div class="content-box flex-column">
                <img class="border border-top" src="/statics/ffsm/taluo/fuhe/img/border_top.png">
                <div class="content-panel">
                    <div class="content flex-column">
                        <img  class="desc-subtitle" src="/statics/ffsm/taluo/fuhe/img/subtitle_02.png">
                        <div class="tarot-box flex-column">
                            <img class="card-image" src="<{$data.data.carinfo.1.img}>">
                            <div class="card-intro flex-center">
                                <img src="/statics/ffsm/taluo/fuhe/img/num_02.png">
                                <span><{$data.data.carinfo.1.title}>&nbsp;(<{if $data.data.carinfo.1.zf==0}>逆位<{else}>正位<{/if}>)</span>
                            </div>
                            <div class="card-desc flex-center">
                                <img class="blur-img" src="/statics/ffsm/taluo/fuhe/img/blurry_02.png">
                                <div class="parse-box flex-column">
                                    <ul class="parse-list flex-column">
                                        <li class="item flex-row"><img src="/statics/ffsm/taluo/fuhe/img/point.png"><span>你们之间存在的最大问题是什么？</span></li>
                                        <li class="item flex-row"><img src="/statics/ffsm/taluo/fuhe/img/point.png"><span>重新来过，这个<em>问题会解决吗？</em></span></li>
                                    </ul>
                                    <img class="start-btn-mid J_payPopupShow" data-no="2" src="/statics/ffsm/taluo/fuhe/img/unlock.png">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <img class="border border-bot" src="/statics/ffsm/taluo/fuhe/img/border_bot.png">
            </div>

            <div class="content-box flex-column">
                <img class="border border-top" src="/statics/ffsm/taluo/fuhe/img/border_top.png">
                <div class="content-panel">
                    <div class="content flex-column">
                        <img  class="desc-subtitle" src="/statics/ffsm/taluo/fuhe/img/subtitle_03.png">
                        <div class="tarot-box flex-column">
                            <img class="card-image" src="<{$data.data.carinfo.2.img}>">
                            <div class="card-intro flex-center">
                                <img src="/statics/ffsm/taluo/fuhe/img/num_03.png">
                                <span><{$data.data.carinfo.2.title}>&nbsp;(<{if $data.data.carinfo.2.zf==0}>逆位<{else}>正位<{/if}>)</span>
                            </div>
                            <img class="rate" src="/statics/ffsm/taluo/fuhe/img/rate.png">
                            <div class="card-desc flex-center">
                                <img class="blur-img" src="/statics/ffsm/taluo/fuhe/img/blurry_03.png">
                                <div class="parse-box flex-column">
                                    <ul class="parse-list flex-column">
                                        <li class="item flex-row"><img src="/statics/ffsm/taluo/fuhe/img/point.png"><span>你们<em>旧情复燃的几率</em>有多大？</span></li>
                                        <li class="item flex-row"><img src="/statics/ffsm/taluo/fuhe/img/point.png"><span>究竟会再续前缘还是分道扬镳？</span></li>
                                    </ul>
                                    <img class="start-btn-mid J_payPopupShow" data-no="3"src="/statics/ffsm/taluo/fuhe/img/unlock.png">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <img class="border border-bot" src="/statics/ffsm/taluo/fuhe/img/border_bot.png">
            </div>

            <div class="content-box flex-column">
                <img class="border border-top" src="/statics/ffsm/taluo/fuhe/img/border_top.png">
                <div class="content-panel">
                    <div class="content flex-column">
                        <img class="desc-subtitle" src="/statics/ffsm/taluo/fuhe/img/subtitle_04.png">
                        <div class="tarot-box flex-column">
                            <img class="card-image" src="<{$data.data.carinfo.3.img}>">
                            <div class="card-intro flex-center">
                                <img src="/statics/ffsm/taluo/fuhe/img/num_04.png">
                                <span><{$data.data.carinfo.3.title}>&nbsp;(<{if $data.data.carinfo.3.zf==0}>逆位<{else}>正位<{/if}>)</span>
                            </div>
                            <div class="card-desc flex-center">
                                <img class="blur-img" src="/statics/ffsm/taluo/fuhe/img/blurry_04.png">
                                <div class="parse-box flex-column">
                                    <ul class="parse-list flex-column">
                                        <li class="item flex-row"><img src="/statics/ffsm/taluo/fuhe/img/point.png"><span>如何<em>挽回最美好的自己</em>？</span></li>
                                        <li class="item flex-row"><img src="/statics/ffsm/taluo/fuhe/img/point.png"><span><em>逆转爱情结局</em>，掌握Ta的心！</span></li>
                                    </ul>
                                    <img class="start-btn-mid J_payPopupShow" data-no="4" src="/statics/ffsm/taluo/fuhe/img/unlock.png">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <img class="border border-bot" src="/statics/ffsm/taluo/fuhe/img/border_bot.png">
            </div>

            <div class="content-box flex-column">
                <img class="border border-top" src="/statics/ffsm/taluo/fuhe/img/border_top.png">
                <div class="content-panel">
                    <div class="content flex-column comment-box">
                        <p class="comment-title flex-center">已为超过<em>12万</em>人提供情感指引</p>
                        <div class="detail-data flex-row">
                            <span class="person-count flex-row">已测算人数:<em>123343</em></span>
                            <span class="rate-num flex-row"><img style="width: 18px;" src="/statics/ffsm/taluo/fuhe/img/emoji.png">好评率:<em>99.8%</em></span>
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
                                        <p class="user">匿名</p>
                                        <p class="detail">好像真的说的挺像的，塔罗牌真是个神奇的东西，希望能如占卜结果一般</p>
                                    </li><li>
                                        <p class="user">匿名</p>
                                        <p class="detail">每次都能帮我解决问题，是时候想想怎么做了</p>
                                    </li><li>
                                        <p class="user">匿名</p>
                                        <p class="detail">真的，没有查看深度解析的时候，看图解就已经才出来一二分，心里面有谱了，真心感谢，不是托，</p>
                                    </li><li>
                                        <p class="user">匿名</p>
                                        <p class="detail">希望可以成真，希望最后的最后我们能重新走到一起并走到最后</p>
                                    </li><li>
                                        <p class="user">陈先生</p>
                                        <p class="detail">坦白说这回答令我觉得不可思议。第一张牌就直入重点。经过详细的分析和指导我更明确下一步和每一步感恩！</p>
                                    </li><li>
                                        <p class="user">方先生</p>
                                        <p class="detail">我也是无意间看到这个测试的，原本只想当游戏玩玩的，没想到看测试结果贴近80%吧，还算满意</p>
                                    </li><li>
                                        <p class="user">myl先生</p>
                                        <p class="detail">和婚姻师说的很相像
厉害了
希望时间能解决一切
我希望大家都能成长</p>
                                    </li><li>
                                        <p class="user">che先生</p>
                                        <p class="detail">塔罗牌算的真的是太准了，完全说出了我们之间存在的问题，也给了我建议，我知道该怎么做了！</p>
                                    </li><li>
                                        <p class="user">刁*女士</p>
                                        <p class="detail">测算的内容很详细很有用，希望能帮我早日与他复合</p>
                                    </li><li>
                                        <p class="user">汤*先生</p>
                                        <p class="detail">还可以，比之前测过其他家的好很多，当下感情遇到的阻碍跟我本身很匹配！比较推荐！
</p>
                                    </li><li>
                                        <p class="user">马*女士</p>
                                        <p class="detail">无意间点进来的，忍不住好奇心就测了。emmm…真的蛮准的，性价比很高！
</p>
                                    </li><li>
                                        <p class="user">刘*先生</p>
                                        <p class="detail">解说详细，内容令人信服！
</p>
                                    </li><li>
                                        <p class="user">樊*女士</p>
                                        <p class="detail">说中了95%，真的是牛皮！！！就一个字：服！
</p>
                                    </li><li>
                                        <p class="user">洪*女士</p>
                                        <p class="detail">内容很多，感觉都有几千字了。
</p>
                                    </li><li>
                                        <p class="user">石*先生</p>
                                        <p class="detail">内容上比较有针对性,也很直白。个人觉得还是蛮准的,并且很详细,很值！
</p>
                                    </li><li>
                                        <p class="user">王*女士</p>
                                        <p class="detail">还行，比之前的好多占卜详细很多，也得到了一些有用的建议！
</p>
                                    </li><li>
                                        <p class="user">任*女士</p>
                                        <p class="detail">太神奇了，真得好准```
</p>
                                    </li><li>
                                        <p class="user">高*女士</p>
                                        <p class="detail">内容有当前对方想法、存在的问题、是否能够复合，同时也有对应的化解方法，个人觉得非常实用准确，推荐！
</p>
                                    </li><li>
                                        <p class="user">雷*先生</p>
                                        <p class="detail">跟简介很匹配，想看的都看到了，希望能突破当前的局势，和她早日复合。
</p>
                                    </li><li>
                                        <p class="user">龙*先生</p>
                                        <p class="detail">分手好久了，一直没死心，感谢塔罗指引我什么才是该坚持的。
</p>
                                    </li><li>
                                        <p class="user">孙*先生</p>
                                        <p class="detail">我是朋友介绍过来的，没想到这么不错，女朋友已追回，感谢！
</p>
                                    </li><li>
                                        <p class="user">何*女士</p>
                                        <p class="detail">准！原来最近跟男朋友一直分分合合原因竟然是这样！！不说了我要赶紧去哄他了
</p>
                                    </li><li>
                                        <p class="user">钱*先生</p>
                                        <p class="detail">很专业，很详细，另外再说一句！！！真得挺准```
</p>
                                    </li><li>
                                        <p class="user">李*先生</p>
                                        <p class="detail">分手半年女朋友心里还有我，这次误会解除，我一定好好跟她相处！
</p>
                                    </li><li>
                                        <p class="user">吴*先生</p>
                                        <p class="detail">就两个字： 超值！！！
</p>
                                    </li><li>
                                        <p class="user">周*女士</p>
                                        <p class="detail">跟他分分合合好几年了都没被善待，看来果然不应该再坚持了。很实用，感谢！
</p>
                                    </li><li>
                                        <p class="user">秦*女士</p>
                                        <p class="detail">准！比较详细，我喜欢这种比较直接的。不过有一些细节不是很深入，想找老师帮忙再详细算一遍。
</p>
                                    </li>                            </ul>
                        </div>
                    </div>
                </div>
                <img class="border border-bot" src="/statics/ffsm/taluo/fuhe/img/border_bot.png">
            </div>

        </div>

        <div class="float-wrap flex-center" style="display: none">
            <div class="float-btn flex-center">
                <img class="start-btn start-btn-bot" style="margin: 0rem" src="/statics/ffsm/taluo/fuhe/img/start_btn_3.png">
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