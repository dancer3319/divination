<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>他心里有别人吗？塔罗占卜-<{$zhanming}></title>
    <style>
        * {
            margin: 0;
            padding: 0;
            border: none;
            box-sizing: border-box;
            font-family: "Helvetica Neue", Helvetica, sans-serif;
        }

        html, body {
            max-width: 640px;
            width: 100%;
            height: 100%;
            margin: 0 auto;
        }

        body {
            background-image: linear-gradient(90deg, #1f1747 20%,#32275f 80%);
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
    <link rel="stylesheet" href="/statics/ffsm/taluo/bieren/unpay_4.css">
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
        <div class="content first-content">
            <p class="desc_title">亲爱的<span>测试者</span>:</p>
            <p class="desc_title">曾经亲密的爱人，为什么变的冷淡，TA对你还是一心一意的吗？关于TA的心里有没有别人，我将根据你所选择的6张牌，给予进一步指引…</p>
            <div class="card_array">
                <img src="/statics/ffsm/taluo/bieren/img/cardcover.png?v=7.0" class="maindesc_tip2">
                <div class="taluo_card_item taluo_card1 J_testFixedShow">
                        
                        <img src="<{$data.data.carinfo.0.img}>">
                                        <p class="card-name"><{$data.data.carinfo.0.titles}></p>
                                        <span>(<{if $data.data.carinfo.0.zf==0}>逆位<{else}>正位<{/if}>)</span>
                                    </div><div class="taluo_card_item taluo_card2 ">
                                        <img src="<{$data.data.carinfo.1.img}>">
                                        <p class="card-name"><{$data.data.carinfo.1.titles}></p>
                                        <span>(<{if $data.data.carinfo.1.zf==0}>逆位<{else}>正位<{/if}>)</span>
                                    </div><div class="taluo_card_item taluo_card3 ">
                                        <img src="<{$data.data.carinfo.2.img}>">
                                        <p class="card-name"><{$data.data.carinfo.2.titles}></p>
                                        <span>(<{if $data.data.carinfo.2.zf==0}>逆位<{else}>正位<{/if}>)</span>
                                    </div><div class="taluo_card_item taluo_card4 ">
                                        <img src="<{$data.data.carinfo.3.img}>">
                                        <p class="card-name"><{$data.data.carinfo.3.titles}></p>
                                        <span>(<{if $data.data.carinfo.3.zf==0}>逆位<{else}>正位<{/if}>)</span>
                                    </div><div class="taluo_card_item taluo_card5 ">
                                        <img src="<{$data.data.carinfo.4.img}>">
                                        <p class="card-name"><{$data.data.carinfo.4.titles}></p>
                                        <span>(<{if $data.data.carinfo.4.zf==0}>逆位<{else}>正位<{/if}>)</span>
                                    </div><div class="taluo_card_item taluo_card6 ">
                                        <img src="<{$data.data.carinfo.5.img}>">
                                        <p class="card-name"><{$data.data.carinfo.5.titles}></p>
                                        <span>(<{if $data.data.carinfo.5.zf==0}>逆位<{else}>正位<{/if}>)</span>
                                    </div> 
                        
                                   </div>
            <div class="divine_box">
                <div class="price-wrap flex-column">
                    <p class="project-name flex-center" style="font-weight: bold;">咨询项目: 塔罗-他心里有别人吗？</p>
                    <div class="price-content flex-center">
                        <img src="/statics/ffsm/taluo/bieren/img/price-wall.png" class="wall">
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
                        <span>已有<em>1527138</em>人测算</span>
                        <span>好评率: <em>99.8%</em></span>
                    </div>
                </div>
            </div>
            <img src="/statics/ffsm/taluo/bieren/img/start_btn1.png" class="start-btn J_payPopupShow">
            <p class="split"></p>
        </div>
        <p class="split"></p>
        <img src="/statics/ffsm/taluo/bieren/img/border-bot.png" class="borderimg borderBottom">
    </div>

    <img src="/statics/ffsm/taluo/bieren/img/previewtitle.png" class="tipstitle">

    <div class="contentbox">
        <img src="/statics/ffsm/taluo/bieren/img/border-top.png" class="borderimg borderTop">
        <div class="content">
            <div class="first-item-box">
                <div class="first-item">
                    <img src="/statics/ffsm/taluo/bieren/img/navt_01.png" class="question">
                    <div class="taluobox">
                        <img src="<{$data.data.carinfo.0.img}>" class="taluo_card">
                        <p class="taluo_name">
                            <img src="/statics/ffsm/taluo/bieren/img/c1.png" class="taluo_cardidx">
                            <{$data.data.carinfo.0.titles}>                            <span>
                                &nbsp;(<{if $data.data.carinfo.0.zf==0}>逆位<{else}>正位<{/if}>)                            </span>
                        </p>
                        <p class="item_title">象征意义:</p>
                        <p class="taluo_desc"><{$data.data.carinfo.0.des|truncate:20:"...":true}></p>
                        <p class="item_title">牌面理解:</p>
                        <p class="taluo_desc"><{$data.data.carinfo.0.content|truncate:40:"...":true}></p>
                    </div>
                    <div class="blur-wrap">
                        <img src="/statics/ffsm/taluo/bieren/img/blurry01.png" class="blur_img">
                        <img src="/statics/ffsm/taluo/bieren/img/unlock.png" data-no="1"
                             class="views start-btn-mid J_payPopupShow">
                    </div>
                </div>
            </div>
            <p class="split"></p>
        </div>
        <img src="/statics/ffsm/taluo/bieren/img/border-bot.png" class="borderimg borderBottom">
    </div>

    <div class="contentbox">
        <img src="/statics/ffsm/taluo/bieren/img/border-top.png" class="borderimg borderTop">
        <div class="content">
            <div class="items-box">
                <img src="/statics/ffsm/taluo/bieren/img/navt_02.png" class="items-title">
                <img src="<{$data.data.carinfo.1.img}>" class="tarot_card">
                <p class="tarot_name">
                    <img src="/statics/ffsm/taluo/bieren/img/c2.png" class="taluo_cardidx">
                    &nbsp;<{$data.data.carinfo.1.titles}>                    <span>
                        &nbsp;(<{if $data.data.carinfo.1.zf==0}>逆位<{else}>正位<{/if}>)                    </span>
                </p>
                <div class="blur-box">
                    <img src="/statics/ffsm/taluo/bieren/img/blurry02.png" class="blur_img">
                    <div class="blur-content">
                        <ul class="list_wrap">
                            <li class="list"><img src="/statics/ffsm/taluo/bieren/img/point.png"><span>TA对你是什么感觉？</span>
                            </li>
                            <li class="list"><img src="/statics/ffsm/taluo/bieren/img/point.png"><span>你们之间存在什么问题？</span>
                            </li>
                        </ul>
                        <img src="/statics/ffsm/taluo/bieren/img/unlock.png" data-no="2"
                             class="views start-btn-mid J_payPopupShow">
                    </div>
                </div>
            </div>
            <p class="split"></p>
        </div>
        <p class="split"></p>
        <img src="/statics/ffsm/taluo/bieren/img/border-bot.png" class="borderimg borderBottom">
    </div>

    <div class="contentbox">
        <img src="/statics/ffsm/taluo/bieren/img/border-top.png" class="borderimg borderTop">
        <div class="content">
            <div class="items-box">
                <img src="/statics/ffsm/taluo/bieren/img/navt_03.png" class="items-title">

                <img src="<{$data.data.carinfo.2.img}>" class="tarot_card">
                <p class="tarot_name">
                    <img src="/statics/ffsm/taluo/bieren/img/c3.png" class="taluo_cardidx">
                    &nbsp;<{$data.data.carinfo.2.titles}>                    <span>
                        &nbsp;(<{if $data.data.carinfo.2.zf==0}>逆位<{else}>正位<{/if}>)                    </span>
                </p>
                <div class="blur-box">
                    <img src="/statics/ffsm/taluo/bieren/img/blurry03.png" class="blur_img">
                    <div class="blur-content">
                        <ul class="list_wrap">
                            <li class="list"><img src="/statics/ffsm/taluo/bieren/img/point.png"
                                                  alt=""><span>TA心里有你吗？</span></li>
                            <li class="list"><img src="/statics/ffsm/taluo/bieren/img/point.png"
                                                  alt=""><span>TA为什么越来越冷淡？</span></li>
                        </ul>
                        <img src="/statics/ffsm/taluo/bieren/img/unlock.png" data-no="3"
                             class="views start-btn-mid J_payPopupShow">
                    </div>
                </div>
            </div>
            <p class="split"></p>
        </div>
        <p class="split"></p>
        <img src="/statics/ffsm/taluo/bieren/img/border-bot.png" class="borderimg borderBottom">
    </div>

    <div class="contentbox">
        <img src="/statics/ffsm/taluo/bieren/img/border-top.png" class="borderimg borderTop">
        <div class="content">
            <div class="items-box">
                <img src="/statics/ffsm/taluo/bieren/img/navt_04.png" class="items-title">
                <img src="<{$data.data.carinfo.3.img}>" class="tarot_card">
                <p class="tarot_name">
                    <img src="/statics/ffsm/taluo/bieren/img/c4.png" class="taluo_cardidx">
                    &nbsp;<{$data.data.carinfo.3.titles}>                    <span>
                        &nbsp;(<{if $data.data.carinfo.3.zf==0}>逆位<{else}>正位<{/if}>)                    </span>
                </p>
                <div class="blur-box">
                    <img src="/statics/ffsm/taluo/bieren/img/blurry04.png" class="blur_img">
                    <div class="blur-content">
                        <ul class="list_wrap">
                            <li class="list"><img src="/statics/ffsm/taluo/bieren/img/point.png"
                                                  alt=""><span>TA心里是否有了别人？</span></li>
                            <li class="list"><img src="/statics/ffsm/taluo/bieren/img/point.png"
                                                  alt=""><span>究竟是什么让你不安？</span></li>
                        </ul>
                        <img src="/statics/ffsm/taluo/bieren/img/unlock.png" data-no="4"
                             class="views start-btn-mid J_payPopupShow">
                    </div>
                </div>
            </div>
            <p class="split"></p>
        </div>
        <p class="split"></p>
        <img src="/statics/ffsm/taluo/bieren/img/border-bot.png" class="borderimg borderBottom">
    </div>

    <div class="contentbox">
        <img src="/statics/ffsm/taluo/bieren/img/border-top.png" class="borderimg borderTop">
        <div class="content">
            <div class="items-box">
                <img src="/statics/ffsm/taluo/bieren/img/navt_05.png" class="items-title">
                <img src="<{$data.data.carinfo.4.img}>" class="tarot_card">
                <p class="tarot_name">
                    <img src="/statics/ffsm/taluo/bieren/img/c5.png" class="taluo_cardidx">
                    &nbsp;<{$data.data.carinfo.4.titles}>                    <span>
                        &nbsp;(<{if $data.data.carinfo.4.zf==0}>逆位<{else}>正位<{/if}>)                    </span>
                </p>
                <div class="blur-box">
                    <img src="/statics/ffsm/taluo/bieren/img/blurry05.png" class="blur_img">
                    <div class="blur-content">
                        <ul class="list_wrap">
                            <li class="list"><img src="/statics/ffsm/taluo/bieren/img/point.png"
                                                  alt=""><span>你应该怎样把握这段关系？</span></li>
                            <li class="list"><img src="/statics/ffsm/taluo/bieren/img/point.png"
                                                  alt=""><span>主动出击还是矜持为佳？</span></li>
                        </ul>
                        <img src="/statics/ffsm/taluo/bieren/img/unlock.png" data-no="5"
                             class="views start-btn-mid J_payPopupShow">
                    </div>
                </div>
            </div>
            <p class="split"></p>
        </div>
        <p class="split"></p>
        <img src="/statics/ffsm/taluo/bieren/img/border-bot.png" class="borderimg borderBottom">
    </div>

    <div class="contentbox">
        <img src="/statics/ffsm/taluo/bieren/img/border-top.png" class="borderimg borderTop">
        <div class="content">
            <div class="items-box">
                <img src="/statics/ffsm/taluo/bieren/img/navt_06.png" class="items-title">
                <img src="<{$data.data.carinfo.5.img}>" class="tarot_card">
                <p class="tarot_name">
                    <img src="/statics/ffsm/taluo/bieren/img/c5.png" class="taluo_cardidx">
                    &nbsp;<{$data.data.carinfo.5.titles}>                    <span>
                        &nbsp;(<{if $data.data.carinfo.5.zf==0}>逆位<{else}>正位<{/if}>)                    </span>
                </p>
                <div class="blur-box">
                    <img src="/statics/ffsm/taluo/bieren/img/blurry06.png" class="blur_img">
                    <div class="blur-content">
                        <ul class="list_wrap">
                            <li class="list"><img src="/statics/ffsm/taluo/bieren/img/point.png"
                                                  alt=""><span>专业占卜师建议</span></li>
                            <li class="list"><img src="/statics/ffsm/taluo/bieren/img/point.png"
                                                  alt=""><span>让你占据TA的心！</span></li>
                        </ul>
                        <img src="/statics/ffsm/taluo/bieren/img/unlock.png" data-no="6"
                             class="views start-btn-mid J_payPopupShow">
                    </div>
                </div>
            </div>
            <p class="split"></p>
        </div>
        <p class="split"></p>
        <img src="/statics/ffsm/taluo/bieren/img/border-bot.png" class="borderimg borderBottom">
    </div>

    <div class="contentbox">
        <img src="/statics/ffsm/taluo/bieren/img/border-top.png" class="borderimg borderTop">
        <div class="content">
            <div class="items-box">
            <img src="/statics/ffsm/taluo/bieren/img/navt07.png" class="items-title">
            <img src="/statics/ffsm/taluo/bieren/img/angel_card.png" class="tarot_card">
            <p class="taluo_desc">你召唤了一位大天使，他正将神奇的力量注入你的精神力，他将守护你的是...</p>
            <div class="blur-box">
                <img src="/statics/ffsm/taluo/bieren/img/blurry07.png" class="blur_img">
                <div class="blur-content" style="justify-content: center">
                    <img src="/statics/ffsm/taluo/bieren/img/unlock.png" data-no="7"
                         class="views start-btn-mid J_payPopupShow">
                </div>
            </div>
            <p class="lasttitle">~珍藏大天使牌，为你守护幸福~</p>
        </div>
            <p class="split"></p>
        </div>
        <p class="split"></p>
        <img src="/statics/ffsm/taluo/bieren/img/border-bot.png" class="borderimg borderBottom">
    </div>

    <div class="contentbox">
        <div class="content">
            <img src="/statics/ffsm/taluo/bieren/img/border-top.png" class="borderimg borderTop">
            <div class="miao-box abslout-box">
                <p class="comment-title flex-center">已为超过<em>12万</em>人提供情感指引</p>
                <div class="detail-data flex-row">
                    <span class="person-count flex-row">已测算人数:<em>123343</em></span>
                    <span class="rate-num flex-row"><img src="/statics/ffsm/taluo/bieren/img/emoji.png">好评率:<em>99.8%</em></span>
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
                                <p class="detail">感觉还是蛮准的，和男朋友目前处于这种阶段</p>
                            </li><li>
                                <p class="user">匿名</p>
                                <p class="detail">其实我本来只是抱着玩玩的心态来试试……没想到结果竟然出乎我意料地准……有点想哭。</p>
                            </li><li>
                                <p class="user">匿名</p>
                                <p class="detail">说的是我心里所希望所明白也不敢直视的，好评</p>
                            </li><li>
                                <p class="user">匿名</p>
                                <p class="detail">天哪…每一句都是正确的！我现在的状态就是这样！迷茫不解…真的稍有不慎，可能这段感情就会就此断送了吧</p>
                            </li><li>
                                <p class="user">兔先生</p>
                                <p class="detail">找到问题所在，问题所在，可以利用直觉直觉，谢谢，我知道怎么做了</p>
                            </li><li>
                                <p class="user">匿名</p>
                                <p class="detail">总的感觉还是挺准确的，其实有些问题自己是想到过的，只是当局者迷，需要一个外界的指引。</p>
                            </li><li>
                                <p class="user">可先生</p>
                                <p class="detail">真的很准，钱没有白花，一开始的时候确实很犹豫，结果真的是很准，真的很棒。</p>
                            </li><li>
                                <p class="user">重先生</p>
                                <p class="detail">出乎意料的准确，正好符合现状，感谢指引和协助</p>
                            </li><li>
                                <p class="user">先生</p>
                                <p class="detail">前面的解释真的好准！我以前也在其他占卜师占卜过，说我和她的沟通有问题，我会寻找正确的道路的！</p>
                            </li><li>
                                <p class="user">裴**先生</p>
                                <p class="detail">非常不错！90%准确率高！！~</p>
                            </li><li>
                                <p class="user">将**先生</p>
                                <p class="detail">感觉占的很准，如果还想再占一卦该从哪里进入？</p>
                            </li><li>
                                <p class="user">Ang*先生</p>
                                <p class="detail">塔罗牌我以前从不信，可是算了几次都蛮准的，不得不信！</p>
                            </li><li>
                                <p class="user">将**先生</p>
                                <p class="detail">开始是试试的态度，测了之后的确挺准的，希望我的爱情更好</p>
                            </li><li>
                                <p class="user">汤**先生</p>
                                <p class="detail">有些明白自己是怎么回事了，结婚这么多年没能给她想要的生活，一直让她陪我吃苦还欠下好多外债，这使我恐慌</p>
                            </li><li>
                                <p class="user">刘**先生</p>
                                <p class="detail">很准的。我非常满意，我会安照这牌上的指引把自己做的更好更加出色，去吸引他让他回心转意。</p>
                            </li><li>
                                <p class="user">刘**先生</p>
                                <p class="detail">挺准的，判断性格和情况都挺到位，有茅塞顿开的感觉，</p>
                            </li><li>
                                <p class="user">汤**先生</p>
                                <p class="detail">分析的很准确到位，钱没白花</p>
                            </li><li>
                                <p class="user">雷**先生</p>
                                <p class="detail">目前现状是这样的，的确是异地恋，有之前的人掺和进来，也就是第三者</p>
                            </li><li>
                                <p class="user">孙**先生</p>
                                <p class="detail">感谢您的分析！很到位！我会按照您所说的去做！</p>
                            </li><li>
                                <p class="user">钱**先生</p>
                                <p class="detail">太准了！以后不能看轻塔罗牌了！</p>
                            </li><li>
                                <p class="user">刘**先生</p>
                                <p class="detail">确实很准确，对应我现在的状况，描述的非常贴近，满意！</p>
                            </li><li>
                                <p class="user">秦**先生</p>
                                <p class="detail">很符合现在的状态 至少值得花这个钱
</p>
                            </li><li>
                                <p class="user">白先生</p>
                                <p class="detail">解析到点子上了，正如解析一样暂时的离别只是为了以后的相伴，是我的跑不了。</p>
                            </li><li>
                                <p class="user">豆先生</p>
                                <p class="detail">其实一开始我并不认为会怎么样，也是玩玩的心态进来的，但是看了分析以后，很惊讶也很震惊，还是蛮准确的，</p>
                            </li><li>
                                <p class="user">瑞先生</p>
                                <p class="detail">说的的确都是内心里想表达又表现不出来的想法，很真实，</p>
                            </li><li>
                                <p class="user">雪先生</p>
                                <p class="detail">我相信牌会为我带来神奇的力量，一定会的！</p>
                            </li><li>
                                <p class="user">裴**先生</p>
                                <p class="detail">第一次用塔罗牌测试，但是结果却是非常满意，而且确实很准！</p>
                            </li><li>
                                <p class="user">刘**先生</p>
                                <p class="detail">各张牌都很符合现在的状况，也给出了很接近的答案。挺准</p>
                            </li><li>
                                <p class="user">刁*女士</p>
                                <p class="detail">测算的内容很详细很有用，希望能帮我走出感情困境！</p>
                            </li><li>
                                <p class="user">汤**先生</p>
                                <p class="detail">还可以，比之前测过其他家的好很多，当下感情遇到的阻碍跟我本身很匹配！比较推荐！
</p>
                            </li><li>
                                <p class="user">马**女士</p>
                                <p class="detail">无意间点进来的，忍不住好奇心就测了。emmm…真的蛮准的，性价比很高！
</p>
                            </li><li>
                                <p class="user">刘**先生</p>
                                <p class="detail">解说详细，内容令人信服！
</p>
                            </li><li>
                                <p class="user">洪*女士</p>
                                <p class="detail">内容很多，感觉都快有1w字了。
</p>
                            </li><li>
                                <p class="user">石*先生</p>
                                <p class="detail">内容上比较有针对性,也很容易懂,不会很文绉绉的,比较直白。</p>
                            </li><li>
                                <p class="user">王*女士</p>
                                <p class="detail">还行，比之前的好多占卜详细很多，也得到了一些有用的建议！
</p>
                            </li><li>
                                <p class="user">高**女士</p>
                                <p class="detail">内容有当前感情状态、原因、你内心的真实想法，同时也有对应的化解方法，个人觉得非常实用准确，推荐！
</p>
                            </li><li>
                                <p class="user">雷*先生</p>
                                <p class="detail">跟简介很匹配，想看的都看到了，希望能突破当前的局势，化解和她之间的矛盾。
</p>
                            </li><li>
                                <p class="user">孙*先生</p>
                                <p class="detail">我是朋友介绍过来的，没想到这么不错，说的很准！强烈推荐！！！非常感谢我的朋友~
</p>
                            </li><li>
                                <p class="user">何*女士</p>
                                <p class="detail">准！原来最近跟男朋友一直吵架的原因竟然是这样！！不说了我要赶紧去哄他了
</p>
                            </li><li>
                                <p class="user">钱*先生</p>
                                <p class="detail">很专业，很详细，另外再说一句！！！真得挺准```
</p>
                            </li><li>
                                <p class="user">李*先生</p>
                                <p class="detail">女朋友心里满满的都是我！这次误会解除，我就向她求婚！
</p>
                            </li><li>
                                <p class="user">周*女士</p>
                                <p class="detail">喜欢他好几年了都没被善待，看来果然不应该再坚持了。很实用，感谢！
</p>
                            </li><li>
                                <p class="user">秦*女士</p>
                                <p class="detail">准！比较详细，我喜欢这种不模棱两可的，比较直接。不过有一些细节不是很深入，想找老师帮忙再详细算一遍。
</p>
                            </li>                    </ul>
                </div>
            </div>
            <img src="/statics/ffsm/taluo/bieren/img/border_bot.png" class="borderimg borderBottom">
        </div>
    </div>
    <div style="height: 2.3rem;"></div>
</div>
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