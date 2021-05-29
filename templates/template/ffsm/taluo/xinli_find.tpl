<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=0"/>
    <title>TA的心里有没有你？塔罗占卜-<{$zhanming}></title>
	<{include file='./ffsm/wx_share.tpl'}>
    <script src="/statics/ffsm/taluo/xinli/rem_tool.js"></script>
    <link rel="stylesheet" href="/statics/ffsm/taluo/xinli/common-v=1.0.css">
    <link rel="stylesheet" href="/statics/ffsm/taluo/xinli/result.css?v=1.2">
</head>
<body>
<header class="public_header">
<h1 class="public_h_con">塔罗占卜</h1>
<a class="public_h_home" href="/"></a><a href="/?ac=history" class="public_h_menu">我的订单</a></header>
<section class="page">
    <section class="main-wrap flex-column">
        <div class="banner-wrap flex-center">
            <img class="banner" src="/statics/ffsm/taluo/xinli/img/banner.png">
        </div>

        <div class="content-wrap flex-column">
            <div class="content-box flex-column">
                <img class="border border-top" src="/statics/ffsm/taluo/xinli/img/border_top.png">
                <div class="content-panel">
                    <div class="content flex-column">
                        <div class="top-wrap flex-column">
                            <div class="guide-wrap flex-column">
                                <div class="guide flex-column">
                                    <p class="guide-text first-line" id="first_line">亲爱的<em>测试者</em>：</p>
                                    <p class="guide-text" id="second_line">
                                        你抽到的每一张塔罗牌，都有着专属于你的神圣意义！接下来，我将透过你所选择的<em>4张牌</em>，揭示TA心里是否真的有你...
                                    </p>
                                </div>
                            </div>
                            <div class="card-group flex-column J_testFixedShow">
                                <img class="card-wall" src="/statics/ffsm/taluo/xinli/img/card_wall.png">
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
                <img class="border border-bot" src="/statics/ffsm/taluo/xinli/img/border_bot.png">
            </div>

            <div class="content-box flex-column">
                    <img class="border border-top"
                         src="/statics/ffsm/taluo/xinli/img/border_top.png">
                    <div class="content-panel">
                        <div class="content flex-column">
                            <img class="desc-subtitle"
                                 src="/statics/ffsm/taluo/xinli/img/nav_01.png">
                            <div class="tarot-box flex-column">
                                <img class="card-image" src="<{$data.data.carinfo.0.img}>">
                                <div class="card-intro flex-center">
                                    <img src="/statics/ffsm/taluo/xinli/img/num_01.png">
                                    <span>
                                        <{$data.data.carinfo.0.title}>                                        <em style="font-size: 14px;">
                                                                                        (<{if $data.data.carinfo.0.zf==0}>逆位<{else}>正位<{/if}>)                                                                                    </em>
                                    </span>
                                </div>
                                <div class="explain-box flex-column">
                                    <p class="explain-title">
                                        你的爱情观:                                                                                                                                                            </p>
                                    <p class="explain-text"><{$data.data.carinfo.0.content}></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <img class="border border-bot"
                         src="/statics/ffsm/taluo/xinli/img/border_bot.png">
                </div><div class="content-box flex-column">
                    <img class="border border-top"
                         src="/statics/ffsm/taluo/xinli/img/border_top.png">
                    <div class="content-panel">
                        <div class="content flex-column">
                            <img class="desc-subtitle"
                                 src="/statics/ffsm/taluo/xinli/img/nav_02.png">
                            <div class="tarot-box flex-column">
                                <img class="card-image" src="<{$data.data.carinfo.1.img}>">
                                <div class="card-intro flex-center">
                                    <img src="/statics/ffsm/taluo/xinli/img/num_02.png">
                                    <span>
                                        <{$data.data.carinfo.1.title}>                                        <em style="font-size: 14px;">
                                                                                        (<{if $data.data.carinfo.1.zf==0}>逆位<{else}>正位<{/if}>)                                                                                    </em>
                                    </span>
                                </div>
                                <div class="explain-box flex-column">
                                    <p class="explain-title">
                                                                                对方心迹:                                                                                                                    </p>
                                    <p class="explain-text"><{$data.data.carinfo.1.content}></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <img class="border border-bot"
                         src="/statics/ffsm/taluo/xinli/img/border_bot.png">
                </div><div class="content-box flex-column">
                    <img class="border border-top"
                         src="/statics/ffsm/taluo/xinli/img/border_top.png">
                    <div class="content-panel">
                        <div class="content flex-column">
                            <img class="desc-subtitle"
                                 src="/statics/ffsm/taluo/xinli/img/nav_03.png">
                            <div class="tarot-box flex-column">
                                <img class="card-image" src="<{$data.data.carinfo.2.img}>">
                                <div class="card-intro flex-center">
                                    <img src="/statics/ffsm/taluo/xinli/img/num_03.png">
                                    <span>
                                        <{$data.data.carinfo.2.title}>                                        <em style="font-size: 14px;">
                                                                                        (<{if $data.data.carinfo.2.zf==0}>逆位<{else}>正位<{/if}>)                                                                                    </em>
                                    </span>
                                </div>
                                <div class="explain-box flex-column">
                                    <p class="explain-title">
                                                                                                                        关系走向:                                                                            </p>
                                    <p class="explain-text"><{$data.data.carinfo.2.content}></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <img class="border border-bot"
                         src="/statics/ffsm/taluo/xinli/img/border_bot.png">
                </div><div class="content-box flex-column">
                    <img class="border border-top"
                         src="/statics/ffsm/taluo/xinli/img/border_top.png">
                    <div class="content-panel">
                        <div class="content flex-column">
                            <img class="desc-subtitle"
                                 src="/statics/ffsm/taluo/xinli/img/nav_04.png">
                            <div class="tarot-box flex-column">
                                <img class="card-image" src="<{$data.data.carinfo.3.img}>">
                                <div class="card-intro flex-center">
                                    <img src="/statics/ffsm/taluo/xinli/img/num_04.png">
                                    <span>
                                        <{$data.data.carinfo.3.title}>                                        <em style="font-size: 14px;">
                                            (<{if $data.data.carinfo.3.zf==0}>逆位<{else}>正位<{/if}>)                                                                                                                                </em>
                                    </span>
                                </div>
                                <div class="explain-box flex-column">
                                    <p class="explain-title">
                                                                                                                                                                塔罗指引:                                    </p>
                                    <p class="explain-text"><{$data.data.carinfo.3.content}></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <img class="border border-bot"
                         src="/statics/ffsm/taluo/xinli/img/border_bot.png">
                </div>        </div>

        

        <{include file="./index/taluo/footer.tpl"}>

    </section>
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
.ainuo_foot_nav{display: block; padding: 2px 0; background:#40347a; position: fixed; bottom: 0; width: 100%; z-index: 99999;max-width: 640px;}
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