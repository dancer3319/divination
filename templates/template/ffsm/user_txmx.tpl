<!DOCTYPE html>
<html>
<head>
<title>会员中心-提现明细</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
<meta name="format-detection" content="telephone=no">
<!--a-->
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
  
  <{foreach key =k item=i from=$tx_result}>
    <{if $i.uid}>
	<div class="public_ddxx">
      <div class="public_k">
        <span class="public_des">[提现金额] <font color="#ff0000" ><{$i.dl_jf}>元</font></span><span class="public_pyzt"><{if $i.dl_sc==1}><font color="#008000" >已打款</font><{elseif $i.dl_sc==2}><font color="#ff0000" >打款失败</font><{else}>未打款<{/if}></span>      </div> 
	<div class="public_k">
      <span class="public_pyzt_ddxx">提现渠道：<{if $i.dl_txfs==1}>支付宝<{elseif $i.dl_txfs==2}>微信<{else}>未知<{/if}></span>
    </div>
	<div class="public_k">
      <span class="public_pyzt_ddxx">联系电话：<{$i.dl_txtel}></span>
    </div>
      <div class="public_k">
      <span class="public_pyzt_ddxx">申请时间：<{$i.add_time|date_format:'%Y-%m-%d %H:%M:%S'}></span>
    </div>
	<div class="public_k">
      <span class="public_pyzt_ddxx">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：<{$i.dl_txbz}></span>
    </div>
  	
  </div>
     <{/if}>
 <{/foreach}> 
   
    
<div class="page" align="center"> 
<a href="/?ac=member">首页</a> <a href="/?ac=user_txmx&page=<{$pagepre}>" >< 上一页</a> <a href="/?ac=user_txmx&page=<{$pagenext}>">下一页 ></a> <a href="/?ac=user_txmx&page=<{$endpage}>">末页</a></div>

<{include file='./ffsm/user_footer.tpl'}>
</body>
</html>
 