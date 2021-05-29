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
<link href="/statics/ffsm/sslg/css/wap.css" rel="stylesheet" type="text/css"/>
<link href="/statics/ffsm/sslg/css/style.min.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="/statics/ffsm/bazimf/sty.css"/>
<{include file='./ffsm/wx_share.tpl'}>
<script src="/statics/ffsm/sslg/js/vue.min.js"></script>
<script src="/statics/ffsm/sslg/js/jquery.min.js"></script>
<script src="statics/ffsm/public/js/require/require.min.js"></script>
<script src="statics/ffsm/public/js/common.min.js"></script>
<link rel="stylesheet" href="/statics/ffsm/sslg/css/public.css">
<link rel="stylesheet" href="/statics/ffsm/sslg/layui/css/layui.css"> 
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
</head>
<body>
<script src="/statics/ffsm/sslg/layui/layui.js"></script>
<div id="order">
<div class="public_header">
<a class="public_h_con" href="/?ac=sslg">实时灵感</a><a href="javascript:void(0)" class="public_h_menu"<{if $nologin}>  onclick="layer.msg('请登陆后查看',{time: 20000,btn: ['去登陆','不了'],yes: function(index, layero){
location.href='?ac=userlogin&return_url=<{$return_url}>';
}});"<{else}>:class="show" @click="chooseCoupon"<{/if}> ><img src="/statics/ffsm/sslg/img/wddd.png" /></a></div>
<{if $gundong}><div class="alert-marquee" id="alertMarquee"><span><img src="/statics/ffsm/sslg/img/laba.png" /></span><p class="inner"><{$gundong}></p></div><{/if}>
<{if $my_order_num>1}><div :class="show?'shadowHide':'shadow'" @click="chooseCoupon"></div><div id="coupon" :class="show?'couponHide':'coupon'">
  <{else}><div :class="show?'shadow':'shadowHide'" @click="chooseCoupon"></div>
    <div id="coupon" :class="show?'coupon':'couponHide'"><{/if}>	
		<div class="choseType">
			<div class="chose">
				<span @click="switchType(0)">已购订单({{couPonData.length}})</span>
			</div>
          	<div class="chose_gb">
				<span @click="switchType(1)">关闭</span>
			</div>
			<div :class="transNum?'redBorder2':'redBorder'"></div>
		</div>
		<div style="overflow: scroll;height: 100%;">
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

<div class="public_banner"  id="submit2">
	<img src="/statics/ffsm/sslg/img/banner.jpg" alt="实时灵感"/>
</div>

<{include file='./ffsm/sslg/ss_icon.tpl'}>

<div class="public_bg_from">
	<form class="J_ajaxForm J_testFixedShow" id="submit1" action="?ac=sslg" name="login" method="post" onSubmit="return checkForm();">
		<div class="public_form_wrap" id="miaodian">
			<ul>
				<li>
				<div class="left">
					您的姓名: 
				</div>
				<div class="auto divider">
					<input type="text" class="bg_no" id="username" name="username" placeholder="请输入名字（必须汉字）" value=""/>
				</div>
				</li>
				<li>
				<div class="left">
					您的性别:
				</div>
				<div class="auto sex sex J_sex divider">
					<span class="cur" data-value="1"><i></i><font>男</font></span><span data-value="0"><i></i><font>女</font></span><input type="hidden" name="gender" value="1"/>
				</div>
				</li>
				<li>
				<div class="left">
					出生日期:
				</div>
				<div class="auto">
					<input type="text" id="birthday" data-input-id="b_input" class="Js_date" data-type="0" value="请选择出生日期" placeholder="请选择日期" data-toid-hour="birthday">
				</div>
				</li>
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
        	<input type="button" value="立即测算" class="J_ajax_submit_btnsub">
		</div>
		<div class="form_bottom_txt">
			<span>已为<b>9346</b>人查看2021年实时灵感</span>
		</div>
	</form>
	
</div>

<div class="public_bg_color">
	<div class="center_bg">
	
		<div class="im_info_t_bg">
		</div>
		<div class="im_info">
			<div class="im_info_l_bg">
			<img src="/statics/ffsm/sslg/img/info_l_bg.png" alt="" class="bg5">
			</div>
			<div class="im_info_c">
			
				<div class="im_info_c_t">
				如何抓住灵感时间
				</div>
				<div class="im_info_c_c">
			</br>
<p>在灵感值高的时候，更易思维活跃、发生灵感爆发，多利用“精气神”中的优势项，即时利用，从而帮助你轻松Get到灵感爆发的时间，解决问题、突破难关！</p>
</br>
<p>更能知晓自身优势和短板，在正确的时间点，利用自己优势，带动运势的提升。</p>
				</div>
		
			</div>
			<div class="im_info_r_bg">
			<img src="/statics/ffsm/sslg/img/info_r_bg.png" alt="" class="bg5">	
			</div>
		</div>
		<div class="im_info_bt_bg">
			
		</div>
	</div>
