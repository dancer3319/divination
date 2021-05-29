<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=0" />
    <title>你和TA该分手吗？塔罗占卜-<{$zhanming}></title>
    <link rel="stylesheet" href="/statics/ffsm/taluo/fenshou/common.css">
    <link rel="stylesheet" href="/statics/ffsm/taluo/fenshou/mine.css">
    <script src="/statics/ffsm/taluo/aiqing/rem_tool.js"></script>
</head>
<body>
<section class="page">
    <div class="content">
        <!-- 选牌区 -->
        <div class="part">
            <ul class="card_list"></ul>
        </div>

        <!-- 指示区 -->
        <div class="indicate flex-column">
            <div class="triangle" style="display: none"></div>
            <p class="user_hint" id="user_hint_1" style="display: none">请根据你的第一感觉抽取<em>4张牌</em></p>
            <p class="user_hint" id="user_hint_2" style="display: none">让塔罗之灵感受你的能量</p>
        </div>

        <!--接牌区-->
        <div class="ensure_box">
            <div class="ensure_card card_0">
                <div class="card-wrap flex-column">
                    <p class="card_desc flex-center"></p>
                    <div class="img-wrap">
                        <img class="ensure_img" src="/statics/ffsm/taluo/fenshou/img/cover.png">
                        <img class="ensure_back">
                    </div>
                    <p class="cardName" id="cardName1"></p>
                    <p class="directional">（正位）</p>
                </div>
            </div>
            <div class="ensure_card card_1">
                <div class="card-wrap flex-column">
                    <p class="card_desc flex-center"></p>
                    <div class="img-wrap">
                        <img class="ensure_img" src="/statics/ffsm/taluo/fenshou/img/cover.png">
                        <img class="ensure_back">
                    </div>
                    <p class="cardName" id="cardName2"></p>
                    <p class="directional">（正位）</p>
                </div>

            </div>
            <div class="ensure_card card_2">
                <div class="card-wrap flex-column">
                    <p class="card_desc flex-center"></p>
                    <div class="img-wrap">
                        <img class="ensure_img" src="/statics/ffsm/taluo/fenshou/img/cover.png">
                        <img class="ensure_back">
                    </div>
                    <p class="cardName" id="cardName3"></p>
                    <p class="directional">（正位）</p>
                </div>
            </div>
            <div class="ensure_card card_3">
                <div class="card-wrap flex-column">
                    <p class="card_desc flex-center"></p>
                    <div class="img-wrap">
                        <img class="ensure_img" src="/statics/ffsm/taluo/fenshou/img/cover.png">
                        <img class="ensure_back">
                    </div>
                    <p class="cardName" id="cardName4"></p>
                    <p class="directional">（正位）</p>
                </div>
            </div>
        </div>

        <!-- 选中区域 -->
        <div class="ensure flex-center">
            <img class="ensure_bg" src="/statics/ffsm/taluo/fenshou/img/triangle.png">
        </div>

        <!-- 描述信息 -->
        <div class="desc_text flex-column">
            <p id="desc_1" style="display: none">塔罗牌阵已准备就绪</p>
            <p id="desc_2" style="display: none">让我们来看看你和TA该分手吗？</p>
        </div>

        <!--  立即解牌 -->
        <div class="watch_btn flex-center">
            <img src="/statics/ffsm/taluo/fenshou/img/view_btn.png?v=1.1" class="view_btn" style="display: none">
        </div>
        <span class="retry-tips flex-center" style="display:none;text-decoration:underline;width: 100%;margin-top: 0.4rem;font-size: 0.55rem;color: #fae17d; cursor: pointer;">选牌时开小差了，重新选牌>></span>

    </div>
