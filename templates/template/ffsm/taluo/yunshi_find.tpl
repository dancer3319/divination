<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=0"/>
    <title>塔罗牌占卜未来运势大解密-<{$zhanming}></title>
	<{include file='./ffsm/wx_share.tpl'}>
    <script src="/statics/ffsm/taluo/yunshi/rem_tool.js"></script>
    <link rel="stylesheet" href="/statics/ffsm/taluo/yunshi/common-v=1.4.css">
    <link rel="stylesheet" href="/statics/ffsm/taluo/yunshi/result.css?v=1.4">
</head>
<body>
<header class="public_header">
<h1 class="public_h_con">塔罗占卜</h1>
<a class="public_h_home" href="/"></a><a href="/?ac=history" class="public_h_menu">我的订单</a></header>
<section class="page">
    <section class="main-wrap flex-column">
        <div class="banner-wrap flex-center">
            <img class="banner" src="/statics/ffsm/taluo/yunshi/image/banner.png?v=1.0">
        </div>
        <div class="content-wrap flex-column">
            <div class="content-box flex-column">
                <img class="border border-top" src="/statics/ffsm/taluo/yunshi/image/border_top2.png?v=1.1">
                <div class="content-panel">
                    <div class="content flex-column">
                        <div class="top-wrap flex-column">
                            <div class="guide-wrap flex-column">
                                <div class="guide flex-column">
                                    <p class="guide-text first-line" id="first_line">亲爱的<em>测试者</em>：</p>
                                    <p class="guide-text" id="second_line">
                                        运势决定了未来人生的走向，而预知运网势发展能够让我们避免坎坷、掌握好运。关于你未来的运势，我将根据你所选择的3张牌，给予进一步指引...
                                    </p>
                                </div>
                            </div>
                            <div class="card-group flex-column J_testFixedShow">
                                <img class="card-wall"
                                     src="/statics/ffsm/taluo/yunshi/image/card_wall.png?v=1.0">
                                <div class="tarot-card tarot-card-1 flex-column">
                                        <img src="<{$data.data.carinfo.0.img}>">
                                        <p class="card-name"><{$data.data.carinfo.0.title}></p>
                                        <span>(<{if $data.data.carinfo.0.zf==1}>正位<{else}>逆位<{/if}>)</span>
                                    </div><div class="tarot-card tarot-card-2 flex-column">
                                        <img src="<{$data.data.carinfo.1.img}>">
                                        <p class="card-name"><{$data.data.carinfo.1.title}></p>
                                        <span>(<{if $data.data.carinfo.1.zf==1}>正位<{else}>逆位<{/if}>)</span>
                                    </div><div class="tarot-card tarot-card-3 flex-column">
                                        <img src="<{$data.data.carinfo.2.img}>">
                                        <p class="card-name"><{$data.data.carinfo.2.title}></p>
                                        <span>(<{if $data.data.carinfo.2.zf==1}>正位<{else}>逆位<{/if}>)</span>
                                    </div>                            </div>
                        </div>
                    </div>
                </div>
                <img class="border border-bot" src="/statics/ffsm/taluo/yunshi/image/border_bot2.png?v=1.1">
            </div>

            <div class="content-box flex-column">
                    <img class="title" src="/statics/ffsm/taluo/yunshi/image/love_title.png?v=1.0">                                                            <img class="border border-top" src="/statics/ffsm/taluo/yunshi/image/border_top2.png?v=1.1">
                    <div class="content-panel">
                        <div class="content flex-column">
                            <div class="tarot-box flex-column">
                                <img class="card-image" src="<{$data.data.carinfo.0.img}>">
                                <div class="card-intro flex-center">
                                    <img src="/statics/ffsm/taluo/yunshi/image/num_01.png">
                                    <span>
                                        <{$data.data.carinfo.0.title}>                                        <em style="font-size: 14px;">
                                            (<{if $data.data.carinfo.0.zf==1}>正位<{else}>逆位<{/if}>)                                                                                                                                </em>
                                    </span>
                                </div>
                                <div class="explan-box flex-column">
                                    <p class="explan-title" style="line-height: 1.6;color: #e6475b;">牌面解析:</p>                                                                                                            <div class="explan-text1"><{$data.data.carinfo.0.des}></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <img class="border border-bot" src="/statics/ffsm/taluo/yunshi/image/border_bot2.png?v=1.1">
                </div>
                <div class="content-box flex-column">
                        <img class="border border-top" src="/statics/ffsm/taluo/yunshi/image/border_top2.png?v=1.1">
                        <div class="content-panel">
                            <div class="content flex-column">
                                <img class="desc-subtitle" src="/statics/ffsm/taluo/yunshi/image/subtitle_10.png?v=1.0">                                                                                                                                <div class="tarot-box flex-column">
                                    <div class="explan-box flex-column">
                                        <div class="explan-text1"><{$data.data.carinfo.0.c1}></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <img class="border border-bot" src="/statics/ffsm/taluo/yunshi/image/border_bot2.png?v=1.1">
                    </div><div class="content-box flex-column">
                        <img class="border border-top" src="/statics/ffsm/taluo/yunshi/image/border_top2.png?v=1.1">
                        <div class="content-panel">
                            <div class="content flex-column">
                                                                <img class="desc-subtitle" src="/statics/ffsm/taluo/yunshi/image/subtitle_11.png?v=1.0">                                                                                                <div class="tarot-box flex-column">
                                    <div class="explan-box flex-column">
                                        <div class="explan-text1"><{$data.data.carinfo.0.c2}></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <img class="border border-bot" src="/statics/ffsm/taluo/yunshi/image/border_bot2.png?v=1.1">
                    </div><div class="content-box flex-column">
                        <img class="border border-top" src="/statics/ffsm/taluo/yunshi/image/border_top2.png?v=1.1">
                        <div class="content-panel">
                            <div class="content flex-column">
                                                                                                <img class="desc-subtitle" src="/statics/ffsm/taluo/yunshi/image/subtitle_12.png?v=1.0">                                                                <div class="tarot-box flex-column">
                                    <div class="explan-box flex-column">
                                        <div class="explan-text1"><{$data.data.carinfo.0.c3}></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <img class="border border-bot" src="/statics/ffsm/taluo/yunshi/image/border_bot2.png?v=1.1">
                    </div><div class="content-box flex-column">
                        <img class="border border-top" src="/statics/ffsm/taluo/yunshi/image/border_top2.png?v=1.1">
                        <div class="content-panel">
                            <div class="content flex-column">
                                                                                                                                <img class="desc-subtitle" src="/statics/ffsm/taluo/yunshi/image/subtitle_13.png?v=1.0">                                <div class="tarot-box flex-column">
                                    <div class="explan-box flex-column">
                                        <div class="explan-text1"><{$data.data.carinfo.0.c4}></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <img class="border border-bot" src="/statics/ffsm/taluo/yunshi/image/border_bot2.png?v=1.1">
                    </div>                                <div class="content-box flex-column">
                                        <img class="title" src="/statics/ffsm/taluo/yunshi/image/cash_title.png?v=1.0">                                        <img class="border border-top" src="/statics/ffsm/taluo/yunshi/image/border_top2.png?v=1.1">
                    <div class="content-panel">
                        <div class="content flex-column">
                            <div class="tarot-box flex-column">
                                <img class="card-image" src="<{$data.data.carinfo.1.img}>">
                                <div class="card-intro flex-center">
                                    <img src="/statics/ffsm/taluo/yunshi/image/num_02.png">
                                    <span>
                                        <{$data.data.carinfo.1.title}>                                        <em style="font-size: 14px;">
                                            (<{if $data.data.carinfo.1.zf==0}>逆位<{else}>正位<{/if}>)                                                                                                                                </em>
                                    </span>
                                </div>
                                <div class="explan-box flex-column">
                                                                        <p class="explan-title" style="line-height: 1.6;color: #d8690f;">牌面解析:</p>                                                                        <div class="explan-text1"><{$data.data.carinfo.1.des}></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <img class="border border-bot" src="/statics/ffsm/taluo/yunshi/image/border_bot2.png?v=1.1">
                </div>
                                <div class="content-box flex-column">
                            <img class="border border-top" src="/statics/ffsm/taluo/yunshi/image/border_top2.png?v=1.1">
                            <div class="content-panel">
                                <div class="content flex-column">
                                    <img class="desc-subtitle" src="/statics/ffsm/taluo/yunshi/image/subtitle_21.png?v=1.0">                                                                        <div class="tarot-box flex-column">
                                        <div class="explan-box flex-column">
                                            <div class="explan-text1"><{$data.data.carinfo.1.c1}></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <img class="border border-bot" src="/statics/ffsm/taluo/yunshi/image/border_bot2.png?v=1.1">
                        </div><div class="content-box flex-column">
                            <img class="border border-top" src="/statics/ffsm/taluo/yunshi/image/border_top2.png?v=1.1">
                            <div class="content-panel">
                                <div class="content flex-column">
                                                                        <img class="desc-subtitle" src="/statics/ffsm/taluo/yunshi/image/subtitle_20.png?v=1.0">                                    <div class="tarot-box flex-column">
                                        <div class="explan-box flex-column">
                                            <div class="explan-text1"><{$data.data.carinfo.1.c2}></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <img class="border border-bot" src="/statics/ffsm/taluo/yunshi/image/border_bot2.png?v=1.1">
                        </div>                <div class="content-box flex-column">
                                                            <img class="title" src="/statics/ffsm/taluo/yunshi/image/cause_title.png?v=1.0">                    <img class="border border-top" src="/statics/ffsm/taluo/yunshi/image/border_top2.png?v=1.1">
                    <div class="content-panel">
                        <div class="content flex-column">
                            <div class="tarot-box flex-column">
                                <img class="card-image" src="<{$data.data.carinfo.2.img}>">
                                <div class="card-intro flex-center">
                                    <img src="/statics/ffsm/taluo/yunshi/image/num_03.png">
                                    <span>
                                        <{$data.data.carinfo.2.title}>                                        <em style="font-size: 14px;">
                                            (<{if $data.data.carinfo.2.zf==0}>逆位<{else}>正位<{/if}>)                                                                                                                                </em>
                                    </span>
                                </div>
                                <div class="explan-box flex-column">
                                                                                                            <p class="explan-title" style="line-height: 1.6;color: #9025c9;">牌面解析:</p>                                    <div class="explan-text1"><{$data.data.carinfo.2.des}></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <img class="border border-bot" src="/statics/ffsm/taluo/yunshi/image/border_bot2.png?v=1.1">
                </div>
                                                <div class="content-box flex-column">
                            <img class="border border-top" src="/statics/ffsm/taluo/yunshi/image/border_top2.png?v=1.1">
                            <div class="content-panel">
                                <div class="content flex-column">
                                    <img class="desc-subtitle" src="/statics/ffsm/taluo/yunshi/image/subtitle_30.png?v=1.0">                                                                        <div class="tarot-box flex-column">
                                        <div class="explan-box flex-column">
                                            <div class="explan-text1"><{$data.data.carinfo.2.c1}></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <img class="border border-bot" src="/statics/ffsm/taluo/yunshi/image/border_bot2.png?v=1.1">
                        </div><div class="content-box flex-column">
                            <img class="border border-top" src="/statics/ffsm/taluo/yunshi/image/border_top2.png?v=1.1">
                            <div class="content-panel">
                                <div class="content flex-column">
                                                                        <img class="desc-subtitle" src="/statics/ffsm/taluo/yunshi/image/subtitle_33.png?v=1.0">                                    <div class="tarot-box flex-column">
                                        <div class="explan-box flex-column">
                                            <div class="explan-text1"><{$data.data.carinfo.2.c2}></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <img class="border border-bot" src="/statics/ffsm/taluo/yunshi/image/border_bot2.png?v=1.1">
                        </div>
            

        </div>
      
            
        
        <{include file="./index/taluo/footer.tpl"}>

    </section>

    <div class="toast-wrap flex-center">
        <div class="toast-box flex-center">
            <span style="font-size: 14px"></span>
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
.lijics_1{background: url(/statics/ffsm/public/images/suan.png) no-repeat;}
.gengduo_1{background: url(/statics/ffsm/public/images/gengduo.png) no-repeat;}
.grzx_1{background: url(/statics/ffsm/public/images/grzx.png) no-repeat;}
</style>
    <script src="/statics/ffsm/taluo/yunshi/jquery.min.js"></script>
    <script src="/statics/ffsm/taluo/yunshi/jquery.raty.min.js"></script>
    <script type="text/javascript" src="/statics/ffsm/taluo/yunshi/zwSdk.js"></script> 
	
	<script type="text/javascript">

    //Toast
    function showToast(msg) {
        $('.toast-wrap').fadeIn();
        $('.toast-wrap span').addClass('toast');
        $('.toast-wrap span').text(msg);
        setTimeout(function () {
            $('.toast-wrap').fadeOut();
        }, 2000);
    }

    window.onscroll = function () {
        var top = document.documentElement.scrollTop || document.body.scrollTop;
        if (top > 220) {
            //$('.float_save').fadeIn();
        } else {
            //$('.float_save').fadeOut();
        }
    };
    //---保存结果---//
</script>
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
<{include file='./ffsm/footer.tpl'}>
<{include file='./ffsm/dl_ck.tpl'}>
</body>
</html>