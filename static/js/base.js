$(function () {
	//hd
    if($('.hdwrap').size()>=1){
        jQuery(".hdwrap").slide({titCell:".hd ul",mainCell:".bd ul",autoPage:true,effect:"leftLoop",autoPlay:true,delayTime:600,interTime:3000});
        var lis = $('.hdwrap .hd ul li').size();
        $('.hdwrap .hd ul li').css('width',(100/lis) + '%');
    }

    // 性别选择

    $('.sex_inp label').click(function () {
        $(this).addClass('on').siblings().removeClass('on')
    })

    // 获焦变色
    $('.time_c select,.name_inp .name,.birth_c input').click(function(){
        $(this).css('color','#333')
    })
    //运势切换
    $('.zxtab_top span').click(function(){
        $(this).addClass('on').siblings().removeClass('on');
        $('.ys_item .tab_item .item').hide().eq($(this).index()).show();
    })
    //星座选择
    $('.xz_tx>p,.xz_tx .tx_img,.xz_tx .name').click(function () {
        $('.xz_tx .xz_item').slideDown();
    })
    $('.xz_tx .xz_item ul li').click(function () {
        var xz = $(this).find('em').html();
        var class_ = $(this).attr('class');
        $('.xz_tx .tx_img .sign').attr('class','sign ' + class_);
        $('.xz_tx  .name').html(xz +'座');
        $('.xz_tx .xz_item').slideUp();
    })


    //日期非ie

    function myBrowser(){
        var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
        if (userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera) {
            return "IE";
        };
    }
//以下是调用上面的函数

    if (!!window.ActiveXObject || "ActiveXObject" in window){
        //ie
    }else{
        for(var i=0,max=$('.Js_date').length;i<max;i++){
            var calendar1 = new lCalendar().init('#'+$('.Js_date').eq(i).attr('id'));
        }
    }

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

$(function () {
    HomeScroll(".Min3_L", ".Min3_R");
})
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