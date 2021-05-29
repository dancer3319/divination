<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=0">
    <title>2021年星座运势分析_十二星座-<{$zhanming}></title>
	<{include file='./ffsm/wx_share.tpl'}>
    <link rel="stylesheet" href="/statics/ffsm/xingzuo/css/common.css">
    <link rel="stylesheet" href="/statics/ffsm/xingzuo/css/interim.css">
    <script type="text/javascript" src="/statics/ffsm/xingzuo/css/rem.js"></script>
</head>

<body>
<section class="page">
    <section class="main-wrap flex-column">
        <div class="banner-wrap flex-column">
            <img class="banner" src="/statics/ffsm/xingzuo/img/banner.png">
        </div>
        <div class="owner-wrap flex-column">
            <span class="owner flex-center"><em><{$row.data.xz}></em>的</span>
            <span class="owner-2 flex-center">2021运势分析</span>
        </div>

        <ul class="items flex-column">
            <li class="item item-1 flex-center"><img class="icon interim" src="/statics/ffsm/xingzuo/img/wait_icon.png"><span>星座基础分析中&emsp;</span></li>
            <li class="item item-2 flex-center"><img class="icon interim" src="/statics/ffsm/xingzuo/img/wait_icon.png"><span>爱情运势分析中&emsp;</span></li>
            <li class="item item-3 flex-center"><img class="icon interim" src="/statics/ffsm/xingzuo/img/wait_icon.png"><span>财富运势分析中&emsp;</span></li>
            <li class="item item-4 flex-center"><img class="icon interim" src="/statics/ffsm/xingzuo/img/wait_icon.png"><span>事业运势分析中&emsp;</span></li>
        </ul>
        <span class="over-text flex-center" style="display: none">分析完毕, 生成报告中...</span>
    </section>
</section>

</body>

<script type="text/javascript" src="/statics/ffsm/xingzuo/css/jquery.min.js"></script>
<script type="text/javascript" src="/statics/ffsm/xingzuo/css/zwSdk.js"></script>
<script>
    $(document).ready(function () {
        setTimeout(function () {
            $('.item-1 .icon').removeClass('interim');
            $('.item-1 .icon').attr('src', '/statics/ffsm/xingzuo/img/over_icon.png');
            $('.item-1 span').text('星座基础分析完成');
            setTimeout(function () {
                $('.item-2 .icon').removeClass('interim');
                $('.item-2 .icon').attr('src', '/statics/ffsm/xingzuo/img/over_icon.png');
                $('.item-2 span').text('爱情运势分析完成');
                setTimeout(function () {
                    $('.item-3 .icon').removeClass('interim');
                    $('.item-3 .icon').attr('src', '/statics/ffsm/xingzuo/img/over_icon.png');
                    $('.item-3 span').text('财富运势分析完成');
                    setTimeout(function () {
                        $('.item-4 .icon').removeClass('interim');
                        $('.item-4 .icon').attr('src', '/statics/ffsm/xingzuo/img/over_icon.png');
                        $('.item-4 span').text('事业运势分析完成');
                        setTimeout(function () {
                            $('.over-text').fadeIn();
                            setTimeout(function () {
                                var orderId = "<{$row.oid}>";
                                var src = '1001';
                                window.location.href = "/?ac=xingzuo&oid=" + orderId+"&src="+src;
                            },1000)
                        }, 200);
                    }, 1000);
                }, 1000);
            }, 1000);
        },2000);

    });
</script>

</html>