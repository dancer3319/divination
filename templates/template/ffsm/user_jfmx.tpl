<!DOCTYPE html>
<html>
<head>
<title>会员中心-积分提现明细</title>
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

<div class="login"><div class="ui-avatar"><span style="background-image:url(<{if $member.headimgurl}><{$member.headimgurl}><{else}>/statics/user/images/userlogo.png<{/if}>)" onclick='location.href="/?ac=member"'></span></div>
<div class="login_t">
<h3><span style="color:#0180cf">帐号：</span><{$member.user_name}>(<em style="margin:5px 0;font-size:14px;"><font color="red"><{if $member.class==1}>注册用户<{elseif $member.class==2}>微信用户<{else}>QQ用户<{/if}></font></em>)</h3>
<span class="login_lj" style="font-size:14px;">我的佣金：<font color="red" size="3"><{$member.dl_syjf}></font> 元 </span>
<{if $jf_sys_on==1}>
<br>
<span class="login_lj" style="font-size:14px;">我的积分：<font color="red" size="3"><{$member.integral}></font></span>
<{/if}>
<{if $member.vip_type==38 || $member.vip_type==39 || $member.vip_type==40}>
<br>
<span class="login_lj" style="font-size:14px;"><font color="red" size="3">vip</font> <{if $member.vip_time<$times}><font color="red" size="3">已过期</font><{else}>到期时间：<{$time_end}><{/if}></span>
<{/if}>
<span class="login_lj" ><p style="margin:5px 0;font-size:14px;"><{if $member.phone}>电话：<{$member.phone}><a href="?ac=user_spacecp" class="zlxgan">资料修改</a><{else}><a href="?ac=user_spacecp" class="zlxgan">设置电话</a><{/if}></p></span>  
  </div>
</div>
  
  <{foreach key =k item=i from=$tx_result}>
    <{if $i.uid}>
	<div class="public_ddxx">
      <div class="public_k">
        <span class="public_des">[提现金额] <font color="#ff0000" ><{$i.tx_je}>元</font></span><span class="public_pyzt"><{if $i.tx_sc==1}><font color="#008000" >已打款</font><{elseif $i.tx_sc==2}><font color="#ff0000" >打款失败</font><{else}>未打款<{/if}></span>      </div> 
	<div class="public_k">
      <span class="public_pyzt_ddxx">提现积分：<{$i.tx_jf}></span>
    </div>
	<div class="public_k">
      <span class="public_pyzt_ddxx">提现渠道：<{if $i.tx_txfs==1}>支付宝<{elseif $i.tx_txfs==2}>微信<{else}>未知<{/if}></span>
    </div>
	<div class="public_k">
      <span class="public_pyzt_ddxx">联系电话：<{$i.tx_txtel}></span>
    </div>
      <div class="public_k">
      <span class="public_pyzt_ddxx">申请时间：<{$i.add_time|date_format:'%Y-%m-%d %H:%M:%S'}></span>
    </div>
	<div class="public_k">
      <span class="public_pyzt_ddxx">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：<{$i.tx_txbz}></span>
    </div>
  	
  </div>
     <{/if}>
 <{/foreach}> 
   
    
<div class="page" align="center"> 
<a href="/?ac=member">首页</a> <a href="/?ac=user_txmx&page=<{$pagepre}>" >< 上一页</a> <a href="/?ac=user_txmx&page=<{$pagenext}>">下一页 ></a> <a href="/?ac=user_txmx&page=<{$endpage}>">末页</a></div>

<{include file='./ffsm/user_footer.tpl'}>
</body>
</html>
 