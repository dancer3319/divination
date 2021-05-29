<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=0" />
    <title>你们有机会复合吗？塔罗占卜-<{$zhanming}></title>
	<{include file='./ffsm/wx_share.tpl'}>
    <link rel="stylesheet" href="/statics/ffsm/taluo/fuhe/common.css">
    <link rel="stylesheet" href="/statics/ffsm/taluo/fuhe/watch_3.css">
    <script src="/statics/ffsm/taluo/aiqing/rem_tool.js"></script>
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
        <p class="user_hint" id="user_hint_1" style="display: none">请根据你的第一感觉抽取4张牌</p>
        <p class="user_hint" id="user_hint_2" style="display: none">让塔罗之灵感受你的能量</p>
    </div>

    <!--接牌区-->
    <div class="ensure_box">
        <div class="ensure_card card_0">
            <div class="card-wrap flex-column">
                <p class="card_desc flex-center"></p>
                <div class="img-wrap">
                    <img class="ensure_img" src="/statics/ffsm/taluo/fuhe/img/cover_c.png">
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
                    <img class="ensure_img" src="/statics/ffsm/taluo/fuhe/img/cover_c.png">
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
                    <img class="ensure_img" src="/statics/ffsm/taluo/fuhe/img/cover_c.png">
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
                    <img class="ensure_img" src="/statics/ffsm/taluo/fuhe/img/cover_c.png">
                    <img class="ensure_back">
                </div>
                <p class="cardName" id="cardName4"></p>
                <p class="directional">（正位）</p>
            </div>
        </div>
    </div>

    <!-- 选中区域 -->
    <div class="ensure flex-center">
        <img class="ensure_bg" src="/statics/ffsm/taluo/fuhe/img/triangle.png">
    </div>

    <!-- 描述信息 -->
    <div class="desc_text flex-column">
        <p id="desc_1" style="display: none">塔罗牌阵已准备就绪</p>
        <p id="desc_2" style="display: none">让我们来看看你们是否还能复合？</p>
    </div>

    <!--  立即解牌 -->
    <div class="watch_btn flex-center">
        <img src="/statics/ffsm/taluo/fuhe/img/view.png" class="view_img" style="display: none">
    </div>
    <span class="retry-tips flex-center" style="display:none;text-decoration:underline;width: 100%;margin-top: 0.4rem;font-size: 18px;color: #fae17d; cursor: pointer;">选牌时开小差了，重新选牌>></span>

