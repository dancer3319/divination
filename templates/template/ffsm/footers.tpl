<link href="/statics/quanju.css" rel="stylesheet" type="text/css"/>
<!--<a class="tuiguang_1" href="?ac=tuiguang"><em>赚取佣金</em></a>-->
<!--顶部文字提醒内容-->
<script>
window.requestAnimFrame = (function(){
    return  window.requestAnimationFrame ||
    window.webkitRequestAnimationFrame ||
    window.mozRequestAnimationFrame ||
    function( callback ){
        window.setTimeout(callback, 1000 / 60);
    };
})();
$('#alertMarquee').each(function(){
    $('.contents').addClass('has-alert-marquee');

    var $this = $(this);
    var $cont = $this.find('.inner');
    var w = $this.width();
    var sw = w + $cont.width();
    var n = w / 375 * 1;
    var i = 0;
    var movingFn = function(){
        i = i + n;
        if(i > sw){
            i = 0;
        }
        $cont.css({'margin-left': -i });
        window.requestAnimFrame(movingFn)
    }
    window.requestAnimFrame(movingFn)
});
</script>
<!--百度统计代码-->
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?<{$tongjidm}>";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>