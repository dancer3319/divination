<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8"/>
<title><{$sh_title}></title>
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
<meta content="telephone=no" name="format-detection"/>
<link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
<link href="/statics/ffsm/rtcaiyun/css/wap.min.css?v=0817" rel="stylesheet" type="text/css"/>
<link href="/statics/ffsm/rtcaiyun/css/index.css" rel="stylesheet" type="text/css"/>
<link href="/statics/ffsm/rtcaiyun/css/style.min.css" rel="stylesheet" type="text/css"/>
<script src="/statics/ffsm/rtcaiyun/js/vue.min.js"></script>
<script src="statics/ffsm/public/js/require/require.min.js" data-main="/statics/ffsm/public/js/common.min.js?v=0817"></script>
<script src="/statics/ffsm/rtcaiyun/js/jquery.min.js"></script>
<link rel="stylesheet" href="/statics/ffsm/rtcaiyun/css/public.css">
<link rel="stylesheet" href="/statics/ffsm/rtcaiyun/layui/css/layui.css">  
<script type="text/javascript">
  //支付后检测跳转
  <{if $yz_pay==1}>
       var inquiry_lock = 0;
    $(function () {
        setInterval(function () {
            inquiry(); 
        }, 1000);
    });
    function inquiry() {
        if (inquiry_lock) {
            return;
        }
        $.get('/?ct=pay&ac=scanquery&oid=<{$oid}>', {t: Date.parse(new Date())}, function (data) {
            if (data.status) {
                inquiry = 1;
                $('div.weixin .green').html('支付成功');
                window.location = data.url;
            }
        }, 'json');
    }
  <{/if}>
</script>
</head>
<body>
<script src="/statics/ffsm/rtcaiyun/layui/layui.js"></script>
<div id="order">
<div class="public_header">
<h1 class="public_h_con">实时运势</h1>
<a class="public_h_home" href="?ac=rtcaiyun"></a><a href="javascript:void(0)" class="public_h_menu"<{if $nologin}>  onclick="layui.use('layer', function(){layer.msg('请登陆后查看',{time: 20000,btn: ['去登陆','不了'],yes: function(index, layero){
location.href='?ac=userlogin&return_url=<{$return_url}>';
}});});"<{else}>:class="show" @click="chooseCoupon"<{/if}> >我的订单</a></div>
<div class="alert-marquee" id="alertMarquee"><p class="inner"><{$gundong}></p></div>
<div :class="show?'shadow':'shadowHide'" @click="chooseCoupon">

	</div>
<div id="coupon" :class="show?'coupon':'couponHide'">
		
		<div class="choseType">
			<div class="chose">
				<span @click="switchType(0)">已购订单({{couPonData.length}})</span>
			</div>
          	<div class="chose_gb">
				<span @click="switchType(1)">关闭</span>
			</div>
			<div :class="transNum?'redBorder2':'redBorder'"></div>
		</div>
		<div style="
    overflow: scroll;
    height: 100%;
">
			<div class="flexCol couponCard" v-for="(item,index) in dataObj" :key="index" @click="useCoupon(item.money,index+1,item.isUse)">
				<div v-if="item.isUse" class="flexRow couponCardHeader">
					<div class="flexCol money">
						<div class="sale">{{item.useMessage}}</div>
						<div class="word">订单:{{item.time}}</div>
					</div>
					<div class="flexCol date">
						<div class="title">姓名:{{item.name}}</div>
						<div class="word">生辰(阳):{{item.date}}</div>
					</div>
					<a v-bind:href="item.url" class="couponMsg">
						查看
					</a>
				</div>
				
				
			</div>
		</div>
	</div>
</div> 

