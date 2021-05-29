<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8"/>
<title>购买VIP会员-<{$zhanming}></title>
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
<meta content="telephone=no" name="format-detection"/>
<link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
<link href="/statics/ffsm/public/wap.min-v=0817.css" rel="stylesheet" type="text/css"/>
<link href="/statics/VIP/vip.css" rel="stylesheet" type="text/css"/>
<{include file='./ffsm/wx_share.tpl'}>
<script src="https://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
<header class="public_header">
<h1 class="public_h_con">购买VIP会员</h1>
<a class="public_h_home" href="/"></a><a href="/?ac=member" class="public_h_menu">个人中心</a></header>

<div class="header fix">
<div class="headerbg"></div>
    <span class="uhead">
        <a href="/?ac=member">
            <b class="relative">
                <img class="head" src="<{if $member.headimgurl}><{$member.headimgurl}><{else}>/statics/user/images/userlogo.png<{/if}>">
            </b>
        </a>
    </span>
    
    <a href="/?ac=member" class="usnmae"><{$username}>正在加入VIP会员</a><nav>
    </nav>
</div>
<section class="moneylist fix" style="margin-top:10px;">
<nav class="guclearfix"><div class="hg">会员类型</div>
                <div class="service-list mr_35 actives" data-money="0.01" data-time="365" data-buygroupid="1">
                <em><img src="/statics/VIP/114451zl79x3oy2jrlge22.png" alt=""></em>
                <div class="ct">
                <b>终身VIP会员</b>
                <p class="ms">¥<{$money_z}>元 / 有效期 永久使用</p>
                </div>
                <div class="quanxian" style="display:none"><span class="tq">终身免费测试所有项目</span><span class="tq">提供专业解答</span>
                <div class="mm-btn" id="btn"><a href="?ac=vip&class=3" id="Submit">立即开通</a></div>
                </div>
           </div>
            <div class="service-list mr_35 " data-money="200" data-time="365" data-buygroupid="2">
                <em><img src="/statics/VIP/114527y01u909t9l9tuy1w.png" alt=""></em>
                <div class="ct">
                <b>包年VIP会员</b>
                <p class="ms">¥<{$money_y}>元 / 有效期 365天</p>
                </div>
                <div class="quanxian" style="display:none"><span class="tq">365天内免费测试所有项目</span><span class="tq">提供专业解答</span>
                <div class="mm-btn" id="btn"><a href="?ac=vip&class=2" id="Submit">立即开通</a></div>
                </div>
           </div>
            <div class="service-list mr_35 " data-money="200" data-time="365" data-buygroupid="2">
                <em><img src="/statics/VIP/114527y01u909t9l9tuy1w.png" alt=""></em>
                <div class="ct">
                <b>包月VIP会员</b>
                <p class="ms">¥<{$money_m}>元 / 有效期 30天</p>
                </div>
                <div class="quanxian" style="display:none"><span class="tq">30天内免费测试所有项目</span><span class="tq">提供专业解答</span>
                <div class="mm-btn" id="btn"><a href="?ac=vip&class=1" id="Submit">立即开通</a></div>
                </div>
                
                
           </div>
         </nav>
</section>

<section class="fix subboxs" style=" padding:0px 15px 20px 15px; margin-top:20px;   ">
        <div class="subbox">
            <div class="hg">尊贵特权</div>
            <div class="czcontents" style="line-height:50px">
               <div class="quanxian" id="viewtq">
                   <span class="tq">期间所有测试免费</span><span class="tq">一对一专属客服</span><span class="tq">会员身份标识</span><span class="tq">提供专业解答</span><span class="tq">页面无广告</span>
                   <div class="mm-btn" id="btn"><a href="?ac=vip&class=3" id="Submit">立即开通</a></div>
                   </div>
                   
            </div>
        </div>
</section>


<{if $uid<=0}>
	<div class="dengluts">
        <div class="tishi_1"><p>未登录，不能购买vip服务。</P><a href="?ac=userlogin" class="J_ajax_submit_btnsub">立即登录</a></div>
      </div>
<{/if}>

            <script>
            jQuery(function() {
jQuery(".service-list").on("click", function() {
var that=jQuery(this);
                            that.siblings().removeClass("actives");
                            that.addClass("actives");
var money=that.attr("data-money"),
validity=that.attr("data-time"),
buygroupid=that.attr("data-buygroupid"),
tqs=that.children(".quanxian").html();
jQuery("#countNum").html(money);
if(validity==0){
jQuery("#validity").html('永久有效');
jQuery("#t").hide();
}else{
jQuery("#validity").html(validity);
jQuery("#t").show();
}
jQuery("#buygroupid").val(buygroupid);
jQuery("#viewtq").html(tqs);

                               
                        });

jQuery("#charge-source-list li").on("click", function() {
                            jQuery(this).siblings().removeClass("active");
                            jQuery(this).addClass("active");
                               
                                var source=jQuery(this).attr("source");
                                if(source==1){
                                    jQuery("#ewm").css("height","0px").hide().html('');
jQuery("#Submit").html('立即开通');

                                }else{
                                    jQuery("#ewm").show();
                                }
                                jQuery("#zftype").attr("value",source);
                        });		

jQuery("#Submit").on("click", function() {
if(jQuery("#ewm").html()!=''){
return false;
}
var uids='0';
if(uids<1){
warning('请登陆',2);
 setTimeout(function() {window.location.href='/';}, 4000);
return false;
}

                        var zftype=jQuery('#zftype').val();
                        if(!zftype){
                            return false;
                        }
                        
                        if(zftype==1){
                            jQuery('#alipayment').submit();
                        }else{
jQuery('#ewm').css("height","258px").html('<img src="source/plugin/keke_group/template/images/loading.gif" />');
                            jQuery.get('/', {
                                 zftype:zftype,buygroupid:jQuery("#buygroupid").val()
                            },function (data){
                                if(data.err){
jQuery('#ewm').css("height","0px").hide();
                                    warning(data.err,2);
                                }else if(data.ewmurl){
jQuery('#ewm').html('<img src="'+data.ewmurl+'">');
var orderid=data.orderid;
setInterval(function(){
jQuery.get('/', {orderid:orderid},function (datas){
if(datas.state==1){window.location.href = '/';return false;}else{return false;}
}, "json");
},2000); 
jQuery("#Submit").html('打开微信扫码支付');
                                }
                            }, "json");
                        }
                        });
});
</script>
                  <script>
            function warning(text,type){
var ico='ld.gif';
                if(type==1){
                    ico='ok.png';
                }else if(type==2){
                    ico='no.png';
                }
text='<img src="source/plugin/keke_group/template/images/'+ico+'"><br>'+text;
                jQuery('.keke_warning').show().html(text);
                if(type!=3){
                    setTimeout(function() {jQuery('.keke_warning').fadeOut();}, 3000);
                }
            }
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
<{include file='./ffsm/footers.tpl'}>
<{include file='./ffsm/dl_ck.tpl'}>
</body>
</html>