</div>
<div class="public_bg_color">
	<div class="center_bg">
	
		<div class="im_info_t_bg">
		</div>
		<div class="im_info">
			<div class="im_info_l_bg">
			<img src="/statics/ffsm/ssxo/img/info_l_bg.png" alt="" class="bg5">
			</div>
			<div class="im_info_c">
			
				<div class="im_info_c_t">
				新手入门
				</div>
				<div class="im_info_c_c">
				</br>
	<p>人，都是由精、气、神组成，他们的比例有高有低，各有天分，若发展方向有偏差，将一生庸碌。而运势的上涨和下泄都不是固定的，如果能实时把握”精气神”强弱，趋高避低，就能补足运势，改善自身，避免伤己泄运。</p></br>
					<p>极好和极坏的时间段内，都存在与其好坏相反的时间点。是鲤鱼跃龙门，还是皇帝变乞丐，全在于你在这个时间点的行为，稍微不慎，就会造成两极反转。</p>
				</div>
		
			</div>
			<div class="im_info_r_bg">
			<img src="/statics/ffsm/ssxo/img/info_r_bg.png" alt="" class="bg5">	
			</div>
		</div>
		<div class="im_info_bt_bg">
			
		</div>
	</div>
</div>
<div class="lunpan_box" style="display:none;">
	<div class="lunpan">
		<img src="statics/ffsm/bazisyy/1/images/luopan.png" alt="轮盘">
		<img src="statics/ffsm/bazisyy/1/images/zhizheng.png" alt="轮盘">
	</div>
	<div class="lunpan_color"></div>
    <span style="color:#FFF; text-align:center;position:fixed;top:70%;left:29%;z-index:110;margin:0 auto;">大师努力掐算中 请稍后...</span>
    
</div>
<script>
layui.use('element', function(){
  var element = layui.element;
  
  //…
});
</script>
<script type="text/javascript">
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
	
	
           
</script>
<script>
        $(function(){
            // 服务轮播
            var scrollTop=0;
            var scrollUl=$('#feedbackScroll').children('ul');
            function scrollTip(){
                var top=scrollUl.children('li').eq(0).outerHeight();
                if(Math.abs(scrollTop)==Math.abs(top)){
                    scrollUl.children('li').eq(0).appendTo(scrollUl);
                    scrollUl.css("top",0);
                    scrollTop=0;
                }else{
                    scrollTop--;
                    scrollUl.css("top",scrollTop);
                }
            }
            setInterval(scrollTip,50);
        })
    </script>
<div class="ainuo_foot_nav cl" id="testFixedBtn" style="display: none;">
    <ul>
     <li><a href="/"><i class="shouye_1"></i><p>测算首页</p></a></li>
     <li><a href="/?ac=history"><i class="wddd_1"></i><p>订单查询</p></a></li>
     <li><a href="#submit2"><em><i class="lijics_1"></i></em><p>立即测算</p></a></li>
     <li><a href="javascript:void(0)" onclick="dcwjalert()"><i class="gengduo_1"></i><p>建议反馈</p></a></li>
     <li><a href="/?ac=member"><i class="grzx_1"></i><p>个人中心</p></a></li>
    </ul>
</div>
<script>
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
<{if $nologin}>

function islogin(){
layui.use('layer', function(){ //独立版的layer无需执行这一句
  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
layer.open({
        type: 1
        ,title: false //不显示标题栏
        ,closeBtn: false
		//,fixed: false
        ,area: '300px;'
        ,shade: 0.3
		,offset: 'auto'
		,skin: 'layui-layer-demo'
        ,id: 'LAY_layuipro2' //设定一个id，防止重复弹出
        ,btnAlign: 'c'
        ,moveType: 1 //拖拽模式，0或者1
        ,content: '<div style="padding: 25px; line-height: 22px;font-size: 16px; background-color: #f78990; color: #fff; font-weight: 300;">亲！<br><br>活动：《免单测试》 现在起只要注册、邀请注册，支付时选择积分支付立马免单！<br><br>登陆并测算后，我们将为您保存订单结果，点击“我的测算”即可查看历史订单！没有账号的请先注册哦~<br></div><div class="layui-layer-btn layui-layer-btn-c"><a class="layui-layer-btn0 labtn2" href="?ac=userlogin&return_url=<{$return_url}>">去登陆</a><a class="layui-layer-btn1 labtn1 labtn2" href="?ac=userreg&return_url=<{$return_url}>">去注册</a><a class="layui-layer-btn2 labtn2" href="javascript:void(0)" onclick="layer.close()">再看看</a></div>'
		
      }); 
	});
}
setTimeout(function(){islogin();},3000);

<{/if}>
$('.J_ajax_submit_btnsub').click(function(){
	
	if ("undefined" == typeof layer) {
		alert("正在准备中，请稍等...");
		$('.lunpan_box').css('display','none');
		document.login.username.focus();
		return false;
	}
	<{if $nologin}>islogin();return false;<{/if}>
	
        $('.lunpan_box').css('display','block');
            setTimeout(function(){checkForm();},1000);
});
</script>

<!-- Facebook Pixel Code -->


<!-- DO NOT MODIFY -->
<!-- End Facebook Pixel Code -->
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
<script src="statics/suanming_ssysa.js"></script>
<{include file='./ffsm/sslg/footer_jg.tpl'}>
<{include file='./ffsm/ss_share.tpl'}>
</body>
</html>