<div class="container pay" style="padding-bottom:0px;">
  <div class="wrap">
    <div class="person">
      <div class="hd">
        <img src="statics/ffsm/bazimf/images/hd.jpg"></div>
      <div class="infos">
        <p>姓名：<{$names.username}></p>
        <p>性别：<{if $names.gender==1}>男<{else}>女<{/if}></p>
        <p>生日：<{$names.y}>年<{$names.m}>月<{$names.d}>日<{if $names.h>=0}><{$names.h}><{else}>未知<{/if}>时</p>
      </div>
    </div>
    <div class="gkxg"><p class="gk">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;没有人天生就没有财运，也没人一直财运顺遂！之所以会如此，完全是因为自己错失机遇，并且在不知危时，却盲目做出决定！导致财运一降再降，难以翻身。</p>
	</div>
	<div class="gkxg">
	<p class="gk">本系统<span class="red3">彻底改善</span>这类问题，效果如下：<br>
	1.抓住每一个机遇<br>
	2.彻底改善自身的财运<br>
	3.数据直观，人人都能成为大师<br>
	4.财运趋势一目了然，起伏明显<br>
	5.运势高分时刻，实现大突破<br>
	6.知晓低分时刻，避免漏财<br>
	7.精气神属性面板，洞悉自我</p>
	</div>

	  </p>
    <div class="price">
      <p class="tit1">测算项目：实时运势  【付费一次,可看前后6天】</p>
      <div class="clearfix inner">
	  
        <div class="fl">
          <span class="yh">限时优惠￥<{$money}>元</span>
          <s class="gray">原价：￥28.00</s></div>
        <div class="fr">
          <p>距优惠结束</p>
          <p class="red">
            <span class="h" id="hour_show">00：</span>
            <span class="f" id="minute_show">57：</span>
            <span class="m" id="second_show">42</span></p>
        </div>
      </div>
    </div>
    <div class="price">
      <p class="tit1 tcenter">支付方式</p>
      <div class="clearfix inner">
        <ul class="pay-type">
          <{if $sys_pay_type==0 || $sys_pay_type==1 || $sys_pay_type==3}>
          <a class="weixin" target="_self" href="/?ct=pay&ac=go&oid=<{$oid}>&type=1"><li class="on" id="wx_zf">
            <span class="pay-icon icon-wechat"></span>
            <span>微信支付</span>
            <span class="gopaywx">立即支付</span>
          </li></a>
            <{/if}>
          <{if $sys_pay_type==0 || $sys_pay_type==2 || $sys_pay_type==3}>
              <a class="alipay" target="_self" href="/?ct=pay&ac=go&oid=<{$oid}>&type=2"><li id="zfb_zf">
            <span class="pay-icon icon-zfb"></span>
            <span>支付宝支付</span>
            <span class="gopayzfb">立即支付</span>
          </li></a>
            <{/if}>
		<{if $sys_pay_type==0 || $sys_pay_type==4}>
 			 <a class="weixin" target="_self" href="/?ct=pay&ac=pay_go&oid=<{$oid}>&type=wxpay"><li class="on" id="wx_zf">
            <span class="pay-icon icon-wechat"></span>
            <span>微信支付</span>
            <em class="ico-arrow"></em>
          </li></a>
              <a class="alipay" target="_self" href="/?ct=pay&ac=pay_go&oid=<{$oid}>&type=alipay"><li id="zfb_zf">
            <span class="pay-icon icon-zfb"></span>
            <span>支付宝支付</span>
            <em class="ico-arrow"></em>
          </li></a>
		<{/if}>
          <{if $sys_pay_type==0 || $sys_pay_type==5}>
           <a class="alipay" target="_self" href="/?ct=pay&ac=paypal_go&oid=<{$oid}>"><li id="zfb_zf">
            <span class="pay-icon icon-paypal"></span>
            <span>paypal支付</span>
            <em class="ico-arrow"></em>
          </li></a>
         <{/if}>
		 <{if $jf_sys_on==1}>
 			 <a class="weixin" target="_self" href="/?ac=extgo&oid=<{$oid}>"><li class="on" id="wx_zf">
            <span class="pay-icon icon-extpay"></span>
            <span>积分支付</span>
            <em class="ico-arrow"></em>
          </li></a>
		<{/if}>
		<{if $vip_on==100}>
		 <a class="weixin" target="_self" href="/?ac=vip_pay&oid=<{$oid}>"><li class="on" id="wx_zf">
            <span class="pay-icon icon-vip_pay"></span>
            <span>vip免支付</span>
            <em class="ico-arrow"></em>
          </li></a>
          <{/if}>
        </ul>
      </div>
    </div>
    <p class="tip">观表抓运势，财运滚滚来</p>
    <p class="tip red3">知天悉命 对症下药</p>
    <p class="tip">从现在，真正改变人生</p>
     <br>
	<div class="info J_testFixedShow">
      <div class="box-top"></div>
      <div class="box-center">
        <h3 class="tit2">
          <img src="/statics/ffsm/rtcaiyun/img/title_l1.png"></h3>
        <p>
          <span class="blur">你对金钱的态度非常务实，相信一分耕耘才有一分收你对金钱的态度非常务实，相信一分耕耘才有一分收你对金钱的态度非常务实相信一分耕耘才有一分收你对金钱的态度非常务实信一分耕耘才有一分收你对金钱的态度非常务实相信一分耕耘才有一分收你对金钱的态度非常务实相信一分耕耘才有一分</span></p>
        <p class="btn-lock J_payPopupShow" style="margin-top:1.2rem;">支付后查看分析</p>
        <div class="genre">
          <p>1、我的精气神属性
            </p>
          <p>2、我的实时财运指数</p>
          <p>3、我的财运如何提升</p>
		  </div>
      </div>
      <div class="box-bottom"></div>
    </div>
	<div class="info J_testFixedShow">
      <div class="box-top"></div>
      <div class="box-center">
        <h3 class="tit2">
          <img src="/statics/ffsm/rtcaiyun/img/title_l2.png"></h3>
        <p>
          <span class="blur">你对金钱的态度非常务实，相信一分耕耘才有一分收你对金钱的态度非常务实，相信一分耕耘才有一分收你对金钱的态度非常务实相信一分耕耘才有一分收你对金钱的态度非常务实信一分耕耘才有一分收你对金钱的态度非常务实相信一分耕耘才有一分收你对金钱的态度非常务实相信一分耕耘才有一分</span></p>
        <p class="btn-lock J_payPopupShow" style="margin-top:1.2rem;">支付后查看分析</p>
        <div class="genre">
          <p>1、我是不是天生没有运气？
            </p>
          <p>2、到底什么时候我会交好运？</p>
          <p>3、有没有积累气运的方法？</p>
		  </div>
      </div>
      <div class="box-bottom"></div>
    </div>
    <div class="info J_testFixedShow">
      <div class="box-top"></div>
      <div class="box-center">
        <h3 class="tit2">
          <img src="/statics/ffsm/rtcaiyun/img/title_l3.png"></h3>
        <p>
          <span class="blur">你对金钱的态度非常务实，相信一分耕耘才有一分收你对金钱的态度非常务实，相信一分耕耘才有一分收你对金钱的态度非常务实相信一分耕耘才有一分收你对金钱的态度非常务实信一分耕耘才有一分收你对金钱的态度非常务实相信一分耕耘才有一分收你对金钱的态度非常务实相信一分耕耘才有一分</span></p>
        <p class="btn-lock J_payPopupShow" style="margin-top:1.2rem;">支付后查看分析</p>
        <div class="genre">
          <p>1、吉时及时把握，劣时及时规避
            </p>
          <p>2、实时数据显示，直观具体</p>
          <p>3、把握自身财运趋势，扬长避短</p>
		  </div>
      </div>
      <div class="box-bottom"></div>
    </div>
    <div class="info">
      <div class="box-top"></div>
      <div class="box-center">
        <h3 class="tit2">
          <img src="/statics/ffsm/rtcaiyun/img/title_l4.png"></h3>
        <p>
          <span class="blur">你对金钱的态度非常务实，相信一分耕耘才有一分收你对金钱的态度非常务实，相信一分耕耘才有一分收你对金钱的态度非常务实相信一分耕耘才有一分收你对金钱的态度非常务实信一分耕耘才有一分收你对金钱的态度非常务实相信一分耕耘才有一分收你对金钱的态度非常务实相信一分耕耘才有一分</span></p>
        <p class="btn-lock J_payPopupShow" style="margin-top:.8rem;">支付后查看分析</p>
        <div class="genre">
          <p>1、怎么让好运越来越多？
            </p>
          <p>2、什么时候做什么事能养财运？</p>
          <p>3、命里财运有限，如何滋养？</p>
        </div>
      </div>
      <div class="box-bottom"></div>
    </div>
   
    <div class="info">
      <img src="/statics/ffsm/rtcaiyun/img/title_l5.png"></div>
  </div>
