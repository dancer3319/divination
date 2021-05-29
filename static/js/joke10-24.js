function getByClass(classname, ele, tag){
    var returns = [];
    ele = ele || document;
    tag = tag || '*';
    if(ele.getElementsByClassName){
        var eles = ele.getElementsByClassName(classname);
        if(tag != '*'){
            for (var i = 0, L = eles.length; i < L; i++){
                if (eles[i].tagName.toLowerCase() == tag.toLowerCase()){
                    returns.push(eles[i]);
                }
            }
        }else{
            for(var i=0, L = eles.length; i < L; i++){
                if(eles[i].className==classname){
                   returns.push(eles[i]);  
                }  
            }
        }
    }else{
        eles = ele.getElementsByTagName(tag);
        var pattern = new RegExp("(^|\\s)"+classname+"(\\s|$)");
        for (i = 0, L = eles.length; i < L; i++){
            if (pattern.test(eles[i].className)){
               returns.push(eles[i]);
            }
        }
    }
    return returns;
}

//分享按钮
function share(aLink,title,pics){

  var site = "http://gaoxiao.114la.com/";
  // var summary = "汇集最美图片@114啦美图";//摘要
  var appkey = '2598561916';
  var dataType = aLink.getAttribute("data-cmd");
  switch(dataType){
    case 'qzone': window.open('http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url='+site+'&title='+title+'&desc='+title+'&pics='+pics+'&site='+site,'newwindow')
    break;
    case 'tsina': window.open('http://service.weibo.com/share/share.php?url='+site+'&appkey='+appkey+'&title='+title+'&pic='+pics,'newwindow');
    break;
  }
}

//添加事件
function addEvent(obj,type,fn){

  if(obj.attachEvent){
    obj.attachEvent('on'+type,fn);
  }else{
    obj.addEventListener(type,fn,false);
  }

}


// class操作
function hasClass(ele, cls) {
    return ele.className.match(new RegExp('(\\s|^)' + cls + '(\\s|$)'));
}

function addClass(ele, cls) {
    if (!hasClass(ele, cls)) {
        ele.className += ' ' + cls;
    }
}

function removeClass(ele, cls) {
    if (hasClass(ele, cls)) {
        var reg = new RegExp('(\\s|^)' + cls + '(\\s|$)'),
            newClass = ele.className.replace(reg, ' ');
        ele.className = newClass.replace(/^\s+|\s+$/g, '');
    }
}

//添加事件
function addEvent(obj,type,fn){

  if(obj.attachEvent){
    obj.attachEvent('on'+type,fn);
  }else{
    obj.addEventListener(type,fn,false);
  }

}

//获取样式
function getStyle(obj,attr){
  if(obj.currentStyle){
    return obj.currentStyle[attr];
  }else{
    return getComputedStyle(obj,false)[attr];
  }
}

//运动框架
function move(obj,json,fn){
  clearInterval(obj.timer);
  obj.timer=setInterval(function(){
    var bStop = true;
    for(attr in json){
      var iCur = 0;
      if(attr=='opacity'){
        iCur = parseInt(parseFloat(getStyle(obj,attr))*100);
      }else{
        iCur = parseInt(getStyle(obj,attr));
      }

      var iSpeed = (json[attr]-iCur)/8;
      iSpeed = iSpeed>0?Math.ceil(iSpeed):Math.floor(iSpeed);

      if(iCur!=json[attr]){
        bStop=false;
      }

      if(attr=='opacity'){
        obj.style.filter='alpha(opacity:'+(iCur+iSpeed)+')';
        obj.style.opacity=(iCur+iSpeed)/100;
      }else{
        obj.style[attr]=iCur+iSpeed+'px';
      }
    }

    if(bStop){
      clearInterval(obj.timer);
      if(fn){
        fn();
      }
    }

  },30)
}

//插入文本
function Insert(obj,str) { 
  if(document.selection) { 
    obj.focus(); 
    var sel=document.selection.createRange(); 
    document.selection.empty(); 
    sel.text = str; 
    } else { 
    var prefix, main, suffix; 
    prefix = obj.value.substring(0, obj.selectionStart); 
    main = obj.value.substring(obj.selectionStart, obj.selectionEnd); 
    suffix = obj.value.substring(obj.selectionEnd); 
    obj.value = prefix + str + suffix; 
  } 
  // obj.focus(); 
} 

//光标定位到最后一个
function moveCaretToEnd(el) {
    if (typeof el.selectionStart == "number") {
        el.selectionStart = el.selectionEnd = el.value.length;
    } else if (typeof el.createTextRange != "undefined") {
        el.focus();
        var range = el.createTextRange();
        range.collapse(false);
        range.select();
    }
}

