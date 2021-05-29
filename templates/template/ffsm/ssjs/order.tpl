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
<link rel="stylesheet" href="/statics/ffsm/ssjs/css/style.css">

<link rel="stylesheet" href="/statics/ffsm/ssjs/css/font/iconfont.css">
<link href="/statics/ffsm/ssjs/css/wap.css" rel="stylesheet" type="text/css"/>
<link href="/statics/ffsm/ssjs/css/index.css" rel="stylesheet" type="text/css"/>
<link href="/statics/ffsm/ssjs/css/style.min.css" rel="stylesheet" type="text/css"/>
<script src="/statics/ffsm/ssjs/js/vue.min.js"></script>
<script src="statics/ffsm/public/js/require/require.min.js" data-main="/statics/ffsm/public/js/common.min.js?v=0817"></script>
<script src="/statics/ffsm/ssjs/js/jquery.min.js"></script>
<link rel="stylesheet" href="/statics/ffsm/ssjs/css/public.css">
<link rel="stylesheet" href="/statics/ffsm/ssjs/layui/css/layui.css">  
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
<script src="/statics/ffsm/ssjs/layui/layui.js"></script>
<div id="order">
<div class="public_header">
<a class="public_h_con" href="/?ac=ssjs">实时健身</a><a href="javascript:void(0)" class="public_h_menu"<{if $nologin}>  onclick="layui.use('layer', function(){layer.msg('请登陆后查看',{time: 20000,btn: ['去登陆','不了'],yes: function(index, layero){
location.href='?ac=userlogin&return_url=<{$return_url}>';
}});});"<{else}>:class="show" @click="chooseCoupon"<{/if}> ><img src="/statics/ffsm/ssjs/img/wddd.png" /></a></div>
<div class="alert-marquee" id="alertMarquee"><span><img src="/statics/ffsm/ssjs/img/laba.png" /></span><p class="inner"><{$gundong}></p></div>
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

<div class="container pay" style="padding-bottom: 0;">
  <div class="wrap">
    <div class="person <{if $names.gender==1}>person_n<{else}>person_v<{/if}>">
      <div class="hd">
        <img src="statics/ffsm/bazimf/images/hd.jpg"></div>
      <div class="infos">
        <p class="name"><{$names.username}><{if $names.gender==1}><span class="male">♂</span><{else}><span class="female">♀</span><{/if}></p>
		<p class="birthday" id="edit_hour">阳历：<{$names.y}>年<{$names.m}>月<{$names.d}>日 <{$names.h}>时</p>
		<p class="birthday">阴历：<{$names.lDate}></p>
      </div>
	  
    </div>
	<{include file='./ffsm/ssjs/ss_icon.tpl'}>
	<div class="public_bg_color">
		<div class="center_bg">
		
			<div class="im_info_t_bg">
			</div>
			<div class="im_info">
				<div class="im_info_l_bg">
				<img src="/statics/ffsm/ssjs/img/info_l_bg.png" alt="" class="bg5">
				</div>
				<div class="im_info_c">
				

					<div class="im_info_c_c">
				</br>