<div class="ainuo_foot_nav cl" id="testFixedBtn" style="display: none;">
    <ul>
     <li><a href="?ac=rtcaiyun"><i class="shouye_1"></i><p>测算首页</p></a></li>
     <li><a href="/?ac=history"><i class="wddd_1"></i><p>订单查询</p></a></li>
     <li><a href="?ac=rtcaiyun"class="botpost"><em><i class="lijics_1"></i></em><p>重新测算</p></a></li>
     <li><a href="javascript:void(0)" onclick="dcwjalert()"><i class="gengduo_1"></i><p>建议反馈</p></a></li>
     <li><a href="/?ac=member"><i class="grzx_1"></i><p>个人中心</p></a></li>
    </ul>
</div>
<style type="text/css">
.ainuo_foot_nav{display: block; padding: 2px 0; background:#ee4d4c; position: fixed; bottom: 0; width: 100%; z-index: 99999;max-width: 640px;}
.ainuo_foot_nav li{width: 20%; text-align: center; float: left;}
.ainuo_foot_nav li a{width: 100%; display: block;}
.ainuo_foot_nav .foothover i{color: #f13030;}
.ainuo_foot_nav li i{display: block; line-height: 25px; height: 25px; margin: auto; padding: 0; width: 25px; overflow: hidden; background-size: 100%;}
.ainuo_foot_nav li a.botpost{position: relative; margin-top: -11px; background-color: rgba(0,0,0,0.0);}
.ainuo_foot_nav li a.botpost em{background: #ffffff; padding: 2px; border: 1px solid #f78990; display: block; border-radius: 50%; width: 30px; height: 30px; margin: 0 auto; margin-bottom: 2px;padding-bottom: 0px;}
.ainuo_foot_nav li p{overflow: hidden; font-size: 12px; height: 16px; line-height: 16px; color: #fff; font-weight: 400;}
.shouye_1{background: url(/statics/ffsm/public/images/shouye.png) no-repeat;}
.wddd_1{background: url(/statics/ffsm/public/images/dingdan.png) no-repeat;}
.lijics_1{background: url(/statics/ffsm/public/images/suan.png) no-repeat;}
.gengduo_1{background: url(/statics/ffsm/public/images/gengduo.png) no-repeat;}
.grzx_1{background: url(/statics/ffsm/public/images/grzx.png) no-repeat;}
</style>
  <p style="height:.9rem;background-color: #b10400"></p>
</div>
<div class="public_pay_popup" id="publicPayPopup">
	<div class="public_pp_box">
		<div class="public_pp_close" id="publicPPClose">
			X
		</div>
		<div class="public_pp_tit">
			解锁查看所有测算结果
		</div>
		<div class="public_pp_price">
			<span>统一鉴定价：</span><strong>￥<{$money}>元</strong>
		</div>
		<div class="public_pay_box">
			<{if $sys_pay_type==0 || $sys_pay_type==1 || $sys_pay_type==3}>
			<a class="weixin" target="_self" href="/?ct=pay&ac=go&oid=<{$oid}>&type=1">微信安全支付</a>
          <{/if}>
             <{if  $sys_pay_type==0 || $sys_pay_type==2 || $sys_pay_type==3}>
            <a class="alipay" target="_self" href="/?ct=pay&ac=go&oid=<{$oid}>&type=2">支付宝安全支付</a>
          <{/if}>
            <{if  $sys_pay_type==0 || $sys_pay_type==4}>
          <a class="weixin" target="_self" href="/?ct=pay&ac=pay_go&oid=<{$oid}>&type=wxpay">微信支付</a>
          <a class="alipay" target="_self" href="/?ct=pay&ac=pay_go&oid=<{$oid}>&type=alipay">支付宝支付</a>
              <{/if}>
            <{if  $sys_pay_type==0 || $sys_pay_type==5}>
          <a class="paypal" target="_self" href="/?ct=pay&ac=paypal_go&oid=<{$oid}>">paypal支付</a>
            <{/if}>
			<{if $jf_sys_on==1}>
				<a class="m-extpay" target="_self" href="/?ac=extgo&oid=<{$oid}>">积分支付</a>
            <{/if}>
            <{if $vip_on==100}>
				<a class="m-vippay" target="_self" href="/?ac=vip_pay&oid=<{$oid}>">vip免支付</a>
			<{/if}>
		</div>
	</div>
</div>

<script type="text/javascript">
function dcwjalert(){
    layui.use('layer', function(){
        layer.open({
          type: 2,
          title: '建议反馈',
          shadeClose: true,
          shade: 0.8,
          area: ['100vw', '100vh'],
          content: 'https://wj.qq.com/s2/6019766/97dc/' 
        });
      });
}
    var home = new Vue({
        el:'#order',
        data:{

            transNum:0,
           
            couPonData:[
			 <{foreach key =k item=i from=$my_order}>
    <{if $i.oid  && $i.status==1}>
	{"name":'<{$i.data.username}>',"time":"<{$i.createtime|date_format:'%m月%d'}>","useMessage":"<{$i.typename}>","date":"<{$i.data.y}>-<{$i.data.m}>-<{$i.data.d}> <{$i.data.h}>时","url":"<{$i.url}>",'isUse':true},
     <{/if}>
 <{/foreach}> 
            ],
            dataObj:[],
            show:false,
            useMoney:'',
            yesClick:null
        },
        created(){
            this.dataObj = this.couPonData;
        },
        methods:{
            switchType(val){
                this.transNum = val;
                switch (val) {
                    case 0:
                        this.dataObj = this.couPonData;
                        break;
                    case 1:
                        this.show = !this.show;
                        break;
                }
            },
            chooseCoupon(){
                this.show = !this.show;
            }
        }
    });
	<{foreach key =k3 item=i3 from=$my_order}>
		<{if $i3.oid && $i3.endtime>$i3.dqtime && $i3.status==1}>
		setTimeout(function(){
		layui.use('layer', function(){
			layer.msg('亲！您已有测算的订单。<br>请点击右上角【我的订单】进行查看。', {
			time: 20000, 
			btn: ['知道了'],
			id: 'LAY_order',
			anim: 2,
          	shade:0.5,
			btnAlign:'c'
		  });
		  });
		  },2000);
		  <{nocache}>
		 <{/if}>
	<{/foreach}>
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
    	}
    })();
    
	
    //弹出支付功能
    (function(){
			var pp=$('#publicPayPopup');
            var ppClose=$('#publicPPClose');
            var topShow=$(".J_payBottomShow");
            var ppShow=$(".J_payPopupShow");
				ppShow.on('click',function(){
                    pp.show();
                });
				 ppClose.on('click',function(){
                    pp.hide();
                })
       
    })(jQuery);
   
</script>
<script type="text/javascript">
var intDiff = parseInt(5734);//倒計時總秒數量
function timer(intDiff){
	window.setInterval(function(){
	var day=0,
		hour=0,
		minute=0,
		second=0;//時間默認值		
	if(intDiff > 0){
		day = Math.floor(intDiff / (60 * 60 * 24));
		hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
		minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
		second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
	}
	if (minute <= 9) minute = '0' + minute;
	if (second <= 9) second = '0' + second;
	$('#day_show').html(day+"天");
	$('#hour_show').html('<s id="h"></s>'+hour+'小時');
	$('#minute_show').html('<s></s>'+minute+'分');
	$('#second_show').html('<s></s>'+second+'秒');
	intDiff--;
	}, 1000);
} 

$(function(){
	timer(intDiff);
});	

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
<{include file='./ffsm/ssys/footer.tpl'}>
<{include file='./ffsm/dl_ck.tpl'}>
</body>
</html>