function offsetTop( elements ){ 
  var top = elements.offsetTop; 
  var parent = elements.offsetParent; 
  while( parent != null ){ 
    top += parent.offsetTop; 
    parent = parent.offsetParent; 
  }; 
  return top; 
}; 
(function(){

	var jokeContent = document.getElementById("jokeContent");
	var fxAd = getByClass('fixedAd',jokeContent,"div")[0];
	var fxLocal = offsetTop(fxAd);
	var backTop = document.getElementById("backTop");
  var comFrom = document.getElementById("comFrom");
  var state = false;

	function scrollFn(obj,local,fn,fn2){
		var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
		if(local<scrollTop){
			if(fn)fn();
		}else{
			if(fn2)fn2();			
		}

	}


  var PreItem = null;
  addEvent(window,"scroll",function(){
      //返回顶部
        scrollFn(backTop,300,function(){
          backTop.style.display="block";
        },function(){
          backTop.style.display="none";
        });

        //广告固定
        scrollFn(fxAd,fxLocal,function(){
          var sidebarH = $(".sidebar").height();
          var mainH = $(".main").height();
          if(mainH>sidebarH){
            fxAd.style.position="fixed";
            fxAd.style.zIndex="1";
            fxAd.style.top="0";
          }
        },function(){
          fxAd.style.position="static";
        });



        //单个置顶
        var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
        var item  = $(".item");
        var curItem = null;
        for(var i =0;i<item.length;i++){
          var itemTop = offsetTop(item.get(i));
          var itemH = item.eq(i).height();
          if(scrollTop > itemTop && scrollTop < itemTop + itemH){
            curItem = item.eq(i);
            break;
          }
        }
        if(PreItem && PreItem != curItem){
          PreItem.find(".itemFr").css({
                "position":"static"
          })
        }
        PreItem = curItem;
        if(curItem){
          var itemTop = offsetTop(curItem.get(0));
          var itemH = curItem.height();
          if(itemH < 500){
            return;
          }
          if(scrollTop < itemTop + 60){
            curItem.find(".itemFr").css({
                "position":"static"
            })
          }else if(scrollTop < itemTop + itemH - 180){
            curItem.find(".itemFr").css({
             "position":"fixed",
             "top":"0",
             "left":'50%',
             "marginLeft":'20px'
           })
          }else{
            curItem.find(".itemFr").css({
                "position":"static"
            })
          }
        }

  })

  //回到顶部

  $("#backTop a").click(function(){
    $('body,html').animate({scrollTop:0},300);
    return false;
  })



  // 延迟加载
  $(".itemPic img").each(function(){
    var _self = $(this);
    var url = _self.attr("data-url");
    var oImg = new Image();
    oImg.src = url;
    oImg.onload=function(){
      _self.attr("src",url);
      _self.parents("span").removeClass("imageloading");
      var longPic = _self.parents(".longPic");
      var longPicH = longPic.height();
      var longSpan = longPic.find(".loadMore");
      if(longPicH>800){
        longPic.css({
          height:"600px",
          overflow:"hidden",
          position:"relative",

        })
        longSpan.css({
          top:"570px"
        })
        longSpan.show();
        longPic.find("img").attr("data-baiduimageplus-ignore","");
      }
    }
  })

  $(".loadMore").click(function(){
    $(this).hide();
    $(this).parents(".longPic").css({
      overflow:"visible",
      height:"auto"
    })
    return false;
  })


  // 分享按钮
  // share(aLink,title,pics);
  var sinaBtn = $(".sinaBtn");
  var qqBtn = $(".qqBtn");

  sinaBtn.click(function(){
    _this = $(this);
    getShareCon(_this);
    return false;
  })

  qqBtn.click(function(){
    _this = $(this);
    getShareCon(_this);
    return false;
  })

  function getShareCon(obj){
    var h1Title = obj.parents(".item").find("h1").children("a").text();
    var shPic = "http://gaoxiao.114la.com"+obj.parents(".itemCon").find("img").attr("src");
    share(obj[0],h1Title,shPic);
  }



  // 首页翻页
  document.onkeydown=function(ev){
    var oEvent = ev || event;
    if(oEvent.keyCode==39){
      thePage("next");
    }
    if(oEvent.keyCode==37){
      thePage("par");
    }

    if(oEvent.ctrlKey && oEvent.keyCode==13){
      var comNum = $(".intTotalComment").val();
      commentSubmit(comNum);
    }
  }


  function thePage(dir){

    var intTotalPage = $(".intTotalPage").val();
    var intCurrentPage = $(".intCurrentPage").val();
    var nextid = $(".nextid").val();
    var preid = $(".preid").val();
    var category = $(".category").val();
    var host =  window.location.host;
    if(dir=="next"){

      if(intTotalPage){

        if(intTotalPage>intCurrentPage){
         
          var num =  parseInt(intCurrentPage)+1;
          window.location.href="/"+category+"-"+num+".html";

        }else{

            return false;
          
        }

      }else{
        var num =  parseInt(nextid);
        window.location.href="/"+category+"/"+num+".html";
      }


    }else{

      if(intTotalPage){

       if(1>intCurrentPage){
          return false;

        }else{
          var num =  parseInt(intCurrentPage)-1;
          window.location.href="/"+category+"-"+num+".html";
        }

      }else{
        var num =  parseInt(preid);
        window.location.href="/"+category+"/"+num+".html";
      }



    }

  }
  



  // 评论输入框
  var comBox = document.getElementById("comBox");
  var commentArea = document.getElementById("commentArea");//输入框
  var subBtn = getByClass('subBtn',comBox,'input')[0];//按钮
  var txtNum = getByClass('txtNum',comBox,'div')[0];//字数框
  var dtBottom = getByClass('dtBottom',jokeContent,'div')[0];
  
  var ie = !-[1,];

  //详情页长图
  var detailPic = getByClass("detailPic",jokeContent,"img")[0];
 if(typeof detailPic !='undefined'){
    var winH = document.documentElement.clientHeight || document.body.clientHeight;
    addEvent(window,"scroll",function(){
      var itemPic = getByClass("itemPic",jokeContent,"div")[0];
      var itemPicH = itemPic.offsetHeight;
      var commentMdTop = getByClass('commentMd',jokeContent,'div')[0].offsetTop;
      var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
      // console.log('d'+commentMdTop+'s'+scrollTop);
      if(itemPicH>winH && commentMdTop-winH>scrollTop){
        
        dtBottom.style.position="fixed";
        dtBottom.style.boxShadow="0 0 3px #ccc";
        dtBottom.style.zIndex="1";
        dtBottom.style.bottom="0";
      }else{
        dtBottom.style.position="static";
        dtBottom.style.boxShadow="none";
      }
    })
 }








  //字数框显示隐藏
  var bBtn = true;
  commentArea.onfocus=function(){
    if(bBtn){
      txtNum.style.display="block";
      bBtn = false;
    }
  }
  commentArea.onblur=function(){
    if(commentArea.value==''){
      txtNum.style.display="none";
      bBtn = true;
      state=false;
      addClass(subBtn,'disableBtn');
    }
  }

  if(ie){
    commentArea.onpropertychange=toChange;
  }else{
    commentArea.oninput=toChange;
  }



  comFrom.onsubmit=function(){
     return state;
  }
  toChange();
  function toChange(){
    var num = Math.ceil(getLength(commentArea.value)/2);
    //按钮状态
    if(commentArea.value==''){
      addClass(subBtn,'disableBtn');
      state=false;

    }else{
      removeClass(subBtn,'disableBtn');
      state=true;
    }

    //字数
    if(num<=140){
      txtNum.innerHTML=140-num;
      txtNum.style.color="#5C3E0E";
      state=true;
    }else{
      txtNum.innerHTML=num-140;
      txtNum.style.color="#E44443";
      addClass(subBtn,'disableBtn');
      state=false;
    }

  }

  function getLength(str){
    return String(str).replace(/[^\x00-\xff]/g,'aa').length;
  }


  // 表情
  var faceCon = getByClass("faceCon",comBox,"div")[0];
  var faceBtn = getByClass("faceBtn",comBox,"a")[0];
  var faceList = getByClass("faceList",comBox,"ul")[0];
  var faceShow = getByClass("faceShow",comBox,"div")[0];
  var showImg = getByClass("showImg",faceShow,"img")[0];
  var showTxt = getByClass("showTxt",faceShow,"span")[0];
  
  faceBtn.onclick=function(ev){
    var oEvent = ev || event;
    faceCon.style.display=faceCon.style.display=="block"?"none":"block";
    if(hasClass(faceBtn,"active")){
      removeClass(faceBtn,"active");
    }else{
      addClass(faceBtn,"active");
    }
    oEvent.cancelBubble=true;
  }


  faceList.onclick=function(ev){
    var oEvent = ev || event;
    var target = oEvent.srcElement  || oEvent.target;
    if(target.tagName=="A"){
      var faceTxt = target.getAttribute("face");
      Insert(commentArea,"["+faceTxt+"]")
      moveCaretToEnd(commentArea);
      removeClass(faceBtn,"active");
      toChange();
      faceCon.style.display="none";
      return false;
    }

    oEvent.cancelBubble=true;
  }



  faceList.onmouseover=function(ev){
    var oEvent = ev || event;
    var target = oEvent.srcElement  || oEvent.target;

    faceShow.style.display="block";
    var sizeLeft = comBox.offsetLeft;
    if(oEvent.clientX-sizeLeft<150){
      faceShow.style.left="auto";
      faceShow.style.right="5px";
    }else{
      faceShow.style.right="auto";
      faceShow.style.left="5px";

    }
    if(target.tagName=="A"){
      var faceTxt = target.getAttribute("face");
      var fid = target.getAttribute("fid");
      showImg.src = '/static/images/face/'+fid+'.gif';
      showTxt.innerHTML = faceTxt;
    }

  }

  faceList.onmouseout=function(ev){
    faceShow.style.display="none";
  }



  document.onclick=function(){
    faceCon.style.display="none";
    faceShow.style.display="none";
    removeClass(faceBtn,"active");
  }

})()