</section>
<script type="text/javascript" src="/statics/ffsm/taluo/aiqing/zwSdk-v=19041313.js"></script>
<script type="text/javascript" src="/statics/ffsm/taluo/aiqing/jquery.min.js"></script>
<script>
    var screen_height = $(window).height();
    if(screen_height>650){
        $('.desc_text').css({'margin-top': '2.5rem', 'height': '2rem'});
    }else{
        $('.desc_text').css({'margin-top': '2.5rem', 'height': '1.8rem'});
        $('.retry-tips').css({'margin-top': '0.2rem'});
    }

    // 生成牌
    for (var c = 0; c < 22; c++) {
        $(".card_list").append("<li class='move_card" + c + "'><img src='/statics/ffsm/taluo/fenshou/img/cover.png' /></li>");
        var step = -52.5+c*5;
        $(".move_card"+c).css({
            '-webkit-transform': 'rotate('+step+'deg)',
            'transform': 'rotate('+step+'deg)',
            '-webkit-animation-delay': c * 0.05 + 's',
            'animation-delay': c * 0.05 + 's'
        });
        if(c==21){
            setTimeout(function () {
                $('.triangle').fadeIn(800);
                setTimeout(function () {
                    $('#user_hint_1').fadeIn(800);
                    setTimeout(function () {
                        $('#user_hint_2').fadeIn(800);
                    },500);
                },400);
            },300);
        }
    }

    // 牌面集合
    var items = [{"image":"<{$data.data.carinfo.0.img}>","name":"<{$data.data.carinfo.0.title}>","positive":"<{if $data.data.carinfo.0.zf==0}>逆位<{else}>正位<{/if}>"},
		{"image":"<{$data.data.carinfo.1.img}>","name":"<{$data.data.carinfo.1.title}>","positive":"<{if $data.data.carinfo.1.zf==0}>逆位<{else}>正位<{/if}>"},
		{"image":"<{$data.data.carinfo.2.img}>","name":"<{$data.data.carinfo.2.title}>","positive":"<{if $data.data.carinfo.2.zf==0}>逆位<{else}>正位<{/if}>"},
		{"image":"<{$data.data.carinfo.3.img}>","name":"<{$data.data.carinfo.3.title}>","positive":"<{if $data.data.carinfo.3.zf==0}>逆位<{else}>正位<{/if}>"}];
    var length = items.length;

    // 牌面象征意义
    var symbol = ["对方想法", "感情现状", "是否分手", "塔罗指引"];

    // 选牌统计
    var count = 0;

    // 倒计时
    var num = 0, isEnd = false;
    function startTimer(text) {
        var timer = setInterval(function () {
            num++;
            if (num == 2) {
                isEnd = true;
                $(".user_hint>span").text(text);
                clearInterval(timer);
            }
        }, 600);
    }

    // 选牌过程动画
    function changeCard(li, items, selector, top, left, text, start_point) {
        // 判断用户是否已完成选择
        if (count < length) {
            var item = items[count];
            $(selector + ' .cardName').text(item['name']);
            $(selector + " .directional").text('（'+item['positive']+'）');
            $(selector + " .card_desc").text(symbol[count]);
            $(selector + " .card-wrap>div>.ensure_back").attr("src", item['image']);

            $(selector).css({"top": start_point.y + "rem", "left": start_point.x+ "rem", "margin-left": "-1.1rem", "display": "block", "z-index": 999, "-webkit-transform": "translateZ(100px)","transform": "translateZ(100px)"});

            $(selector).show();

            $(selector).animate({ top: top + "rem", left: left + "%"}, 600, function () {
                $(selector + " .card-wrap .img-wrap").addClass("turn");
                $(selector + " p").animate({opacity: 1}, 800);
            });

            // 隐藏选中牌
            $(li).hide();

            // 再次选牌
            if (count !== length) {
                count = count + 1;
                num = 0;
                isEnd = false;
                startTimer(text);
            }

            if (count == length){
                setTimeout(function () {
                    setTimeout(function () {
                        $(".card_list").fadeOut(200);
                    },100);
                    $(".content").animate({ top: '-6.5rem' }, "slow", function () {
                        setTimeout(function () {
                            $(".desc_text").css({display: 'flex', display: '-webkit-flex'});
                            $(".watch_btn").css({display: 'flex', display: '-webkit-flex'});
                            $('#desc_1').fadeIn(800);
                            setTimeout(function () {
                                $('#desc_2').fadeIn(800);
                                setTimeout(function () {
                                    $(".view_btn").fadeIn(1000);
                                    setTimeout(function () {
                                        $('.retry-tips').fadeIn(400);
                                    }, 400)
                                },400);
                            },400);
                        },100);
                    });
                }, (1200));
            }
        }
    }

    // 选牌
    $(".card_list>li").each(function () {
        var _this = $(this);
        $(this).click(function (e) {
            var empty = (clientWidthTrue-clientWidth)/2;
            var start_point = {x: (e.clientX-empty)/value, y:e.clientY/value};
            if (count == 0) {
                changeCard(_this, items, ".card_0", 6.8, 50, "2", start_point);
            } else if (count == 1) {
                if (isEnd == true) {
                    changeCard(_this, items, ".card_1", 10.5, 16, "3", start_point);
                }
            } else if (count == 2) {
                if (isEnd == true) {
                    changeCard(_this, items, ".card_2", 10.5, 84, "4", start_point);
                }
            } else{
                if (isEnd == true) {
                    changeCard(_this, items, ".card_3", 14, 50.5, "4", start_point);
                }
            }
        });
    });

    // 查看结果
    $('.view_btn').click(function(){
        try{
            MtaH5.clickStat('hetafenshou',{'lijijiepai':'true'});
        }catch(err){
            console.log(err)
        }
        window.location.href = "/?ac=taluofenshou&oid=<{$data.oid}>&pay=1";
    });
    // 重新选牌
    $('.retry-tips').click(function () {
        window.location.href = "/?ac=taluofenshou&oid=<{$data.oid}>&update=1";
    });
</script>

</body>

</html>