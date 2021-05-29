<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>他心里有别人吗？塔罗占卜-<{$zhanming}></title>
    <style>
        *{
            margin: 0;
            padding: 0;
            border: none;
            box-sizing: border-box;
            font-family: "Helvetica Neue",Helvetica,sans-serif;
        }
        html, body {
            max-width: 640px !important;
            width: 100% !important;
            height: 100% !important;
            margin: 0 auto !important;
        }
        body{
            background-color: #FFFFFF !important;
        }
        div.mainbox{
            background-color: #32275f !important;
        }
    </style>
	<{include file='./ffsm/wx_share.tpl'}>
    <script type="text/javascript">
        (function (doc, win) {
            var docEl = doc.documentElement,
                    resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
                    recalc = function () {
                        var clientWidth = docEl.clientWidth > 640 ? 640 : docEl.clientWidth;
                        if (!clientWidth) return;
                        docEl.style.fontSize = 20 * (clientWidth / 320) + 'px';
                    };
            if (!doc.addEventListener) return;
            win.addEventListener(resizeEvt, recalc, false);
            doc.addEventListener('DOMContentLoaded', recalc, false);
            recalc();
        })(document, window);
    </script>
    <link rel="stylesheet" href="/statics/ffsm/taluo/bieren/result.css">
    <link rel="stylesheet" href="/statics/ffsm/taluo/bieren/resultcom.css">
	<link rel="stylesheet" href="/statics/ffsm/taluo/bieren/common.css">
