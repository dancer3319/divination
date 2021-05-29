<!DOCTYPE html>
<html>
<head>
<title>会员中-个人推广分销中心-<{$zhanming}></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
<meta name="format-detection" content="telephone=no">
<{include file='./ffsm/wx_share.tpl'}>
<SCRIPT language=javascript src="/statics/user/js/jquery-1.9.1.min.js"></SCRIPT>
<SCRIPT language=javascript src="/statics/user/js/layer.js"></SCRIPT>
<script type="text/javascript" src="/statics/user/js/webuploader.min.js"></script>
<script type="text/javascript" src="/statics/user/js/upload.js"></script>
<!--a-->
<link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
<link rel="stylesheet"href="/statics/user/css/frozen.min.css">
<link rel="stylesheet"href="/statics/user/css/style.min.css">
<style type="text/css">
#footer{height:56px;}#footer i{font-size:1.6rem}#footer li.active,#footer li:active,#footer li:hover{font-size:.7rem}
.ui-tiled li{font-size:.7rem}
</style> 
<script type="text/javascript">  
function copyUrl2()  
{  
  var Url2=document.getElementById("name");  
  Url2.select(); 
  document.execCommand("Copy");
  alert("推广链接复制成功！");  
}  
</script> 
<style>
.open_vip{
background-color: lightcyan;;
}
.ui-border li i em{
font-size: 0.75rem;
}
.aboutpic li{
margin-top: 0.6rem
}
.aboutpic li i img{
width: 2.5rem;
height: 2.5rem;
}
.a-upload {
    padding: 5px 5px;
    height: 26px;
    line-height: 26px;
    position: relative;
    cursor: pointer;
    color: #888;
    background: #fafafa;
    border: 1px solid  rgba(0, 0, 0, .2);
    border-radius: 4px;
    overflow: hidden;
    display: inline-block;
    *display: inline;
    *zoom: 1
}
.a-upload:hover {
    color: #444;
    background: #eee;
    border-color: #ccc;
    text-decoration: none
}
.btn {
    display: inline-block; width:30%;padding: 6px 0;margin-bottom: 0;font-size: 14px;font-weight: normal;line-height: 1.428571429;text-align: center;white-space: nowrap;vertical-align: middle;cursor: pointer; background-image: none;border: 1px solid transparent;border-radius: 4px; -webkit-user-select: none;-moz-user-select: none;-ms-user-select: none;-o-user-select: none;user-select: none; float: left; margin-left:2%;}
