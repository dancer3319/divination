<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" />
    <title>他心里有别人吗？塔罗占卜-<{$zhanming}></title>
    <script src="/statics/ffsm/taluo/aiqing/rem_tool.js"></script>
    <link rel="stylesheet" href="/statics/ffsm/taluo/bieren/common.css">
    <link rel="stylesheet" href="/statics/ffsm/taluo/bieren/watch_4.css">
</head>
<body>
<div class="main-content">
    <!-- 选牌区 -->
    <div class="part">
        <ul class="card_list"></ul>
    </div>

    <!-- 指示区 -->
    <div class="indicate flex-column">
        <div class="triangle" style="display: none"></div>
        <p class="user_hint" id="user_hint_1" style="display: none">请根据你的第一感觉抽取6张牌</p>
        <p class="user_hint" id="user_hint_2" style="display: none">让塔罗之灵感受你的能量</p>
    </div>

    <!--接牌区-->

    <div class="wall flex-center">
        <div class="ensure_box">
            <div class="ensure_card card_0">
                <div>
                    <img class="ensure_img" src="/statics/ffsm/taluo/bieren/img/card.png">
                    <img class="ensure_back">
                </div>
                <p class="introCard"></p>
            </div>
            <div class="ensure_card card_1">
                <div>
                    <img class="ensure_img" src="/statics/ffsm/taluo/bieren/img/card.png">
                    <img class="ensure_back">
                </div>
                <p class="introCard"></p>
            </div>
            <div class="ensure_card card_2">
                <div>
                    <img class="ensure_img" src="/statics/ffsm/taluo/bieren/img/card.png">
                    <img class="ensure_back">
                </div>
                <p class="introCard"></p>
            </div>
            <div class="ensure_card card_3">
                <div>
                    <img class="ensure_img" src="/statics/ffsm/taluo/bieren/img/card.png">
                    <img class="ensure_back">
                </div>
                <p class="introCard"></p>
            </div>
            <div class="ensure_card card_4">
                <div>
                    <img class="ensure_img" src="/statics/ffsm/taluo/bieren/img/card.png">
                    <img class="ensure_back">
                </div>
                <p class="introCard"></p>
            </div>
            <div class="ensure_card card_5">
                <div>
                    <img class="ensure_img" src="/statics/ffsm/taluo/bieren/img/card.png">
                    <img class="ensure_back">
                </div>
                <p class="introCard"></p>
            </div>
        </div>
        <div class="ensure flex-center">
            <img class="ensure_bg" src="/statics/ffsm/taluo/bieren/img/triangle.png">
            <img class="ensure_star star_1" src="/statics/ffsm/taluo/bieren/img/watch_star_1.png">
            <img class="ensure_star star_2" src="/statics/ffsm/taluo/bieren/img/watch_star_2.png">
            <img class="ensure_star star_3" src="/statics/ffsm/taluo/bieren/img/watch_star_3.png">
            <img class="ensure_star star_4" src="/statics/ffsm/taluo/bieren/img/watch_star_4.png">
            <img class="ensure_star star_5" src="/statics/ffsm/taluo/bieren/img/watch_star_5.png">
            <img class="ensure_star star_6" src="/statics/ffsm/taluo/bieren/img/watch_star_6.png">
        </div>
    </div>
    <!-- 选中区域 -->

    <!-- 描述信息 -->
    <div class="desc_text flex-column">
        <p id="desc_1" style="display: none">塔罗牌阵已准备就绪</p>
        <p id="desc_2" style="display: none">让我们来看看对方的心里是否有别人？</p>
    </div>

    <!--  立即解牌 -->
    <div class="watch_btn flex-column">
        <img src="/statics/ffsm/taluo/bieren/img/view.png" class="view_img" style="display: none">
        <span class="retry-tips flex-center" style="display:none;text-decoration:underline;width: 100%;margin-top: 0.4rem;font-size: 18px;color: #fae17d; cursor: pointer;">选牌时开小差了，重新选牌>></span>
    </div>
