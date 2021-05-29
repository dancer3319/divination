<{include file="admin/header.tpl"}>
<style>
    .bh {
        line-height:24px;
    }
    dl.m_dl {
        margin-left:20px;
        margin-top:10px;
    }
    dl.m_dl dt {
        line-height:48px;
        border-bottom:1px dashed #eee;
        font-size:14px;
    }
    dl.m_dl dd {
        padding-left:20px;
        line-height:36px;
        border-bottom:1px dashed #eee;
    }
</style>
<dl class="search-class" style="border-bottom:1px solid #eee">
    <h3 class='bh'>
        你好：<font color='red'><{$users.user_name}></font>欢迎登录<font color='red'><{frame_union do='groups' var=$users.groups}></font>后台
    </h3>
</dl>
<div style="padding-left:10px;>
<div style="">
    <div class="title" style="border-bottom:1px dashed #ccc;text-align: center;padding: 20px 0px;">
    <p style="font-size: 30px;font-weight: bold;">我的代理总收益：<font color='#00b98d'><{$users.dl_zjf}>￥</font></p>
    <p style="font-size: 14px;">我的余额：<font color='#ff5757'><{$users.dl_syjf}>￥</font></p>
    </div>
    <div style="line-height:28px;width:460px;padding-top:10px;float: left;">
   <span style="display:-moz-inline-box; display:block; width:400px;">测算项目：所有测算项目主页  <font color='red'>支持主页上所有项目提成</font><br/>
   <textarea cols="20" rows="10" id="biao1" style="width: 360px;height: 20px;">https://qcapism.xlibbs.com/?dl=<{$users.uid}></textarea><br/><input type="button" onClick="copyUrl2(1)" value="点击复制链接" /></span><br/>
   <span style="display:-moz-inline-box; display:block; width:400px;">测算项目：电脑端测算页面  <font color='red'>59.9 ￥</font><br/>
   <textarea cols="20" rows="10" id="biao2" style="width: 360px;height: 20px;">https://qcapism.xlibbs.com/?ac=pc&dl=<{$users.uid}></textarea><br/><input type="button" onClick="copyUrl2(2)" value="点击复制链接" /> 
   </span><br/>
   <span style="display:-moz-inline-box; display:block; width:400px;">测算项目：H5合婚测算  <font color='red'>59.9 ￥</font><br/>
   <textarea cols="20" rows="10" id="biao3" style="width: 360px;height: 20px;">https://qcapism.xlibbs.com/?ac=hehun&dl=<{$users.uid}></textarea><br/><input type="button" onClick="copyUrl2(3)" value="点击复制链接" /> 
   </span><br/>
   <span style="display:-moz-inline-box; display:block; width:400px;">测算项目：H5月老姻缘测算  <font color='red'>39.9 ￥</font><br/>
   <textarea cols="20" rows="10" id="biao4" style="width: 360px;height: 20px;">https://qcapism.xlibbs.com/?ac=bzyy&dl=<{$users.uid}></textarea><br/><input type="button" onClick="copyUrl2(4)" value="点击复制链接" /> 
   </span><br/>
   <span style="display:-moz-inline-box; display:block; width:400px;">测算项目：H5八字详批  <font color='red'>58.8 ￥</font><br/>
   <textarea cols="20" rows="10" id="biao5" style="width: 360px;height: 20px;">https://qcapism.xlibbs.com/?ac=bazi&dl=<{$users.uid}></textarea><br/><input type="button" onClick="copyUrl2(5)" value="点击复制链接" /> 
   </span><br/>
</div>
    <div style="line-height:28px;width:460px;padding-top:10px;float: left;">
   <span style="display:-moz-inline-box; display:block; width:400px;">测算项目：H52019爱情运分析  <font color='red'>29.9 ￥</font><br/>
   <textarea cols="20" rows="10" id="biao6" style="width: 360px;height: 20px;">https://qcapism.xlibbs.com/?ac=aiqingyun&dl=<{$users.uid}></textarea><br/><input type="button" onClick="copyUrl2(6)" value="点击复制链接" /> 
   </span><br/>
   <span style="display:-moz-inline-box; display:block; width:400px;">测算项目：H5姓名配对  <font color='red'>9.9 ￥</font><br/>
   <textarea cols="20" rows="10" id="biao7" style="width: 360px;height: 20px;">https://qcapism.xlibbs.com/?ac=xmpd&dl=<{$users.uid}></textarea><br/><input type="button" onClick="copyUrl2(7)" value="点击复制链接" /> 
   </span><br/>
   <span style="display:-moz-inline-box; display:block; width:400px;">测算项目：H5八字详批精批  <font color='red'>29.9 ￥</font><br/>
   <textarea cols="20" rows="10" id="biao8" style="width: 360px;height: 20px;">https://qcapism.xlibbs.com/?ac=bazijp&dl=<{$users.uid}></textarea><br/><input type="button" onClick="copyUrl2(8)" value="点击复制链接" /> 
   </span><br/>
   <span style="display:-moz-inline-box; display:block; width:400px;">测算项目：H5许愿点灯  <font color='red'>8.8 ￥</font><br/>
   <textarea cols="20" rows="10" id="biao9" style="width: 360px;height: 20px;">https://qcapism.xlibbs.com/?ac=xydd&dl=<{$users.uid}></textarea><br/><input type="button" onClick="copyUrl2(9)" value="点击复制链接" /> 
   </span><br/>
   <span style="display:-moz-inline-box; display:block; width:400px;">测算项目：H5号码解析  <font color='red'>8.8 ￥</font><br/>
   <textarea cols="20" rows="10" id="biao10" style="width: 360px;height: 20px;">https://qcapism.xlibbs.com/?ac=hmjx&dl=<{$users.uid}></textarea><br/><input type="button" onClick="copyUrl2(10)" value="点击复制链接" /> 
   </span><br/>
</div>
    <div style="line-height:28px;width:525px;padding-top:10px;float: left;">
<h2 style="text-align:center;">
	<span style="color:#E53333;">分销代理推广链接说明</span> 
</h2>
<p>
	复制你的专属推广链接，只要用户下单你即可获取提成。
</p>
<p>
	<strong>关于提现：</strong>请到提现管理栏目，申请提现，提现方式为微信或者支付宝，任何时间内申请提现最迟24小时内到账。
</p>
<p>
	<strong>分成比例：</strong>请咨询一级管理员或者联系开发者QQ12345678，分销提成比例一级管理员可在后台设置，可设置一二级代理提成比例。
</p>
<p>
	如果你有任何疑问，请联系QQ：12345678获取解答！祝我们合作共赢！
</p>
<p>
	<br />
</p>
<h2 style="text-align:center;">
	<span style="color:#E53333;">我的推广二维码</span> 
</h2>
<td><img src="https://api.nbhao.org/v1/qrcode/make?text=https://qcapism.xlibbs.com/?dl=<{$users.uid}>" width="150" height="150" style="border: 1px solid rgba(0, 0, 0, .2); padding:4px; margin-top:5px;display: block;margin: 0 auto;"></td>
</div>
</div>

</div>

<script type="text/javascript"> 
function copyUrl2(str) 
{ 
var Url2=document.getElementById("biao"+str); 
Url2.select(); // 选择对象 
document.execCommand("Copy"); // 执行浏览器复制命令 
alert("已复制好，可贴粘。"); 
} 
</script> 
</body>
</html>