.btn-default{text-shadow:0 1px 0 #fff;background-image:-webkit-linear-gradient(top,#fff 0,#e0e0e0 100%);background-image:linear-gradient(to bottom,#fff 0,#e0e0e0 100%);background-repeat:repeat-x;border-color:#dbdbdb;border-color:#ccc;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff',endColorstr='#ffe0e0e0',GradientType=0);filter:progid:DXImageTransform.Microsoft.gradient(enabled=false);}
.btn-default:hover{background-color:#e0e0e0;background-position:0 -15px;}
.webuploader-container {
	position: relative;  overflow:hidden; float: left;
}
.webuploader-element-invisible {
	position: absolute !important;
	clip: rect(1px 1px 1px 1px); /* IE6, IE7 */
    clip: rect(1px,1px,1px,1px);
}
.webuploader-pick {
	position: relative;
	display: inline-block;
	cursor: pointer;
	background: #d64f4f;
	padding: 5px 11px;
	color: #fff;
	text-align: center;
	border-radius: 3px;
	overflow: hidden;
	font-size:16px;
}
.webuploader-pick-hover {
	background: #d64f4f;
}

.webuploader-pick-disable {
	opacity: 0.6;
	pointer-events:none;
}
.item{position: relative;padding:5px 1%;line-height: 23px; height: 23px;border: 1px solid rgba(0, 0, 0, .2);border-radius: 3px; overflow:hidden; width:65%; float:left; }
.item .state{position: absolute;padding:0 6px;top:0;right:0; background-color:#d64f4f; height:33px; line-height:33px;border-radius: 0; color:#FFFFFF;}
.item .info{ line-height:25px;}

.progress{position: absolute; width:100%; height:33px; background-color:#fff; left:0; top:0;}
.progress .progress-bar{width:0%;height:33px; background-color:#d64f4f;}
.zlxgan {
    border: 1px #02b502 solid;
    color: #02b502 !important;
    padding: 2px 5px !important;
    font-size: 12px !important;
    border-radius: 5px !important;
    margin-left: 5px !important;
    background: none !important;
}
</style>
<script src="/statics/user/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript"> 
$(document).ready(function()
{
    $("#avatar li").click(function()
    {
        $("#avatar li").removeClass("select");
        $(this).addClass("select");
		var id=$(this).attr('id');
        document.getElementById('avatar_id').value=id;
    });
});  
</script>

</head>
<body>
<{include file='./ffsm/user_header.tpl'}>
<header id="header" class="ui-header ui-header-positive ui-border-b" >
<h1></h1>
</header>


<div class="aui-super-box">
  <div class="aui-flex">
    <div class="aui-flex-user">
      <img src="<{if $member.headimgurl}><{$member.headimgurl}><{else}>/statics/user/images/userlogo.png<{/if}>" alt=""></div>
    <div class="aui-flex-box">
      <h2>
        <{$member.nickname}>
          <em>【<{if $member.class==1}>注册用户<{elseif $member.class==2}>微信用户<{else}>QQ用户<{/if}>】</em>
      </h2>
      <div class="dianh">
        <{if $member.phone}>电话:
          <{$member.phone}>
            <a href="?ac=user_spacecp">
              <span>修改资料</span></a>
            <{else}>您还未设置个人资料
              <a href="?ac=user_spacecp">
                <span>设置资料</span></a>
              <{/if}>
      </div>
    </div>
  </div>
  <div class="jifenjinbi">
    <em>佣金：
      <{$member.dl_syjf}>元</em>┃
    <em>积分：
      <{$member.integral}>个</em></div>
  <div class="aui-super-nav">
    <div class="aui-flex">
      <div class="aui-flex-box">
        <h3>
          <i class="icon icon-vip"></i>
            <{if $member.vip_type==38 || $member.vip_type==39 || $member.vip_type==40}>
			<{if $member.vip_time<$times}>已过期<{else}>到期时间：<{$member.vip_time|date_format:'%Y-%m-%d %H:%M:%S'}><{/if}>
                    <{else}>免费测算所有项目
                      <{/if}></h3>
      </div>
      <{if $member.vip_type==38 || $member.vip_type==39 || $member.vip_type==40}>
        <{else}>
          <div class="aui-more-eay">
            <button>
              <a href="?ac=vip">开启VIP</a></button>
          </div>
          <{/if}>
    </div>
  </div>
</div>
<a href="?ac=tuiguang">
<div class="aui-loan-body">
<h1>如何赚取佣金</h1>
<p>佣金和积分均可提现</p>
</div></a>


<section class="jilu">
  <a href="?ac=user_tgjl" class="b-line">
    <div class="aui-cou-img">
      <img src="/statics/user/images/yongjin.png" alt=""></div>
    <div class="aui-flex-box">
      <p>推广记录</p>
    </div>
    <div class="aui-arrow">
      <span>
        <{$member.dl_syjf}>元</span></div>
  </a>
  <a href="?ac=user_jfmxs" class="aui-flex b-line">
    <div class="aui-cou-img">
      <img src="/statics/user/images/jifen.png" alt=""></div>
    <div class="aui-flex-box">
      <p>积分明细</p>
    </div>
    <div class="aui-arrow">
      <span>
        <{$member.integral}>个</span></div>
  </a>
  <a href="?ac=user_wdxx" class="aui-flex b-line">
    <div class="aui-cou-img">
      <img src="/statics/user/images/xiaji.png" alt=""></div>
    <div class="aui-flex-box">
      <p>我的二级下线</p>
    </div>
    <div class="aui-arrow">
      <span></span>
    </div>
  </a>
  <a href="?ac=user_wdxxj" class="aui-flex b-line">
    <div class="aui-cou-img">
      <img src="/statics/user/images/xiaxiaji.png" alt=""></div>
    <div class="aui-flex-box">
      <p>我的三级下线</p>
    </div>
    <div class="aui-arrow">
      <span></span>
    </div>
  </a>
<!--<{if $jf_sys_on==1}>
    <a href="?ac=user_jftx" class="aui-flex b-line">
      <div class="aui-cou-img">
        <img src="/statics/user/images/tixian.png" alt=""></div>
      <div class="aui-flex-box">
        <p>积分提现</p>
      </div>
      <div class="aui-arrow">
        <span></span>
      </div>
    </a>
    <a href="?ac=user_jftxmx" class="aui-flex b-line">
      <div class="aui-cou-img">
        <img src="/statics/user/images/mingxi.png" alt=""></div>
      <div class="aui-flex-box">
        <p>积分提现明细</p>
      </div>
      <div class="aui-arrow">
        <span></span>
      </div>
    </a>
    <{/if}>-->
      <a href="?ac=user_yjtx" class="aui-flex b-line">
        <div class="aui-cou-img">
          <img src="/statics/user/images/tixian.png" alt=""></div>
        <div class="aui-flex-box">
          <p>佣金提现</p>
        </div>
        <div class="aui-arrow">
          <span></span>
        </div>
      </a>
      <a href="?ac=user_txmx" class="aui-flex b-line">
        <div class="aui-cou-img">
          <img src="/statics/user/images/mingxiy.png" alt=""></div>
        <div class="aui-flex-box">
          <p>提现明细</p>
        </div>
        <div class="aui-arrow">
          <span></span>
        </div>
      </a>
      <a href="?ac=user_wdcs" class="aui-flex b-line">
        <div class="aui-cou-img">
          <img src="/statics/user/images/cesuan.png" alt=""></div>
        <div class="aui-flex-box">
          <p>我的测算</p>
        </div>
        <div class="aui-arrow">
          <span></span>
        </div>
      </a>
      <a href="?ac=loginout" class="aui-flex b-line">
        <div class="aui-cou-img">
          <img src="/statics/user/images/tuichu.png" alt=""></div>
        <div class="aui-flex-box">
          <p>退出登录</p>
        </div>
        <div class="aui-arrow">
          <span></span>
        </div>
      </a>
</section>
<section style="margin-top: 2.2%;background: #fff;"> 
<form method="post" action="" style="padding:0 10px;" target="msgubotj" enctype="multipart/form-data">
<div class="fxiang_1">
<p>把下图分享到朋友圈，微信内可长按识别</p>
<p>长按即可保存图片</p>
</div>
<script type="text/javascript" src="/statics/VIP/js/jquery.qrcode.min.js"></script>
<input id="code-url" type="hidden" value="http://<{$dqurl}>/?dl=<{$member.uid}>"/><br />
<div id="mid-qrcode" class="fxiang"></div>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
<div id="divOne"></div>
<tr>
<td  height="15" width="30%" ></td>
<td width="70%"></td>
</tr>
<tr>
  <td height="30" align="right" valign="middle">推广链接：</td>
  <td><textarea name="text" id="sl" readonly="readonly name="name" class="make_resume_input" id="name">http://<{$dqurl}>/?dl=<{$member.uid}></textarea></td>
</tr>
<tr>
<td height="50" colspan="2" align="center" valign="middle" style="padding-top:6px;">
  <input type="submit" id="submit" value="复制链接" class="user_reg_but" style="width:120px;" onclick="slcopy()"></td>
</tr>
</tbody></table>
</form>
</section>
<section class="jilu" style="margin-top: 2.2%;"> 
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr>
  <td height="40"><p class="description">
<b>什么是三级分销？</b><br>
将推广地址发布出去别人注册会员会自动成为你的下线<br>
用户 A 推荐用户B测算，用户 A 获得提成<br>
用户 B 推荐用户C测算，用户 A、B 均获得提成<br>
用户 C 推荐用户D测算，用户 A、B、C 均获得提成;<br>
用户 D 推荐用户E测算，这时用户A不再获得提成<br>
<br>
<b>分销可以获取多少提成？</b><br>
<font color="#ff3300">一级分销提成： %<{$oneclass}></font><br>
<font color="#0099330">二级别分销提成：%<{$twoclass}></font><br>
<font color="#6600ff">三级别分销提成：%<{$threeclass}></font> <br>
以上的提成是说明，在你发展的用户中分别不同级别用户测算拿到的提成,分销商拿到的提成金额可以在线提现
</p></td>
</tr>
</table>
</section>

<script type="text/javascript">
    $(function(){
        var qrcode= $('#divOne').qrcode({
            text: $("#code-url").val(),
            width: 150,
            height: 150,
        }).hide();
        var canvas=qrcode.find('canvas').get(0);
        var data_codeImg = canvas.toDataURL('image/jpg');//图片base64位字符串
        data = [
            '/statics/VIP/beij.png', //背景海报图
            data_codeImg
        ], base64 = [];
        function draw(fn) {
            var c = document.createElement('canvas'),  // 获取canvas对象( 通过选择器选择canvas元素 )
                ctx = c.getContext('2d'),  // 通过canvas获取他的上下文绘制环境( context )
                len = data.length;
            c.width = 640;  // 画布宽   canvas的默认宽度与高度:宽度:300,高度:150 注：canvas的宽度与高度，只能通过行间属性或者js动态修改，不要通过样式去修改，否则获取到的宽度与高度不准
            c.height = 1040;  // 画布高
            ctx.rect(0, 0, c.width, c.height);  // 创建矩形 参数：绘制起点x坐标，绘制起点y坐标，矩形宽（像素），矩形高（像素）
            ctx.fillStyle = '#fff';
            ctx.fill();
            function drawing(n) {
                if (n < len) {
                    var img = new Image;
                    img.src = data[n];
                    img.onload = function () {
                        if (n === 1) {
                            // 画图 参数：图片对象，相对画布的起点x坐标，
                            // 相对画布的起点y坐标，绘制的图片宽度（二维码，px），绘制的图片高度（二维码，px）
                            ctx.drawImage(img, c.width/1.78, 390, 200, 200);
                        }
                        else if(n === 0){
                            ctx.drawImage(img, 0, 0, c.width,  c.height);
                        }
                        drawing(n + 1);//递归
                    }
                } else {
                    //保存生成作品图片
                    base64.push(c.toDataURL("data/jpeg", 0.8));
                    fn();
                }
            }
            drawing(0);
        }
        // 调用
        function hecheng() {
            draw(function () {
                document.getElementById("mid-qrcode").innerHTML = '<img src="'+base64[0]+'">';
            });
        }
        hecheng()
    });
</script>











<script>
function slcopy(){
var ele = document.getElementById("sl");//ele是要复制的元素的对象
ele.focus();
// ele.select();
ele.setSelectionRange(0, ele.value.length);
if(document.execCommand('copy', false, null)){
//success info
alert("复制成功")
} else{
//fail info
alert("复制失败")
}
}
</script>
<{include file='./ffsm/user_footer.tpl'}>
</body>
</html>
 