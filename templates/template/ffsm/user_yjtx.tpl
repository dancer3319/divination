<!DOCTYPE html>
<html>
<head>
<title>会员中心-佣金提现</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
<meta name="format-detection" content="telephone=no">
<SCRIPT language=javascript src="/statics/user/js/jquery-1.9.1.min.js"></SCRIPT>
<SCRIPT language=javascript src="/statics/user/js/layer.js"></SCRIPT>
<script language="javascript">
 function tx_check(){
 if (TxForm.dl_jf.value><{$member.dl_syjf}>){
  alert("提现金额已超过可提现金额！");
  TxForm.dl_jf.focus();
  return false;
 }
  if (TxForm.dl_txfs.value==""){
  alert("请选择提现方式！");
  return false;
 }
 if (TxForm.dl_txzh.value==""){
  alert("请输入提现账号！");
  TxForm.dl_txzh.focus();
  return false;
 }
 if (TxForm.dl_txnc.value==""){
  alert("请输入帐户姓名！");
  TxForm.dl_txnc.focus();
  return false;
 }
 if (TxForm.dl_txtel.value==""){
  alert("请输入联系手机！");
  TxForm.dl_txtel.focus();
  return false;
 }
}
</script>
<link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
<link rel="stylesheet"href="/statics/user/css/frozen.min.css">
<link rel="stylesheet"href="/statics/user/css/style.min.css">
<style type="text/css">
#footer{height:56px;}#footer i{font-size:1.6rem}#footer li.active,#footer li:active,#footer li:hover{font-size:.7rem}
.ui-tiled li{font-size:.7rem}
</style> 
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
</style>
</head>
<body>
<{include file='./ffsm/user_header.tpl'}>
<header id="header" class="ui-header ui-header-positive ui-border-b" >
<h1></h1>
</header>

<div class="aui-super-box">
  <div class="aui-flex">
    <div class="aui-flex-user">
      <img src="<{if $member.headimgurl}><{$member.headimgurl}><{else}>/statics/user/images/userlogo.png<{/if}>" alt="" onclick='location.href="/?ac=member"'></div>
    <div class="aui-flex-box">
      <h2>
        <{$member.nickname}>
          <em>【
            <{if $member.class==1}>注册用户
              <{elseif $member.class==2}>微信用户
                <{else}>QQ用户
                  <{/if}>】</em>
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
                    <{else}>免费测试所有项目
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

<section class="jilu" style="margin-top: 2.2%;"> 
<div class="daili-tixian-body">
<form class="think-form" id="TxForm" class="TxForm" action="/?ac=user_yjtx" method="post" onSubmit="return tx_check();">
<div class="group-box am-margin-0 am-padding-0">
<div class="am-margin-top-0 am-padding-bottom-sm menu-list">
<ul>
<li class="am-padding-left am-padding-right">
<div class="color-red am-fr menu-list-r"><{$member.dl_syjf}>元</div> <div class="am-fl menu-list-l">可提现额</div>
</li>
<li class="am-padding-left am-padding-right"><div class="am-fr menu-list-r">
<input type="text" name="dl_jf" id="dl_jf" class="inputstyle" placeholder="请输入提现金额，单位元" value="<{$tx_result.dl_jf}>"></div>
<div class="am-fl menu-list-l">提现金额</div>
</li>
<li class="am-padding-left am-padding-right" id="xztxfs">
<a href="javascript:;" style="border-top: 0;"><i class="color-gray am-fr am-icon-chevron-right"></i><div class="color-gray am-fr menu-list-r" id="tx_name"><{if $tx_result.dl_txfs==1}>支付宝<{elseif  $tx_result.dl_txfs==2}>微信<{else}>请选择提现方式<{/if}></div> <div class="am-fl menu-list-l">提现方式</div>
<input type="hidden" name="dl_txfs" id="dl_txfs" value="<{$tx_result.dl_txfs}>">
</a>
</li>
<li class="am-padding-left am-padding-right"><div class="am-fr menu-list-r">
<input type="text" name="dl_txzh" id="dl_txzh" class="inputstyle" placeholder="提现帐号" value="<{$tx_result.dl_txzh}>"></div>
<div class="am-fl menu-list-l">提现帐号</div>
</li>
<li class="am-padding-left am-padding-right"><div class="am-fr menu-list-r">
<input type="text" name="dl_txnc" id="dl_txnc" class="inputstyle" placeholder="请输入姓名" value="<{$tx_result.dl_txnc}>"></div> 
<div class="am-fl menu-list-l">帐户姓名</div></li>
<li class="am-padding-left am-padding-right"><div class="am-fr menu-list-r">
<input type="text" name="dl_txtel" id="dl_txtel" class="inputstyle" placeholder="请输入联系电话" value="<{$tx_result.dl_txtel}>"></div>
<div class="am-fl menu-list-l">联系电话</div></li>
</ul>
<div class="am-padding-left am-padding-right am-margin-top-sm">
<input type="submit" name="txsq" id="submit" class="am-btn am-radius btn-full btn-default" value="申请提现"></div>
</div>
</div>
<div class="am-modal am-modal-alert am-modal-active" tabindex="-1" id="tixian_select" style="display: none;">
	<div class="am-modal-dialog option-tips">
		<div class="am-modal-hd">选择提现方式</div>
		<div class="am-modal-bd">
			<ul name="cid">
			<li class="am-modal-btn" id="1" value="1">支付宝</li>
			<li class="am-modal-btn" id="2" value="2">微信</li>
			</ul>
		</div>
	</div>
</div>
</form>
</div>
</section>



<script>
$(document).ready(function()
{
    
	$("#xztxfs").click(function(){
    $('#tixian_select').show();
    $('.am-dimmer').addClass('am-active');
    $('.am-dimmer').show();
	});
	$(".am-modal-btn").click(function(){
		var dl_txfs=$(this).val();
		$('#dl_txfs').val(dl_txfs);
		var cid_name=$(this).text();
		$('#tx_name').text(cid_name);
		$('#tixian_select').hide();
		$('.am-dimmer').hide();
		$('.am-dimmer').removeClass('am-active');
		
	});
	

});
</script>

<{include file='./ffsm/user_footer.tpl'}>
</body>
</html>
 