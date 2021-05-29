var scrollArea = document.getElementsByClassName('upto-wrap')[0];
var li = scrollArea.getElementsByTagName("li");
// 单行滚动的高度
var font_size = 16;
if (document.documentElement.currentStyle) {
    font_size = document.documentElement.currentStyle['fontSize'];
}else {
    font_size = getComputedStyle(document.documentElement, false)['fontSize'];
}
var liHeight = li[0].offsetHeight;
for (var i = 0; i < li.length; i++) {
    li[i].style.height = liHeight + 'px';
}
scrollArea.style.height = liHeight * 3+ "px";

// 滚动的速度
var speed = 20;
var timer;
// 滚动的间隔
var delay = 2000;
scrollArea.scrollTop = 0;
scrollArea.innerHTML += scrollArea.innerHTML;
function startScroll(){
    timer = setInterval(scrollUp, speed);
    scrollArea.scrollTop++;
}
function scrollUp(){
    if(scrollArea.scrollTop % liHeight == 0){
        clearInterval(timer);
        setTimeout(startScroll, delay);
    }else{
        scrollArea.scrollTop++;
        if(scrollArea.scrollTop >= scrollArea.scrollHeight / 2){
            scrollArea.scrollTop = 0;
        }
    }
}
setTimeout(startScroll, delay);

window.onresize=function () {
    scrollArea.style.height = (li[0].offsetHeight * 3 )+ "px";
    liHeight = li[0].offsetHeight;
    scrollArea.scrollTop = scrollArea.scrollTop - scrollArea.scrollTop%liHeight;
};