<p>健身，除了科学和自律，正确的时间段格外重要。莫因错过时机，白白流汗。 “实时健身”为你展示全天24小时的“精气神”数据及健身率，高低好坏，一目了然，辨别简单。解锁自身属性，抓住高效时间点，你会发现，你的健身效果事半功倍！</p>
					</div>
			
				</div>
				<div class="im_info_r_bg">
				<img src="/statics/ffsm/ssjs/img/info_r_bg.png" alt="" class="bg5">	
				</div>
			</div>
			<div class="im_info_bt_bg">
				
			</div>
		</div>
	</div>
    
	<div class="public_bg_color J_testFixedShow" id="paytype">
		<div class="price">
		  <p class="tit1 left_l_bf">测算项目：实时健身 【付费一次,可看前后6天】</p>
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
	</div>
    <div class="price2">
     
      <div class="clearfix">
        <ul class="pay-type">
          <{if $sys_pay_type==0 || $sys_pay_type==1 || $sys_pay_type==3}>
          <a class="weixin" target="_self" href="/?ct=pay&ac=go&oid=<{$oid}>&type=1"><li class="on" id="wx_zf">
            <span class="pay-icon icon-wechat"></span>
            <span>微信支付</span>
          </li></a>
            <{/if}>
          <{if $sys_pay_type==0 || $sys_pay_type==2 || $sys_pay_type==3}>
              <a class="alipay" target="_self" href="/?ct=pay&ac=go&oid=<{$oid}>&type=2"><li id="zfb_zf">
            <span class="pay-icon icon-zfb"></span>
            <span>支付宝支付</span>
           
          </li></a>
            <{/if}>
		<{if $sys_pay_type==0 || $sys_pay_type==4}>
 			 <a class="weixin" target="_self" href="/?ct=pay&ac=pay_go&oid=<{$oid}>&type=wxpay"><li class="on" id="wx_zf">
            <span class="pay-icon icon-wechat"></span>
            <span>微信支付</span>
           
          </li></a>
              <a class="alipay" target="_self" href="/?ct=pay&ac=pay_go&oid=<{$oid}>&type=alipay"><li id="zfb_zf">
            <span class="pay-icon icon-zfb"></span>
            <span>支付宝支付</span>
            
          </li></a>
		<{/if}>
          <{if $sys_pay_type==0 || $sys_pay_type==5}>
           <a class="alipay" target="_self" href="/?ct=pay&ac=paypal_go&oid=<{$oid}>"><li id="zfb_zf">
            <span class="pay-icon icon-paypal"></span>
            <span>paypal支付</span>
           
          </li></a>
         <{/if}>
		 <{if $jf_sys_on==1}>
 			 <a class="weixin" target="_self" href="/?ac=extgo&oid=<{$oid}>"><li class="on" id="wx_zf">
            <span class="pay-icon icon-extpay"></span>
            <span>积分支付</span>
            
          </li></a>
		<{/if}>
		<{if $vip_on==100}>
		 <a class="weixin" target="_self" href="/?ac=vip_pay&oid=<{$oid}>"><li class="on" id="wx_zf">
            <span class="pay-icon icon-vip_pay"></span>
            <span>vip免支付</span>           
          </li></a>
          <{/if}>
        </ul>
      </div>
    </div>
	
	<div class="public_bg_color" style="padding-bottom: 0;">
		<div class="center_bg">
		
			<div class="im_info_t_bg">
			</div>
			<div class="im_info">
				<div class="im_info_l_bg">
				<img src="/statics/ffsm/ssjs/img/info_l_bg.png" alt="" class="bg5">
				</div>
				<div class="im_info_c">
				
					<div class="im_info_c_t">
					解锁后，为您展示
					</div>
					<div class="im_info_c_c jsyd">
                      </br>
				<p>一、精气神属性分值</p></br>
				<p>二、精气神人格属性面板</p></br>
              	<p>三、您的健身值</p></br>
          		<p>四、4项个性隐藏值</p></br>
      			<p>五、24小时运势表</p>

					</div>
			
				</div>
				<div class="im_info_r_bg">
				<img src="/statics/ffsm/ssjs/img/info_r_bg.png" alt="" class="bg5">	
				</div>
			</div>
			<div class="im_info_bt_bg">
				
			</div>
		</div>
		<div class="public_btn_s">
        	<a href="#paytype" class="J_ajax_submit_btnsub">立即解锁</a>
		</div>
	</div>
	
  </div>
<div class="ainuo_foot_nav cl" id="testFixedBtn" style="display: none;">
    <ul>
     <li><a href="?ac=ssjs"><i class="shouye_1"></i><p>测算首页</p></a></li>
     <li><a href="/?ac=history"><i class="wddd_1"></i><p>订单查询</p></a></li>
     <li><a href="?ac=ssjs"><em><i class="lijics_1"></i></em><p>重新测算</p></a></li>
     <li><a href="javascript:void(0)" onclick="dcwjalert()"><i class="gengduo_1"></i><p>建议反馈</p></a></li>
     <li><a href="/?ac=member"><i class="grzx_1"></i><p>个人中心</p></a></li>
    </ul>
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
</script>
<{include file='./ffsm/ssjs/footer.tpl'}>
<{include file='./ffsm/ss_share.tpl'}>
</body>
</html>