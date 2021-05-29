<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8"/>
<title><{$dsyy_row.project}>，大师在线服务-<{$zhanming}></title>
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
<meta content="telephone=no" name="format-detection"/>
<link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
<link href="/statics/ffsm/dashi/dashi.css" rel="stylesheet" type="text/css"/>
<{include file='./ffsm/wx_share.tpl'}>
<script src="https://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="statics/ffsm/public/js/require/require.min.js"></script>
<script src="statics/ffsm/public/js/common.min.js"></script>
</head>
<body>
<{if $gundong}><div class="alert-marquee" id="alertMarquee"><p class="inner"><{$gundong}></p></div><{/if}>
<header class="public_header">
<h1 class="public_h_con"><{$dsyy_row.project}></h1>
<a class="public_h_home" href="/?ac=dashi"></a><a href="?ac=history" class="public_h_menu">我的测算</a></header>
<div class="public_banner">
	<img src="<{$dsyy_row.images}>" alt="<{$dsyy_row.project}>"/>
	<span><{$dsyy_row.title}></span>
</div>
<p class="ptxt"><{$dsyy_row.centent}></p>
<p class="pcombtn">
    <span class="bediv spsl">2606测试</span>
    <span class="bediv sppj">5评价</span>
    <span class="bediv sphp">96.78%好评</span>
</p>
<div class="scsm-box" id="submit2">
    <p>预约说明：</p>
    <p>请提供您的出生信息，专业老师马上为您解答。</p>
    <p>以用户输入的时间为准，提供详细准确的个人信息，对命理分析有很大帮助喔！</p>
</div>
<div class="public_bg_color">
	<form class="J_ajaxForm J_testFixedShow" id="submit1" action="?ac=dashi" name="login" method="post" onSubmit="return checkForm();">
		<div class="public_form_wrap" id="miaodian">
			<ul>
				<li>
				<div class="left">预约金额</div>
				<div class="auto" id="project_sls">
					<div type="text" class="bg_no" id="dsyy_money"/><{$dsyy_row.money}>元</div>
				</div>
				</li>
				<li>
				<div class="left">您的姓名</div>
				<div class="auto">
					<input type="text" class="bg_no" id="username" name="username" placeholder="请输入名字（必须汉字）" value=""/>
				</div>
				</li>
				<li>
				<div class="left">您的性别</div>
				<div class="auto sex sex J_sex">
					<span class="cur" data-value="1"><i></i><font>男</font></span><span data-value="0"><i></i><font>女</font></span><input type="hidden" name="gender" value="1"/>
				</div>
				</li>
				<li>
				<div class="left">出生日期</div>
				<div class="auto">
					<input type="text" id="birthday" data-input-id="b_input" class="Js_date" data-type="0" value="请选择出生日期" placeholder="请选择日期" data-toid-hour="birthday">
				</div>
				</li>
				<li>
				<div class="left">联系电话</div>
				<div class="auto">
					<input type="text" class="bg_no" id="tel" name="tel" placeholder="请输入手机号码" value=""/>
				</div>
				</li>
				<input type="hidden" name="project_id" id="project_id" value="<{$dsyy_row.id}>">
                <input type="hidden" name="h"  class="auto input J-time" id='j_dd'  value="">
                <input type="hidden" name=y  value="0">
                <input type="hidden" name=m  value="0">
                <input type="hidden" name=d  value="0">
                <input type="hidden" name=i  value="0">
                <input type="hidden" name=cY  value="">
                <input type="hidden" name=cM  value="">
                <input type="hidden" name=cD  value="">
                <input type="hidden" name=cH  value="">
                <input type="hidden" name=term1  value="">
                <input type="hidden" name=term2  value="">
                <input type="hidden" name=start_term  value="">
                <input type="hidden" name=end_term  value="">
                <input type="hidden" name=start_term1  value="">
                <input type="hidden" name=end_term1  value="">
                <input type="hidden" name=lDate  value="">
			</ul>
		</div>
		<div class="public_btn_s">
        	<input type="button" value="提交预约" class="J_ajax_submit_btnsub">
		</div>
	</form>
</div>
<div class="fenge"></div>
<div class="colorbox">
  <div class="main-tit clearfix">
    <span class="bediv">咨询评价(5)</span></div>
  <div class="cmtlist">
    <dl>
      <dt>
        <img src="//cs.263169.com/static/shance/skin_img/mricon.png" alt=""></dt>
      <dd>
        <p class="ptit">138****6098</p>
        <p class="pstar clearfix">
          <span></span>
          <span></span>
          <span></span>
          <span></span>
          <span></span>
        </p>
        <p class="ptxt">本来要结婚的，后面因为一些乱七八糟的事情一直左右摇摆，不知道后面到底会怎样，我仿佛已经没有了信心。老师分析的也很对，我们之间存在的问题都说到了，也谢谢老师的建议，我尽量调整了只能。</p></dd>
    </dl>
    <dl>
      <dt>
        <img src="//cs.263169.com/static/shance/skin_img/mricon.png" alt=""></dt>
      <dd>
        <p class="ptit">152****0289</p>
        <p class="pstar clearfix">
          <span></span>
          <span></span>
          <span></span>
          <span></span>
          <span></span>
        </p>
        <p class="ptxt">预测最大的意义就是提醒自己，有时候看看还是挺好的。</p></dd>
    </dl>
    <dl>
      <dt>
        <img src="//cs.263169.com/static/shance/skin_img/mricon.png" alt=""></dt>
      <dd>
        <p class="ptit">138****5784</p>
        <p class="pstar clearfix">
          <span></span>
          <span></span>
          <span></span>
          <span></span>
          <span></span>
        </p>
        <p class="ptxt">如老师所说，我真的的就是那种要很努力才能得到自己想要的东西，我会继续努力的，谢谢老师。</p></dd>
    </dl>
  </div>
  <div class="cmtall">
    <a href="/?ac=dashi" class="afdiv">查看全部评价</a></div>