</div>
</body>
<script type="text/javascript" src="/statics/ffsm/taluo/aiqing/zwSdk-v=19041313.js"></script>
<script type="text/javascript" src="/statics/ffsm/taluo/aiqing/jquery.min.js"></script>
<script>
    var screen_height = $(window).height();
    if(screen_height>650){
        $('.watch_btn').css({top: '22.8rem'});
        $('.desc_text').css({top: '21rem'});
    }else{
        $('.watch_btn').css({top: '21.8rem'});
        $('.desc_text').css({top: '20rem'});
        $('.retry-tips').css({'margin-top': '0.2rem'});
    }
    var tarots = [{"image":"<{$data.data.carinfo.0.img}>","name":"<{$data.data.carinfo.0.title}>","positive":"<{if $data.data.carinfo.0.zf==0}>逆位<{else}>正位<{/if}>"},
		{"image":"<{$data.data.carinfo.1.img}>","name":"<{$data.data.carinfo.1.title}>","positive":"<{if $data.data.carinfo.1.zf==0}>逆位<{else}>正位<{/if}>"},
		{"image":"<{$data.data.carinfo.2.img}>","name":"<{$data.data.carinfo.2.title}>","positive":"<{if $data.data.carinfo.2.zf==0}>逆位<{else}>正位<{/if}>"},
		{"image":"<{$data.data.carinfo.3.img}>","name":"<{$data.data.carinfo.3.title}>","positive":"<{if $data.data.carinfo.3.zf==0}>逆位<{else}>正位<{/if}>"},
		{"image":"<{$data.data.carinfo.4.img}>","name":"<{$data.data.carinfo.4.title}>","positive":"<{if $data.data.carinfo.4.zf==0}>逆位<{else}>正位<{/if}>"},
		{"image":"<{$data.data.carinfo.5.img}>","name":"<{$data.data.carinfo.5.title}>","positive":"<{if $data.data.carinfo.5.zf==0}>逆位<{else}>正位<{/if}>"}];
    // 后退强制刷新
    $(function () {
        var isPageHide = false;
        window.addEventListener('pageshow', function () {
            if (isPageHide) {
                window.location.reload();
            }
        });
        window.addEventListener('pagehide', function () {
            isPageHide = true;
        });
    });
    

    // 生成牌
    for (var c = 0; c < 22; c++) {
        $(".card_list").append("<li class='move_card" + c + "'><img src='/statics/ffsm/taluo/bieren/img/card.png' /></li>");
        var step = -52.5+c*5;
        $(".move_card"+c).css({'transform': 'rotate('+step+'deg)','-webkit-transform': 'rotate('+step+'deg)'});
        if(c==21){
            setTimeout(function () {
                $('.triangle').fadeIn(800);
                setTimeout(function () {
                    $('#user_hint_1').fadeIn(800);
                    setTimeout(function () {
                        $('#user_hint_2').fadeIn(800);
                    },300);
                },300);
            },200);
        }
    }
    //  接值数组
    var all = [];
    // 倒计时
    var num = 0,
        isEnd = false;
    function startTimer() {
        var timer = setInterval(function () {
            num++;
            if (num == 2) {
                isEnd = true;
                clearInterval(timer);
            };
        }, 600);
    }

    function changeCard(li, arr, obj, top_val, left_val, start_point, ctx) {
        // 判断用户是否已经选择
        if (all.length < 6) {
            var idx = all.length;
            var item = arr[idx];
            $(obj + " .introCard").text(ctx);
            $(obj + ">div>.ensure_back").attr("src", item['image']);
            all.push(item);
            $(obj).css({"top": start_point.y + "rem", "left": start_point.x+ "rem", "width":"2.2rem", "margin-left": "-1.1rem", "display": "block", "z-index": 9999, "transform": "translateZ(100px)", "-webkit-transform":"translateZ(100px)"});
            $(obj).show();
            var position = { top: top_val + "rem", left: left_val + "%"};


            $(obj).animate(position, 700, function () {
                $(obj + ">div").addClass("turn");
                $(obj + " p").animate({opacity: 1}, 700);
            });

            // 再次选牌
            if (all.length !== 7) {
                // 隐藏选中牌及牌列表
                $(li).hide();
                num = 0;
                isEnd = false;
                startTimer();
            }
            // 如果是第六次选牌后
            if (all.length == 6) {
                // 相关显示
                setTimeout(function () {
                    setTimeout(function () {
                        $(".card_list").fadeOut(200);
                        $(".indicate").fadeOut(200);
                    },100);
                    $(".main-content").animate({ top: '-5.6rem' }, "1200", function () {
                        setTimeout(function () {
                            $(".desc_text").css({display: 'flex',display: '-webkit-flex'});
                            $(".watch_btn").css({display: 'flex',display: '-webkit-flex'});
                            $('#desc_1').fadeIn(800);
                            setTimeout(function () {
                                $('#desc_2').fadeIn(800);
                                setTimeout(function () {
                                    $(".view_img").fadeIn(1000);
                                    setTimeout(function () {
                                        $('.retry-tips').fadeIn(400);
                                    }, 400)
                                },400)
                            },400)
                        },200)
                    });
                }, 1200)

            }
        }
    }
    // 选牌
    $(".card_list>li").each(function () {
        var _this = $(this);
        $(this).click(function (e) {
            var empty = (clientWidthTrue-clientWidth)/2;
            var start_point = {x: (e.clientX-empty)/value, y:e.clientY/value};
            if (all.length == 0) {
                changeCard(_this, tarots, ".card_0", 6.2, 30, start_point, "你的状态");
            } else if (all.length == 1) {
                // 判断动画是否执行完毕
                if (isEnd == true) {
                    changeCard(_this, tarots, ".card_1", 6.2, 100-30, start_point, "你的不安");
                }
            } else if (all.length == 2) {
                if (isEnd == true) {
                    changeCard(_this, tarots, ".card_2", 10.7, 10.5, start_point, "冷淡原因");
                }
            } else if (all.length == 3) {
                if (isEnd == true) {
                    changeCard(_this, tarots, ".card_3", 10.7, 100-10.5, start_point, "是否变心");
                }
            } else if (all.length == 4) {
                if (isEnd == true) {
                    changeCard(_this, tarots, ".card_4", 15.2, 30, start_point, "破局之法");
                }
            } else if (all.length == 5) {
                if (isEnd == true) {
                    changeCard(_this, tarots, ".card_5", 15.2, 100-30, start_point, "未来转机");
                }
            } else {
                console.log(all);
            }
        });
    });


    $('.view_img').click(function(){
        try{
            MtaH5.clickStat('taxinlilove1078',{'lijijiepai':'true'});
        }catch(err){
            console.log(err)
        }
        window.location.href = "/?ac=taluobieren&oid=<{$data.oid}>&pay=1";
    });
    // 重新选牌
    $('.retry-tips').click(function () {
        window.location.href = "/?ac=taluobieren&oid=<{$data.oid}>&update=1";
    });
</script>

</html>