<script type="text/javascript" src="/statics/ffsm/taluo/aiqing/zwSdk-v=19041313.js"></script>
<script type="text/javascript" src="/statics/ffsm/taluo/aiqing/jquery.min.js"></script>
<script>
        var screen_height = $(window).height();
        if(screen_height>650){
            $('.desc_text').css({'margin-top': '2.4rem', 'height': '2rem'});
        }else{
            $('.desc_text').css({'margin-top': '2rem', 'height': '1.8rem'});
        }
        var tarots = [{"image":"<{$data.data.carinfo.0.img}>","name":"<{$data.data.carinfo.0.title}>","positive":"<{if $data.data.carinfo.0.zf==0}>逆位<{else}>正位<{/if}>"},
		{"image":"<{$data.data.carinfo.1.img}>","name":"<{$data.data.carinfo.1.title}>","positive":"<{if $data.data.carinfo.1.zf==0}>逆位<{else}>正位<{/if}>"},
		{"image":"<{$data.data.carinfo.2.img}>","name":"<{$data.data.carinfo.2.title}>","positive":"<{if $data.data.carinfo.2.zf==0}>逆位<{else}>正位<{/if}>"},
		{"image":"<{$data.data.carinfo.3.img}>","name":"<{$data.data.carinfo.3.title}>","positive":"<{if $data.data.carinfo.3.zf==0}>逆位<{else}>正位<{/if}>"}];
        // 后退强制刷新
        $(function () {
            // create_list();
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
            $(".card_list").append("<li class='move_card" + c + "'><img src='/statics/ffsm/taluo/fuhe/img/cover_c.png' /></li>");
            var step = -52.5+c*5;
            $(".move_card"+c).css({'transform': 'rotate('+step+'deg)','-webkit-transform': 'rotate('+step+'deg)'});
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
        //牌面代表
        var tarot_sign = ["对方想法", "感情阻碍", "复合机会", "复合指引"];
        //  接值数组
        var all = [];
        // 倒计时
        var num = 0,
            isEnd = false;
        function startTimer(ctx) {
            var timer = setInterval(function () {
                num++;
                if (num == 2) {
                    isEnd = true;
                    $(".user_hint>span").text(ctx);
                    clearInterval(timer);
                };
            }, 600);
        };

        function changeCard(li, arr, obj, topval, leftval, ctx, start_point) {
            // 判断用户是否已经选择
            if (all.length < 4) {
                var idx = all.length;
                var item = arr[idx];
                $(obj + ' .cardName').text(item['name']);//图片文字
                $(obj + " .directional").text('（'+item['positive']+'）');
                $(obj + " .card_desc").text(tarot_sign[idx]);

                $(obj + " .card-wrap>div>.ensure_back").attr("src", item['image']);
                all.push(item);
                $(obj).css({"top": start_point.y + "rem", "left": start_point.x+ "rem", "margin-left": "-1.2rem", "display": "block", "z-index": 9999, "-webkit-transform": "translateZ(100px)","transform": "translateZ(100px)"});
                $(obj).show();
                var position = { top: topval + "rem", left: leftval + "%"};
                $(obj).animate(position, 600, function () {
                    $(obj + " .card-wrap .img-wrap").addClass("turn");
                    $(obj + " p").animate({opacity: 1}, 800);
                });
                // 再次选牌
                if (all.length !== 5) {
                    // 隐藏选中牌及牌列表
                    $(li).hide();
                    num = 0;
                    isEnd = false;
                    startTimer(ctx);
                };
                // 如果是第四次选牌后
                if (all.length == 4) {
                    // 相关显示
                    setTimeout(function () {
                        setTimeout(function () {
                            $(".card_list").fadeOut(200);
                        },100);
                        $(".main-content").animate({ top: '-6.2rem' }, "slow", function () {
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
                            },100)
                        });
                    }, (1200))

                };
            };
        };
        // 选牌
        $(".card_list>li").each(function () {
            var _this = $(this);
            $(this).click(function (e) {
                var empty = (clientWidthTrue-clientWidth)/2;
                var start_point = {x: (e.clientX-empty)/value, y:e.clientY/value};
                if (all.length == 0) {
                    changeCard(_this, tarots, ".card_0", 6.6, 50, "2", start_point);
                } else if (all.length == 1) {
                    // 判断动画是否执行完毕
                    if (isEnd == true) {
                        changeCard(_this, tarots, ".card_1", 10.5, 16, "3", start_point);
                    };
                } else if (all.length == 2) {
                    if (isEnd == true) {
                        changeCard(_this, tarots, ".card_2", 10.5, 84, "4", start_point);
                    };
                } else if (all.length == 3) {
                    if (isEnd == true) {
                        changeCard(_this, tarots, ".card_3", 14.4, 50, "4", start_point);
                    };
                } else {
                    console.log(all);
                }
            });
        });

        $('.watch_btn').click(function(){
            try{
                MtaH5.clickStat('fuhe1089',{'lijijiepai':'true'});
            }catch(err){
                console.log(err)
            }
            window.location.href = "/?ac=taluofuhe&oid=<{$data.oid}>&pay=1";
        });
        // 重新选牌
        $('.retry-tips').click(function () {
            window.location.href = "/?ac=taluofuhe&oid=<{$data.oid}>&update=1";
        });
    </script>

</div>
</body>
</html>