</div>
<div class="fenge"></div>
<div class="lunpan_box" style="display:none;">
	<div class="lunpan">
		<img src="statics/ffsm/bazisyy/1/images/luopan.png" alt="轮盘">
		<img src="statics/ffsm/bazisyy/1/images/zhizheng.png" alt="轮盘">
	</div>
	<div class="lunpan_color"></div>
    <span style="color:#FFF; text-align:center;position:fixed;top:70%;left:29%;z-index:110;margin:0 auto;">正在查询在线大师 请稍后...</span>
</div>
<div class="ainuo_foot_nav cl" id="testFixedBtn" style="display: none;">
    <ul>
     <li><a href="/"><i class="shouye_1"></i><p>测算首页</p></a></li>
     <li><a href="/?ac=history"><i class="wddd_1"></i><p>订单查询</p></a></li>
     <li><a href="#submit2"class="botpost"><em><i class="lijics_1"></i></em><p>立即预约</p></a></li>
     <li><a href="/"><i class="gengduo_1"></i><p>更多测算</p></a></li>
     <li><a href="/?ac=member"><i class="grzx_1"></i><p>个人中心</p></a></li>
    </ul>
</div>
<style type="text/css">
.ainuo_foot_nav{display: block; padding: 2px 0; background:#d6b168; position: fixed; bottom: 0; width: 100%; z-index: 99999;max-width: 640px;}
.ainuo_foot_nav li{width: 20%; text-align: center; float: left;}
.ainuo_foot_nav li a{width: 100%; display: block;}
.ainuo_foot_nav .foothover i{color: #f13030;}
.ainuo_foot_nav li i{display: block; line-height: 25px; height: 25px; margin: auto; padding: 0; width: 25px; overflow: hidden; background-size: 100%;}
.ainuo_foot_nav li a.botpost{position: relative; margin-top: -11px; background-color: rgba(0,0,0,0.0);}
.ainuo_foot_nav li a.botpost em{background: #ffffff; padding: 2px; border: 1px solid #d6b168; display: block; border-radius: 50%; width: 30px; height: 30px; margin: 0 auto; margin-bottom: 2px;padding-bottom: 0px;}
.ainuo_foot_nav li p{overflow: hidden; font-size: 12px; height: 16px; line-height: 16px; color: #fff; font-weight: 400;}
.shouye_1{background: url(/statics/ffsm/public/images/shouye.png) no-repeat;}
.wddd_1{background: url(/statics/ffsm/public/images/dingdan.png) no-repeat;}
.lijics_1{background: url(/statics/ffsm/public/images/wen.png) no-repeat;width: 28px!important;}
.gengduo_1{background: url(/statics/ffsm/public/images/gengduo.png) no-repeat;}
.grzx_1{background: url(/statics/ffsm/public/images/grzx.png) no-repeat;}
</style>

<script>
$('.sure').click(function(){
	alert('你没有付费不能评价');
	return false;
});

$('.J_ajax_submit_btnsub').click(function(){
		var phone=/^1[345789]\d{9}$/;
		var tjPhone=$('#tel').val();
		if(tjPhone.match(phone)==null){
			alert("您的手机格式不正确");
			$('#tel').focus();
			return false;
		}
		if (tjPhone==""){
			alert("请手机号码！");
			$('#tel').focus();
			return false;
		}		
		if ($('#project_id').val()==""){
			alert("请选择预约项目！");
			$('#project_tit').focus();
			return false;
		}
        $('.lunpan_box').css('display','block');
            setTimeout(function(){  //使用  setTimeout（）方法设定定时2000毫秒
                    checkForm();
                            document.getElementById("submit1").submit();
                                },2000);
});
</script>

<script>
    //测算底部悬浮
    (function(){
    	var topShow=$(".J_testFixedShow");
    	if(topShow.length){
            var topShow=topShow.offset().top;
    		var testBtn=$("#testFixedBtn");
    		$(window).scroll(function(){
                var wt=$(window).scrollTop();
                wt>topShow?(testBtn.fadeIn(),$('.public_footer_servers').css('padding-bottom','50px')):(testBtn.fadeOut(),$('.public_footer_servers').css('padding-bottom','20px'));
            });
            testBtn.add('.J_testScrollTop').on('click',function(){$('html,body').scrollTop(topNum)})
    	}
    })()
</script>
<script type="text/javascript">
function _resize(){
    var html= document.getElementsByTagName('html')[0];
    var hW = html.offsetWidth > 750 ? 750 : html.offsetWidth;
    var fS = 100/750 * hW;
    html.style.fontSize = fS+"px"
}
_resize();
window.onresize = function(){
    _resize();
};
</script>
<script src="statics/suanming.js"></script>
<{include file='./ffsm/dashi/tuijian.tpl'}>
<div style="height: 0.7rem;"></div>
<{include file='./ffsm/footers.tpl'}>
<{include file='./ffsm/dl_ck.tpl'}>
</body>
</html>