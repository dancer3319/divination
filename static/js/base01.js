$(function () {
	//hd
    if($('.hdwrap').size()>=1){
        jQuery(".hdwrap").slide({titCell:".hd ul",mainCell:".bd ul",autoPage:true,effect:"leftLoop",autoPlay:true,delayTime:600,interTime:3000,startFun:function (i) {
                $('.hdwrap .hd2 ul li').eq(i).addClass('on').siblings().removeClass();
        }});
        var lis = $('.hdwrap .hd ul li').size();
        $('.hdwrap .hd ul li').css('width',(100/lis) + '%');
        for(i=0;i<lis;i++){
            $('.hdwrap .hd2 ul').append('<li></li>');
        }
        $('.hdwrap .hd2 ul li').eq(0).addClass('on');
        $('.hdwrap .hd2 ul li').mouseenter(function () {
            var index = $(this).index();
            $('.hdwrap .hd ul li').eq(index).mouseenter()
        })
    }

    // 性别选择

    $('.sex_inp label').click(function () {
        $(this).addClass('on').siblings().removeClass('on')
    })


    // 获焦变色
    $('.time_c select,.name_inp .name,.birth_c input').click(function(){
        $(this).css('color','#333')
    })

    $('.details_tab a').click(function () {
        $(this).addClass('on').siblings().removeClass('on')
        $('.M3_item .item').hide().eq($(this).index()).show();
    })

})



function HomeScroll(a, b) {
    function g() {
        var g = $(window).scrollLeft(), h = $(window).scrollTop(), i = $(document).height(), j = $(window).height(),
            k = c.height(), l = d.height(), m = k > l ? f : e, n = k > l ? d : c,
            o = k > l ? c.offset().left + c.outerWidth(!0) - g : d.offset().left - c.outerWidth(!0) - g,
            p = k > l ? l : k, q = k > l ? k : l, r = parseInt(q - j) - parseInt(p - j);
        $(a + "," + b).removeAttr("style"), j > i || p > q || m > h || p - j + m >= h ? n.removeAttr("style") : j > p && h - m >= r || p > j && h - m >= q - j ? n.attr("style", "margin-top:" + r + "px;") : n.attr("style", "_margin-top:" + (h - m) + "px;position:fixed;left:" + o + "px;" + (j > p ? "top" : "bottom") + ":0;")
    }

    if ($(a).length > 0 && $(b).length > 0) {
        var c = $(a), d = $(b), e = c.offset().top, f = d.offset().top;
        $(window).resize(g).scroll(g).trigger("resize")
    }
}

// $(function () {
//     HomeScroll(".Min3_L", ".Min3_R");
// })


$(function () {
    //运势切换
    var on = '今日';
    var xz = 'by';
    var name = '白羊';

    function  show(on,xz,name) {
        $('.ys_item .tab_item').hide();
        var wrap =  $('.ys_item .tab_item[data-day='+on+']')
        var lis = $('.xz_item ul .'+ xz +'').attr('val')
        wrap.fadeIn();
        wrap.find('.item').hide();
        wrap.find('.item').eq(lis-1).show();
        $('.xz_tx .tx_img .sign').attr('class','sign ' + xz);
        $('.xz_tx  .name').html(name +'座');
    }
    show(on,xz,name)

    $('.zxtab_top span').click(function(){
         on = $(this).attr('data-on');
        $(this).addClass('on').siblings().removeClass('on');
        show(on,xz,name)

    })
    //星座选择
    $('.xz_tx>p,.xz_tx .tx_img,.xz_tx .name').click(function () {
        $('.xz_tx .xz_item').slideDown();
    })
    $('.xz_tx .xz_item ul li').click(function () {
           name = $(this).find('em').html();
             xz = $(this).attr('class');
         show(on,xz,name)
        $('.xz_tx .xz_item').slideUp();
    })

})



//支付方式

$('.pay_item .label').click(function(){
    $(this).addClass('on').siblings().removeClass('on')
})

function b() {
    t = parseInt(x.css('top'));
    y.css('top', '80px');
    x.animate({
        top: t - 40 + 'px'
    }, 'slow');
    if(Math.abs(t) == h - 40) {
        y.animate({
            top: '0px'
        }, 'slow');
        z = x;
        x = y;
        y = z;
    }
    setTimeout(b, 3000);
}
jQuery(document).ready(function() {
    jQuery('.lis_2').html(jQuery('.lis_1').html());
    x = jQuery('.lis_1');
    y = jQuery('.lis_2');
    h = jQuery('.lis_1 p').length * 40;
    setTimeout(b, 3000);

})

// 手相图解
$('.shouxiang .tab_top p').click(function () {
    $(this).addClass("on").siblings().removeClass("on");
    $(".shouxiang .tab_wrap .list").hide().eq($(this).index()).show();
})

//指纹
$('.zhiwen_wrap .lis label').click(function () {
    $(this).addClass('on').siblings().removeClass('on');
})

//
$('select').focus(function () {
    $(this).css('color','#333')
})
$('.name_cs input').focus(function () {
    $(this).css("color","#333")
})
$('.btn.pd-btn').click(function () {
    $('.mengban, .Tipsbox').fadeIn();
})
$('.Tipsbox .closbtn').click(function () {
    $('.mengban, .Tipsbox').fadeOut();
})
//日期弹窗
if($('#birthday').size()>=1){var date1 = new ruiDatepicker().init('#birthday');}
if($('#birthday2').size()>=1){var date2 = new ruiDatepicker().init('#birthday2');}
if($('#birthday3').size()>=1){var date3 = new ruiDatepicker().init('#birthday3');}

//加载更多
var gpage = 1;
function addMore(flag){

    for(var i=5*gpage;i<5*(Number(gpage)+1);i++){

        if(i<30){
            $(".M3_item .lis").eq(i).css("display","block");
        }else{
            $("#gadd").html("加载完成!");
            return;
        }
    }
    gpage ++;
}


//首页通栏

$('.tl_item .prev').click(function () {
    $('.tl_item ul').prepend( $('.tl_item .box ul li:last-child'))
    $('.tl_item .box ul').css('margin-left','-305px');
    $('.tl_item .box ul').stop().animate({'margin-left':'0'})
})
$('.tl_item .next').click(function () {
    $('.tl_item .box ul').stop().animate({'margin-left':'-305px'},function () {
        $('.tl_item ul li:first-child').appendTo( $('.tl_item .box ul'))
        $('.tl_item .box ul').css('margin-left','0')
    })
})

