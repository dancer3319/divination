<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=0"/>
    <title>塔罗牌占卜你和TA该继续吗？占卜结果-<{$zhanming}></title>
	<{include file='./ffsm/wx_share.tpl'}>
    <script src="/statics/ffsm/taluo/jixu/rem_tool.js"></script>
    <link rel="stylesheet" href="/statics/ffsm/taluo/jixu/common-v=1.4.css">
    <link rel="stylesheet" href="/statics/ffsm/taluo/jixu/result.css">
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
                            <div class="guide-wrap flex-column">
                                <div class="guide flex-column">
                                    <p class="guide-text first-line" id="first_line">亲爱的<em>测试者</em>：</p>
                                    <p class="guide-text" id="second_line">
                                        曾经亲密的人，心中还有你吗？你到底该放手还是该坚持？关于你们该不该继续，我将根据你所选择的4张牌，给予进一步指引...
                                    </p>
                                </div>
                            </div>
                            <div class="card-group flex-column J_testFixedShow">
                                <img class="card-wall"
                                     src="/statics/ffsm/taluo/jixu/image/card_wall2.png">
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
                        </div>
                    </div>
                </div>
                <img class="border border-bot" src="/statics/ffsm/taluo/jixu/image/border_bot.png">
            </div>

            <div class="content-box flex-column">
                    <img class="border border-top"
                         src="/statics/ffsm/taluo/jixu/image/border_top.png">
                    <div class="content-panel">
                        <div class="content flex-column">
                            <img class="desc-subtitle"
                                 src="/statics/ffsm/taluo/jixu/image/nav_01.png">
                            <div class="tarot-box flex-column">
                                <img class="card-image" src="<{$data.data.carinfo.0.img}>">
                                <div class="card-intro flex-center">
                                    <img src="/statics/ffsm/taluo/jixu/image/num_01.png">
                                    <span>
                                        <{$data.data.carinfo.0.title}>                                        <em style="font-size: 14px;">
                                            (<{if $data.data.carinfo.0.zf==0}>逆位<{else}>正位<{/if}>)                                                                                                                                </em>
                                    </span>
                                </div>
                                <div class="explan-box flex-column">
                                    <p class="explan-title">象征意义:</p>
                                    <p class="explan-text"><{$data.data.carinfo.0.des}></p>
                                    <!--<p class="explan-title">牌面解释:</p>-->
                                    <!--<p class="explan-text">愚人是开悟前的智者，画面上是一位乐观的旅行者，他站在悬崖的边缘，似乎再往前一步就是危险，可是他却不以为意，他背对着阳光，象征他不顾威权，背后的行囊象征由经验所习得的智慧。他脚边吠叫的狗代表过去，那个要将他拉回去，不让他经历在当下的力量，手上的白玫瑰代表他充满天真和信任，相信生命是支持他的。愚人象征的是，在世界开始前，无始无终的永恒状态，充满着未知和生命力，愚人代表“可能性”。</p>-->
                                    <p class="explan-title">
                                        对方想法:                                                                                                                                                            </p>
                                    <p class="explan-text"><{$data.data.carinfo.0.content}></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <img class="border border-bot"
                         src="/statics/ffsm/taluo/jixu/image/border_bot.png">
                </div><div class="content-box flex-column">
                    <img class="border border-top"
                         src="/statics/ffsm/taluo/jixu/image/border_top.png">
                    <div class="content-panel">
                        <div class="content flex-column">
                            <img class="desc-subtitle"
                                 src="/statics/ffsm/taluo/jixu/image/nav_02.png">
                            <div class="tarot-box flex-column">
                                <img class="card-image" src="<{$data.data.carinfo.1.img}>">
                                <div class="card-intro flex-center">
                                    <img src="/statics/ffsm/taluo/jixu/image/num_02.png">
                                    <span>
                                        <{$data.data.carinfo.1.title}>                                        <em style="font-size: 14px;">
                                            (<{if $data.data.carinfo.1.zf==0}>逆位<{else}>正位<{/if}>)                                                                                                                                </em>
                                    </span>
                                </div>
                                <div class="explan-box flex-column">
                                    <p class="explan-title">象征意义:</p>
                                    <p class="explan-text"><{$data.data.carinfo.1.des}></p>
                                    <!--<p class="explan-title">牌面解释:</p>-->
                                    <!--<p class="explan-text">愚人是开悟前的智者，画面上是一位乐观的旅行者，他站在悬崖的边缘，似乎再往前一步就是危险，可是他却不以为意，他背对着阳光，象征他不顾威权，背后的行囊象征由经验所习得的智慧。他脚边吠叫的狗代表过去，那个要将他拉回去，不让他经历在当下的力量，手上的白玫瑰代表他充满天真和信任，相信生命是支持他的。愚人象征的是，在世界开始前，无始无终的永恒状态，充满着未知和生命力，愚人代表“可能性”。</p>-->
                                    <p class="explan-title">
                                                                                双方姻缘:                                                                                                                    </p>
                                    <p class="explan-text"><{$data.data.carinfo.1.content}></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <img class="border border-bot"
                         src="/statics/ffsm/taluo/jixu/image/border_bot.png">
                </div><div class="content-box flex-column">
                    <img class="border border-top"
                         src="/statics/ffsm/taluo/jixu/image/border_top.png">
                    <div class="content-panel">
                        <div class="content flex-column">
                            <img class="desc-subtitle"
                                 src="/statics/ffsm/taluo/jixu/image/nav_03.png">
                            <div class="tarot-box flex-column">
                                <img class="card-image" src="<{$data.data.carinfo.2.img}>">
                                <div class="card-intro flex-center">
                                    <img src="/statics/ffsm/taluo/jixu/image/num_03.png">
                                    <span>
                                        <{$data.data.carinfo.2.title}>                                        <em style="font-size: 14px;">
                                            (<{if $data.data.carinfo.2.zf==0}>逆位<{else}>正位<{/if}>)                                                                                                                                </em>
                                    </span>
                                </div>
                                <div class="explan-box flex-column">
                                    <p class="explan-title">象征意义:</p>
                                    <p class="explan-text"><{$data.data.carinfo.2.des}></p>
                                    <!--<p class="explan-title">牌面解释:</p>-->
                                    <!--<p class="explan-text">愚人是开悟前的智者，画面上是一位乐观的旅行者，他站在悬崖的边缘，似乎再往前一步就是危险，可是他却不以为意，他背对着阳光，象征他不顾威权，背后的行囊象征由经验所习得的智慧。他脚边吠叫的狗代表过去，那个要将他拉回去，不让他经历在当下的力量，手上的白玫瑰代表他充满天真和信任，相信生命是支持他的。愚人象征的是，在世界开始前，无始无终的永恒状态，充满着未知和生命力，愚人代表“可能性”。</p>-->
                                    <p class="explan-title">
                                                                                                                        感情阻碍:                                                                            </p>
                                    <p class="explan-text"><{$data.data.carinfo.2.content}></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <img class="border border-bot"
                         src="/statics/ffsm/taluo/jixu/image/border_bot.png">
                </div><div class="content-box flex-column">
                    <img class="border border-top"
                         src="/statics/ffsm/taluo/jixu/image/border_top.png">
                    <div class="content-panel">
                        <div class="content flex-column">
                            <img class="desc-subtitle"
                                 src="/statics/ffsm/taluo/jixu/image/nav_04.png">
                            <div class="tarot-box flex-column">
                                <img class="card-image" src="<{$data.data.carinfo.3.img}>">
                                <div class="card-intro flex-center">
                                    <img src="/statics/ffsm/taluo/jixu/image/num_04.png">
                                    <span>
                                        <{$data.data.carinfo.3.title}>                                        <em style="font-size: 14px;">
                                            (<{if $data.data.carinfo.3.zf==0}>逆位<{else}>正位<{/if}>)                                                                                                                                </em>
                                    </span>
                                </div>
                                <div class="explan-box flex-column">
                                    <p class="explan-title">象征意义:</p>
                                    <p class="explan-text"><{$data.data.carinfo.3.des}></p>
                                    <!--<p class="explan-title">牌面解释:</p>-->
                                    <!--<p class="explan-text">愚人是开悟前的智者，画面上是一位乐观的旅行者，他站在悬崖的边缘，似乎再往前一步就是危险，可是他却不以为意，他背对着阳光，象征他不顾威权，背后的行囊象征由经验所习得的智慧。他脚边吠叫的狗代表过去，那个要将他拉回去，不让他经历在当下的力量，手上的白玫瑰代表他充满天真和信任，相信生命是支持他的。愚人象征的是，在世界开始前，无始无终的永恒状态，充满着未知和生命力，愚人代表“可能性”。</p>-->
                                    <p class="explan-title">
                                                                                                                                                                塔罗指引:                                    </p>
                                    <p class="explan-text"><{$data.data.carinfo.3.content}></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <img class="border border-bot"
                         src="/statics/ffsm/taluo/jixu/image/border_bot.png">
                </div>
        </div>
        <{include file="./index/taluo/footer.tpl"}>
    </section>
    <div class="toast-wrap flex-center">
        <div class="toast-box flex-center">
            <span style="font-size: 14px;"></span>
        </div>
    </div>
</section>
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
.ainuo_foot_nav{display: block; padding: 2px 0; background:#1e1613; position: fixed; bottom: 0; width: 100%; z-index: 99999;max-width: 640px;}
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