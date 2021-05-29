<!DOCTYPE html>
<html>
<head>
<title>会员中心-资料设置</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
<meta name="format-detection" content="telephone=no">
<SCRIPT language=javascript src="/statics/user/js/jquery-1.9.1.min.js"></SCRIPT>
<SCRIPT language=javascript src="/statics/user/js/layer.js"></SCRIPT>

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
<form class="think-form" id="TxForm" class="TxForm" action="/?ac=user_spacecp" method="post" >
<div class="group-box am-margin-0 am-padding-0">
<div class="am-margin-top-0 am-padding-bottom-sm menu-list">
<ul>
<{if $member.class!=2 && $member.class!=3}>
<li class="am-padding-left am-padding-right">
<div class=" am-fr menu-list-r"><{$member.user_name}></div> <div class="am-fl menu-list-l">账号</div>
</li>
<{/if}>
<li class="am-padding-left am-padding-right">
<div class="color-red am-fr menu-list-r"><{$member.dl_syjf}>元</div> <div class="am-fl menu-list-l">佣金</div>
</li>
<li class="am-padding-left am-padding-right"><div class="am-fr menu-list-r">
<input type="text" name="phone" id="phone" class="inputstyle" placeholder="请输入您的手机号码" value="<{$member.phone}>"></div>
<div class="am-fl menu-list-l">电话</div>
</li>

<li class="am-padding-left am-padding-right"><div class="am-fr menu-list-r">
<input type="text" name="qq" id="qq" class="inputstyle" placeholder="QQ" value="<{$member.qq}>"></div>
<div class="am-fl menu-list-l">QQ</div>
</li>

</ul>
<div class="am-padding-left am-padding-right am-margin-top-sm">
<input type="submit" name="zlbc" id="submit" class="am-btn am-radius btn-full btn-default" value="保存"></div>
</div>
</div>

</form>
</div>
</section>


<{include file='./ffsm/user_footer.tpl'}>
</body>
</html>
 