</head>
<body>
<header class="public_header">
<h1 class="public_h_con">塔罗占卜</h1>
<a class="public_h_home" href="/"></a><a href="/?ac=history" class="public_h_menu">我的订单</a></header>
<div class="mainbox">
    <img src="/statics/ffsm/taluo/bieren/img/banner1.png" class="maintitle">

    <div class="contentbox">
        <img src="/statics/ffsm/taluo/bieren/img/border-top.png" class="borderimg borderTop">
        <div class="content" style="padding-top: 0.4rem;">
            <!--<img src="/statics/ffsm/taluo/bieren/img/tip1.png" class="maindesc_title">-->
            <p class="desc_title" id="src_0">亲爱的测试者，让我们来看看<span></span>心里是否有别人？</p>
            <p class="desc_title" id="src_1" style="margin-top: 0.4rem">亲爱的<span>测试者</span>:</p>
            <p class="desc_title">每张塔罗牌，都有着神圣且重大的意义！接下来，我将透过以下6张塔罗牌，揭露他的心里有没有别人！</p>

            <div class="card_array">
                <img src="/statics/ffsm/taluo/bieren/img/tip3.png" class="maindesc_tip2">
                <img src="<{$data.data.carinfo.0.img}>" class="taluo_card_item taluo_card1"><img src="<{$data.data.carinfo.1.img}>" class="taluo_card_item taluo_card2"><img src="<{$data.data.carinfo.2.img}>" class="taluo_card_item taluo_card3"><img src="<{$data.data.carinfo.3.img}>" class="taluo_card_item taluo_card4"><img src="<{$data.data.carinfo.4.img}>" class="taluo_card_item taluo_card5"><img src="<{$data.data.carinfo.5.img}>" class="taluo_card_item taluo_card6">            </div>
            <p class="desc_title">TA为什么越来越冷淡？…TA冷淡的原因是什么？让塔罗牌给你解答！</p>
            <p class="split"></p>
        </div>
        <p class="split"></p>
        <img src="/statics/ffsm/taluo/bieren/img/border-bottom2.png" class="borderimg borderBottom">
    </div>

    <div class="contentbox J_testFixedShow">
            <img src="/statics/ffsm/taluo/bieren/img/border-top.png" class="borderimg borderTop">
            <div class="content">
                <div class="qbox">
                    <div class="questionbox">
                        <img src="/statics/ffsm/taluo/bieren/img/navt_01.png" class="question">
                        <div class="taluobox">
                            <img src="<{$data.data.carinfo.0.img}>" class="taluo_card">
                            <p class="taluo_name">
                                <img src="/statics/ffsm/taluo/bieren/img/c1.png" class="taluo_cardidx">
                                <{$data.data.carinfo.0.title}>                               <span>
                                                                        &nbsp;<{if $data.data.carinfo.0.zf==0}>逆位<{else}>正位<{/if}>                                </span>
                            </p>
                            <p class="taluo_title">牌面理解：</p>
                            <p class="taluo_desc"><{$data.data.carinfo.0.des}></p>
                            <p class="taluo_title">你们之前关系的状态是：</p>
                            <p class="taluo_desc"><{$data.data.carinfo.0.content}></p>
                        </div>
                    </div>
                </div>
                <p class="split"></p>
            </div>
            <p class="split"></p>
            <img src="/statics/ffsm/taluo/bieren/img/border-bottom2.png" class="borderimg borderBottom">
        </div><div class="contentbox">
            <img src="/statics/ffsm/taluo/bieren/img/border-top.png" class="borderimg borderTop">
            <div class="content">
                <div class="qbox">
                    <div class="questionbox">
                        <img src="/statics/ffsm/taluo/bieren/img/navt_02.png" class="question">
                        <div class="taluobox">
                            <img src="<{$data.data.carinfo.1.img}>" class="taluo_card">
                            <p class="taluo_name">
                                <img src="/statics/ffsm/taluo/bieren/img/c2.png" class="taluo_cardidx">
                                <{$data.data.carinfo.1.title}>                                <span>
                                                                        &nbsp;<{if $data.data.carinfo.1.zf==0}>逆位<{else}>正位<{/if}>                                </span>
                            </p>
                            <p class="taluo_title">牌面理解：</p>
                            <p class="taluo_desc"><{$data.data.carinfo.1.des}></p>
                            <p class="taluo_title">你的不安全都来源于：</p>
                            <p class="taluo_desc"><{$data.data.carinfo.1.content}></p>
                        </div>
                    </div>
                </div>
                <p class="split"></p>
            </div>
            <p class="split"></p>
            <img src="/statics/ffsm/taluo/bieren/img/border-bottom2.png" class="borderimg borderBottom">
        </div><div class="contentbox">
            <img src="/statics/ffsm/taluo/bieren/img/border-top.png" class="borderimg borderTop">
            <div class="content">
                <div class="qbox">
                    <div class="questionbox">
                        <img src="/statics/ffsm/taluo/bieren/img/navt_03.png" class="question">
                        <div class="taluobox">
                            <img src="<{$data.data.carinfo.2.img}>" class="taluo_card">
                            <p class="taluo_name">
                                <img src="/statics/ffsm/taluo/bieren/img/c3.png" class="taluo_cardidx">
                                <{$data.data.carinfo.2.title}>                                <span>
                                                                        &nbsp;<{if $data.data.carinfo.2.zf==0}>逆位<{else}>正位<{/if}>                                </span>
                            </p>
                            <p class="taluo_title">牌面理解：</p>
                            <p class="taluo_desc"><{$data.data.carinfo.2.des}></p>
                            <p class="taluo_title">TA变了吗？冷淡的原因是：</p>
                            <p class="taluo_desc"><{$data.data.carinfo.2.content}></p>
                        </div>
                    </div>
                </div>
                <p class="split"></p>
            </div>
            <p class="split"></p>
            <img src="/statics/ffsm/taluo/bieren/img/border-bottom2.png" class="borderimg borderBottom">
        </div><div class="contentbox">
            <img src="/statics/ffsm/taluo/bieren/img/border-top.png" class="borderimg borderTop">
            <div class="content">
                <div class="qbox">
                    <div class="questionbox">
                        <img src="/statics/ffsm/taluo/bieren/img/navt_04.png" class="question">
                        <div class="taluobox">
                            <img src="<{$data.data.carinfo.3.img}>" class="taluo_card">
                            <p class="taluo_name">
                                <img src="/statics/ffsm/taluo/bieren/img/c4.png" class="taluo_cardidx">
                                <{$data.data.carinfo.3.title}>                                <span>
                                                                        &nbsp;<{if $data.data.carinfo.3.zf==0}>逆位<{else}>正位<{/if}>                                </span>
                            </p>
                            <p class="taluo_title">牌面理解：</p>
                            <p class="taluo_desc"><{$data.data.carinfo.3.des}></p>
                            <p class="taluo_title">TA的心里到底有没有别人？</p>
                            <p class="taluo_desc"><{$data.data.carinfo.3.content}></p>
                        </div>
                    </div>
                </div>
                <p class="split"></p>
            </div>
            <p class="split"></p>
            <img src="/statics/ffsm/taluo/bieren/img/border-bottom2.png" class="borderimg borderBottom">
        </div><div class="contentbox">
            <img src="/statics/ffsm/taluo/bieren/img/border-top.png" class="borderimg borderTop">
            <div class="content">
                <div class="qbox">
                    <div class="questionbox">
                        <img src="/statics/ffsm/taluo/bieren/img/navt_05.png" class="question">
                        <div class="taluobox">
                            <img src="<{$data.data.carinfo.4.img}>" class="taluo_card">
                            <p class="taluo_name">
                                <img src="/statics/ffsm/taluo/bieren/img/c5.png" class="taluo_cardidx">
                                <{$data.data.carinfo.4.title}>                                <span>
                                                                        &nbsp;<{if $data.data.carinfo.4.zf==0}>逆位<{else}>正位<{/if}>                                </span>
                            </p>
                            <p class="taluo_title">牌面理解：</p>
                            <p class="taluo_desc"><{$data.data.carinfo.4.des}></p>
                            <p class="taluo_title">你可以这样做：</p>
                            <p class="taluo_desc"><{$data.data.carinfo.4.content}></p>
                        </div>
                    </div>
                </div>
                <p class="split"></p>
            </div>
            <p class="split"></p>
            <img src="/statics/ffsm/taluo/bieren/img/border-bottom2.png" class="borderimg borderBottom">
        </div><div class="contentbox">
            <img src="/statics/ffsm/taluo/bieren/img/border-top.png" class="borderimg borderTop">
            <div class="content">
                <div class="qbox">
                    <div class="questionbox">
                        <img src="/statics/ffsm/taluo/bieren/img/navt_06.png" class="question">
                        <div class="taluobox">
                            <img src="<{$data.data.carinfo.5.img}>" class="taluo_card">
                            <p class="taluo_name">
                                <img src="/statics/ffsm/taluo/bieren/img/c6.png" class="taluo_cardidx">
                                <{$data.data.carinfo.5.title}>                                <span>
                                                                        &nbsp;<{if $data.data.carinfo.5.zf==0}>逆位<{else}>正位<{/if}>                                </span>
                            </p>
                            <p class="taluo_title">牌面理解：</p>
                            <p class="taluo_desc"><{$data.data.carinfo.5.des}></p>
                            <p class="taluo_title">塔罗指引你的幸福方向：</p>
                            <p class="taluo_desc"><{$data.data.carinfo.5.content}></p>
                        </div>
                    </div>
                </div>
                <p class="split"></p>
            </div>
            <p class="split"></p>
            <img src="/statics/ffsm/taluo/bieren/img/border-bottom2.png" class="borderimg borderBottom">
        </div>
    <div class="contentbox">
        <img src="/statics/ffsm/taluo/bieren/img/border-top.png" class="borderimg borderTop">
        <div class="content">
            <div class="qbox">
                <div class="questionbox">
                    <img src="/statics/ffsm/taluo/bieren/img/navt07.png" class="question">
                    <div class="taluobox">
                        <img src="/statics/ffsm/taluo/bieren/img/1543214846UvGld.png" class="taluo_card" style="width: 4.6rem;">
                        <p class="Angle_title">大天使 爱瑟瑞尔</p>
                        <p class="Angle_desc">你召唤的大天使是爱瑟瑞尔（Azrael）</p>
                        <p class="Angle_desc">她将化解你的哀伤，抚慰你的情感。在你感到不安时，她将协助你走出困境，让你感到舒服与被爱。</p>
                        <p class="lasttitle">~珍藏大天使牌，为你守护幸福~</p>
                    </div>
                </div>
            </div>
            <p class="split"></p>
        </div>
        <p class="split"></p>
        <img src="/statics/ffsm/taluo/bieren/img/border-bottom.png" class="borderimg borderBottom">
    </div>
