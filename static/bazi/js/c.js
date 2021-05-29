function chkfrom_xm()
{
var xing = document.getElementById('shouji_haoma_num');
var ming = document.getElementById('shouji_haoma_num2');
if(xing.value == '' || xing.value.length < 1 || xing.value.length > 2)
{
alert('姓氏应该在1-2个文字之内');
return false;
}else if(ming.value == '' || ming.value.length < 1 || ming.value.length > 2)
{
alert('名字应该在1-2个文字之内');
return false;
}
return true;
}

function chkfrom_qm()
{
var xing = document.getElementById('qmxing');
if(xing.value == '' || xing.value.length < 1 || xing.value.length > 2)
{
alert('姓氏应该在1-2个文字之内');
return false;
}
return true;
}

function addFavorite() {
	var url = window.location.href;
    //var title = document.title;
	var title='最准的算命网站';
    var ua = navigator.userAgent.toLowerCase();
    if (ua.indexOf("360se") > -1) {
        alert("由于360浏览器功能限制，请按 Ctrl+D 手动收藏！");
    }else if (ua.indexOf("msie 8") > -1) {
        window.external.AddToFavoritesBar(url, title); //IE8
		return false;
    }else if (document.all) {
	  try{
		window.external.addFavorite(url, title);
		return false;
	  }catch(e){
		alert('您的浏览器不支持,请按 Ctrl+D 手动收藏!');
	  }
    }else if (window.sidebar) {
        window.sidebar.addPanel(title, url, "");
		return false;
    }else {
		//window.sidebar.addPanel(document.title, window.location.href, "");
		//window.sidebar.addPanel('adfa', 'http://www.baidu.com', "");
		if(ua.indexOf("lbbrowser") > -1){
			window.external.addFavorite(url, title);
		}else if(ua.indexOf("chrome") > -1){
			alert('您的浏览器不支持,请按 Ctrl+D 手动收藏!');
		}else{
			alert('您的浏览器不支持,请按 Ctrl+D 手动收藏!');
		}
    }
}

var ser_url = "http://zb.03ky.com/sech-";
function ser(){
	var ser_key = encodeURIComponent($("#ser_key").val());
	if(ser_key==""){alert("搜索不能为空");}
	else{
		if(document.getElementById("contents_search")){location.href = ser_url+ser_key+".html";}
		else{window.open(ser_url+ser_key+".html");}
	}
}

