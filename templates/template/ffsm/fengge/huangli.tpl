<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8"/>
<title>八字运势你详批解读实时运程播报-算命</title>
<meta name="keywords" content="运程播报,算命">
<meta name="description" content="根据八字排出七柱信息，逐一解读每时每刻的运势吉凶，让你做任何事情都可以做到趋吉避凶。">
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
<meta content="telephone=no" name="format-detection"/>
<link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
<link href="/statics/ffsm/public/wap.min-v=0817.css" rel="stylesheet" type="text/css"/>
<link href="statics/ffsm/index/huangli.css" rel="stylesheet" type="text/css" />
<{include file='./ffsm/wx_share.tpl'}>
<script src="https://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
<header class="public_header">
<h1 class="public_h_con">今日黄历</h1>
<a class="public_h_home" href="/"></a><a href="?ac=member" class="public_h_menu">个人中心</a></header>
<div class="huanglibj">
<div class="hl_mod hl_rili">
  <div class="hl_riliTop">
    <h2><{$hdjr.gongli}> <{$hdjr.ddd2}></h2>
    <h4><{$hdjr.ddd}></h4>
    <p><{$hdjr.nongli}></p>
    <div><{$hdjr.suici}></div></div>
  <div class="hl_riliCon">
    <div class="hl_riliCon_l">宜</div>
    <div class="hl_riliCon_r">
      <div class="hl_riliCon_rItem">
        <a href="/"><{if $hdjr.yi!='-'}><{$hdjr.yi}><{else}>诸事不宜<{/if}></a></div>
    </div>
  </div>
  <div class="hl_riliCon hl_riliConJi">
    <div class="hl_riliCon_l">忌</div>
    <div class="hl_riliCon_r">
      <div class="hl_riliCon_rItem">
        <a href="/yi_banjia.html"><{if $hdjr.ji!='-'}><{$hdjr.ji}><{else}>诸事勿取<{/if}></a></div>
    </div>
  </div>
</div>

<table cellspacing="0" cellpadding="0" border="0" class="tableData" id="_jrhlTable">
  <colgroup>
    <col width="22%">
      <col width="28%">
        <col width="22%">
          <col width="28%"></colgroup>
    <tr>
      <td class="thBg">彭祖百忌</td>
      <td colspan="3" id="_conNongli"><{$hdjr.baiji}></td></tr>
    <tr>
      <td class="thBg">凶神宜忌</td>
      <td colspan="3" id="_conZRXS"><{$hdjr.xiongshen}></td></tr>
    <tr>
      <td class="thBg">吉神宜趋</td>
      <td colspan="3" id="_conZRXS"><{$hdjr.jishen}></td></tr>
    <tr class="tr-su">
      <td class="thBg">
        <span class="su-icon green">宜</span>
      </td>
      <td colspan="3">
        <p class="pSuitable" id="_conYI"><{if $hdjr.yi!='-'}><{$hdjr.yi}><{else}>诸事不宜<{/if}></p></td>
    </tr>
    <tr class="tr-su">
      <td class="thBg">
        <span class="su-icon red">忌</span>
      </td>
      <td colspan="3">
        <p class="pUnsuitable" id="_conJi"><{if $hdjr.ji!='-'}><{$hdjr.ji}><{else}>诸事勿取<{/if}></p></td>
    </tr>
    <tr class="tr-su">
      <td class="thBg">
        <span class="su-icon blue">冲</span>
      </td>
      <td colspan="3">
        <p class="pAdversary" id="_conChong"><{$hdjr.chong}></p></td>
    </tr>
    <tr>
      <td class="thBg">岁次</td>
      <td colspan="3">
        <p class="txt-center" id="_conSuici"><{$hdjr.suici}></p></td>
    </tr>
    <tr>
      <td class="thBg">胎神</td>
      <td colspan="3">
        <p class="txt-center" id="_conTai"><{$hdjr.taishen}></p></td>
    </tr>
    <tr>
      <td class="thBg">五行</td>
      <td colspan="3">
        <p class="txt-center" id="_conWuxing"><{$hdjr.wuxing}></p></td>
    </tr>
  </tbody>
</table>
</div>
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
<{include file='./ffsm/footer.tpl'}>
<{include file='./ffsm/dl_ck.tpl'}>
</body>
</html>