</div>
<div class="ainuo_foot_nav cl" id="testFixedBtn" style="display: none;">
    <ul>
     <li><a href="/"><i class="shouye_1"></i><p>测算首页</p></a></li>
     <li><a href="/?ac=history"><i class="wddd_1"></i><p>订单查询</p></a></li>
     <li><a href="/"class="botpost"><em><i class="lijics_1"></i></em><p>继续测算</p></a></li>
     <li><a href="/"><i class="gengduo_1"></i><p>更多测算</p></a></li>
     <li><a href="/?ac=member"><i class="grzx_1"></i><p>个人中心</p></a></li>
    </ul>
</div>
<style type="text/css">
.ainuo_foot_nav{display: block; padding: 2px 0; background:#33285e; position: fixed; bottom: 0; width: 100%; z-index: 99999;max-width: 640px;}
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
.lijics_1{background: url(/statics/ffsm/public/images/suan.png) no-repeat;}
.gengduo_1{background: url(/statics/ffsm/public/images/gengduo.png) no-repeat;}
.grzx_1{background: url(/statics/ffsm/public/images/grzx.png) no-repeat;}
</style>
<script src="/statics/ffsm/taluoyunshi/jquery.min.js"></script>
<script src="/statics/ffsm/taluoyunshi/jquery.raty.min.js"></script>
<{include file='./ffsm/footer.tpl'}>
<{include file='./ffsm/dl_ck.tpl'}>
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
</script>
</body>
</html>