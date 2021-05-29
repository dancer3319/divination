<!DOCTYPE html>
<html lang="en"><head>
  <meta charset="utf-8">
  <title><{$sh_title}></title>
  <meta name="viewport" content="minimum-scale=1,initial-scale=1,maximum-scale=1,user-scalable=no">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-touch-fullscreen" content="yes">
  <meta name="keywords" content="">
  <meta name="description" content="">
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv="Cache-Control" content="no-cache">
  <meta http-equiv="Expires" content="0">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
  <meta name="format-detection" content="telephone=no">
  <meta name="format-detection" content="email=no">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="renderer" content="webkit">
  <meta name="screen-orientation" content="portrait">
  <meta name="x5-orientation" content="portrait">
  <meta http-equiv="Cache-Control" content="no-siteapp">

  <link rel="stylesheet" href="/statics/ffsm/ssnvp/css/swiper.min.css">
  <link rel="stylesheet" href="/statics/ffsm/ssnvp/css/style.css">
  
  <link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
  <link href="/statics/ffsm/ssnvp/css/page1.css" rel="stylesheet" type="text/css"/>
  <link href="/statics/ffsm/ssnvp/css/wap.css" rel="stylesheet" type="text/css"/>

  <script src="/statics/ffsm/ssnvp/js/vue.min.js"></script>
  <script src="/statics/ffsm/ssnvp/js/jquery.min.js"></script>
  <link rel="stylesheet" href="/statics/ffsm/ssnvp/layui/css/layui.css">  
  <link rel="stylesheet" href="/statics/ffsm/ssnvp/css/font/iconfont.css">
  <link rel="stylesheet" href="/statics/ffsm/ssnvp/css/public.css">

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
<script src="/statics/ffsm/ssnvp/layui/layui.js"></script>
<div id="order">
<div class="public_header">
<h1 class="public_h_con">实时男女配</h1>
<a class="public_h_home" href="/?ac=ssnvp"></a><a href="javascript:void(0)" class="public_h_menu"<{if $nologin}>  onclick="layui.use('layer', function(){layer.msg('请登陆后查看',{time: 20000,btn: ['去登陆','不了'],yes: function(index, layero){
location.href='?ac=userlogin&return_url=<{$return_url}>';
}});});"<{else}>:class="show" @click="chooseCoupon"<{/if}> >我的订单</a>
<div class="bg_rh"></div>
</div>
<{if $gundong}><div class="alert-marquee" id="alertMarquee"><span><img src="/statics/ffsm/ssnvp/img/laba.png" /></span><p class="inner"><{$gundong}></p></div><{/if}>
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
<div class="person_f">
	<div class="<{if $data.data.gender==1}>person_n_f<{else}>person_v_f<{/if}>">
      <div class="hd">
        <img src="<{if $data.data.gender==1}>/statics/ffsm/ssnvp/img/find_nan_toux.png<{else}>/statics/ffsm/ssnvp/img/find_nv_toux.png<{/if}>"></div>
      <div class="infos">
        <p class="name">姓名：<{$data.data.username}><span class="male"><img src="<{if $data.data.gender==1}>/statics/ffsm/ssnvp/img/male.png<{else}>/statics/ffsm/ssnvp/img/female.png<{/if}>"></span></p>
		<p class="birthday">阳历：<{$data.data.y}>年<{$data.data.m}>月<{$data.data.d}>日 <{$data.data.h}>时</p>
		<p class="birthday">阴历：<{$data.data.lDate}></p>
      </div>
	  <div class="userinfo_right" >
			<div class="userinfo_right_f_btn <{$return.wx_col}> layui-anim layui-anim-scale" id="sx_tip">
			<i class="icon iconfont <{$return.sx_icon}>"></i></div>
		</div>
    </div>
	<div class="userinfo_tab">
		<ul>
			<li class="bd1"><i class="icon iconfont <{if $data.data.gender==1}>icon-jianshen1<{else}>icon-jianshen4<{/if}>"></i><span class="tex_n">精</span><span class="tex_ns">身体</span></li>
			<li class="bd1"><i class="icon iconfont icon-yunqiniuniu"></i><span class="tex_n">气</span><span class="tex_ns">运气</span></li>
			<li><i class="icon iconfont icon-shuji"></i><span class="tex_n">神</span><span class="tex_ns">智慧</span></li>
			<li class="bd1"><span class="tex_n"><{$ssysdata.arrt_one.date_jqs.jin}></span></li>
			<li class="bd1"><span class="tex_n"><{$ssysdata.arrt_one.date_jqs.qi}></span></li>
			<li><span class="tex_n"><{$ssysdata.arrt_one.date_jqs.shen}></span></li>
		</ul>
	</div>
</div>

<div class="attr_type">
	<div class="attr_type_data">
		<div class="attr_type_info">
			<span class="attr_type_info_r attr_type_bg1"><{$ssysdata.arrt_one.date_jqs.zc}></span>
			<span class="attr_type_info_l">忠诚值</span>
		</div>
		<div class="attr_type_info">
			<span class="attr_type_info_r attr_type_bg2"><{$ssysdata.arrt_one.date_jqs.ml}></span>
			<span class="attr_type_info_l ">魅力值</span>
		</div>
		<div class="attr_type_info">
			<span class="attr_type_info_r attr_type_bg3"><{$ssysdata.arrt_one.date_jqs.ql}></span>
			<span class="attr_type_info_l">潜力值</span>
		</div>
		<div class="attr_type_info">
			<span class="attr_type_info_r attr_type_bg4"><{$ssysdata.arrt_one.date_jqs.zl}></span>
			<span class="attr_type_info_l">智力值</span>
		</div>
		<div class="attr_type_info">
			<span class="attr_type_info_r attr_type_bg5"><{$ssysdata.arrt_one.date_jqs.jl}></span>
			<span class="attr_type_info_l">精力值</span>
		</div>
		
	</div>
</div>
<div class="later_tip_bgsz">
 
<div class="layui-collapse" lay-accordion>
 <div class="layui-colla-item">
    <h2 class="layui-colla-title sxtit bg_red"><{$data.data.username}>的属性</h2>
    <div class="layui-colla-content ztxy_3vw">
	
	<p>搭配:<{$ssysdata.arrt_one.my_attr.collocation}></p>
	<p>类型:<{$ssysdata.arrt_one.my_attr.class}></p>
	<p>解析:<{$ssysdata.arrt_one.my_attr.content}></p>
	
	</div>
  </div>

</div>
</div>
<div class="person_f">
	<div class="<{if $data.data.gender2==1}>person_n_f<{else}>person_v_f<{/if}>">
      <div class="hd">
        <img src="<{if $data.data.gender2==1}>/statics/ffsm/ssnvp/img/find_nan_toux.png<{else}>/statics/ffsm/ssnvp/img/find_nv_toux.png<{/if}>"></div>
      <div class="infos">
        <p class="name">姓名：<{$data.data.girl_username}><span class="male"><img src="<{if $data.data.gender2==1}>/statics/ffsm/ssnvp/img/male.png<{else}>/statics/ffsm/ssnvp/img/female.png<{/if}>"></span></p>
		<p class="birthday">阳历：<{$data.data.y2}>年<{$data.data.m2}>月<{$data.data.d2}>日 <{$data.data.h2}>时</p>
		<p class="birthday">阴历：<{$data.data.lDate2}></p>
      </div>
	  <div class="userinfo_right" >
			<div class="userinfo_right_f_btn <{$return.wx_col2}> layui-anim layui-anim-scale" id="sx_tip2">
			<i class="icon iconfont <{$return.sx_icon2}>"></i></div>
		</div>
    </div>
	<div class="userinfo_tab">
		<ul>
			<li class="bd1"><i class="icon iconfont <{if $data.data.gender2==1}>icon-jianshen1<{else}>icon-jianshen4<{/if}>"></i><span class="tex_n">精</span><span class="tex_ns">身体</span></li>
			<li class="bd1"><i class="icon iconfont icon-yunqiniuniu"></i><span class="tex_n">气</span><span class="tex_ns">运气</span></li>
			<li><i class="icon iconfont icon-shuji"></i><span class="tex_n">神</span><span class="tex_ns">智慧</span></li>
			<li class="bd1"><span class="tex_n"><{$ssysdata.arrt_two.date_jqs.jin}></span></li>
			<li class="bd1"><span class="tex_n"><{$ssysdata.arrt_two.date_jqs.qi}></span></li>
			<li><span class="tex_n"><{$ssysdata.arrt_two.date_jqs.shen}></span></li>
		</ul>
	</div>
</div>

<div class="attr_type">
	<div class="attr_type_data">
		<div class="attr_type_info">
			<span class="attr_type_info_r attr_type_bg1"><{$ssysdata.arrt_two.date_jqs.zc}></span>
			<span class="attr_type_info_l">忠诚值</span>
		</div>
		<div class="attr_type_info">
			<span class="attr_type_info_r attr_type_bg2"><{$ssysdata.arrt_two.date_jqs.ml}></span>
			<span class="attr_type_info_l ">魅力值</span>
		</div>
		<div class="attr_type_info">
			<span class="attr_type_info_r attr_type_bg3"><{$ssysdata.arrt_two.date_jqs.ql}></span>
			<span class="attr_type_info_l">潜力值</span>
		</div>
		<div class="attr_type_info">
			<span class="attr_type_info_r attr_type_bg4"><{$ssysdata.arrt_two.date_jqs.zl}></span>
			<span class="attr_type_info_l">智力值</span>
		</div>
		<div class="attr_type_info">
			<span class="attr_type_info_r attr_type_bg5"><{$ssysdata.arrt_two.date_jqs.jl}></span>
			<span class="attr_type_info_l">精力值</span>
		</div>
	</div>
</div>
<div class="later_tip_bgsz">
	<div class="layui-collapse" lay-accordion>
	 <div class="layui-colla-item">
		<h2 class="layui-colla-title sxtit bg_red"><{$data.data.girl_username}>的属性</h2>
		<div class="layui-colla-content ztxy_3vw">
		
		<p>搭配:<{$ssysdata.arrt_two.my_attr.collocation}></p>
		<p>类型:<{$ssysdata.arrt_two.my_attr.class}></p>
		<p>解析:<{$ssysdata.arrt_two.my_attr.content}></p>
		
		</div>
	  </div>

	</div>
</div>
<div class="pipei_bg">
	<div class="pipeizhi">
		<div class="pipeizhi_pipei">
			<div class="pipeizhi_tit">
				<span class="pipeizhi_tit_a"><img src="<{if $data.data.gender==1}>/statics/ffsm/ssnvp/img/male_c.png<{else}>/statics/ffsm/ssnvp/img/female_c.png<{/if}>"></span>
				<span class="pipeizhi_tit_b"><{$data.data.username}></span>
			</div>
			<div class="pipeizhi_tit">
				<span class="pipeizhi_tit_a2"><img src="/statics/ffsm/ssnvp/img/peidui.png"></span>
				<span class="pipeizhi_tit_c">配对指数</span>
			</div>
			<div class="pipeizhi_tit">
				<span class="pipeizhi_tit_a"><img src="<{if $data.data.gender2==1}>/statics/ffsm/ssnvp/img/male_c.png<{else}>/statics/ffsm/ssnvp/img/female_c.png<{/if}>"></span>
				<span class="pipeizhi_tit_b"><{$data.data.girl_username}></span>
			</div>
		</div>
		<div class="pipeizhi_jd clearfix " data-percent="<{$ssysdata.arrt_one.date_jqs.pp}>%">

			<div class="pipeizhi_jd-title"><span>匹配结合度</span></div>

			<div class="pipeizhi_jd-bar"></div>

			<div class="pipeizhi_jd-bar-percent"><{$ssysdata.arrt_one.date_jqs.pp}>%</div>

		</div>
	</div>
</div>
<div class="public_bg_color">
			<div class="im_info_t">
			观表指南
			</div>
			<div class="im_info_c" style="font-size: 0.28rem;">
					<p>①下面数据为”精气神”实时倍率值，数值小于1为差，1-3为普通。数值<font color="red">大于3为优</font>，同时会显示<font color="red">红色</font></p>
<p>② 使用方法：
匹配值高时，增进感情，低时要避免矛盾。在”精”数值显红时，多进行运动；”气”数值显红时，多与人结交；”神”数值显红时，多思考。可提升双方运势。</p>
				</div>
</div>
<{include file='./ffsm/ssnvp/ss_icon.tpl'}>

<script type="text/javascript">
		$(function(){
			$('.pipeizhi_jd').each(function(){
				$(this).find('.pipeizhi_jd-bar').animate({
					width:$(this).attr('data-percent')
				},1000);
			});
		});
	</script>  
<div class="wrapper  J_testFixedShow">
    <div class="tabs">
        <a href="javascript:;" class="on"><{$data.data.username}>的实时表</a>
        <a href="javascript:;"><{$data.data.girl_username}>的实时表</a>
    </div>

    <div class="swiper-container swiper-tabs1">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
              <div class="tabs2">
					<a href="javascript:;"><{$date_time.q3}></a>
					<a href="javascript:;"><{$date_time.q2}></a>
					<a href="javascript:;"><{$date_time.q1}></a>
					<a href="javascript:;" class="on"><{$date_time.td}></a>
					<a href="javascript:;"><{$date_time.h1}></a>
					<a href="javascript:;"><{$date_time.h2}></a>
				</div>			
				<div class="swiper-container swiper-tabs2">
					<div class="swiper-wrapper swiper-no-swiping  layui-ssys-tb">
					
						<div class="swiper-slide">
						<table class="layui-table" lay-even>
						  <colgroup>
							<col>
							<col>
							<col>
							<col>
						  </colgroup>
						  <thead>
							<tr><th colspan="5" class="date_show"><{$date_time.date_q3}></th></tr>
							<tr>
							
							 <th>时间</th>
							  <th>精<br>(身体)</th>
							  <th>气<br>(运气)</th>
							  <th>神<br>(智慧)</th>
                              <th><font color="red">匹配值</font></th>
							  
							</tr> 
						  </thead>
						  <tbody>
						  <{foreach from=$ssysdata.arrt_one.date_q3 key=k item=v}>
							<tr>
							  <td><i class="layui-icon layui-icon-log"></i> <{$k}>:00</td>
							  <td><{if $v.zybl.j>=3}><font color="red"><{$v.zybl.j}></font><{else}><{$v.zybl.j}><{/if}></td>
							  <td><{if $v.zybl.q>=3}><font color="red"><{$v.zybl.q}></font><{else}><{$v.zybl.q}><{/if}></td>
							  <td><{if $v.zybl.s>=3}><font color="red"><{$v.zybl.s}></font><{else}><{$v.zybl.s}><{/if}></td>
							  <td><{if $v.zybl.zh>=80}><font color="red"><{$v.zybl.zh}>%</font><{else}><{$v.zybl.zh}>%<{/if}></td>
							</tr>
							<{/foreach}>							
						  </tbody>
						</table>
							
							
						</div>
						<div class="swiper-slide">
							
							<table class="layui-table" lay-even>
						  <colgroup>
							<col>
							<col>
							<col>
							<col>
						  </colgroup>
						  <thead>
							<tr><th colspan="5" class="date_show"><{$date_time.date_q2}></th></tr> 
							<tr>
							
							  <th>时间</th>
							  <th>精<br>(身体)</th>
							  <th>气<br>(运气)</th>
							  <th>神<br>(智慧)</th>
                              <th><font color="red">匹配值</font></th>
							  
							</tr> 
						  </thead>
						  <tbody>
						  <{foreach from=$ssysdata.arrt_one.date_q2 key=k item=v}>
							<tr>
							  <td><i class="layui-icon layui-icon-log"></i> <{$k}>:00</td>
							  <td><{if $v.zybl.j>=3}><font color="red"><{$v.zybl.j}></font><{else}><{$v.zybl.j}><{/if}></td>
							 <td><{if $v.zybl.q>=3}><font color="red"><{$v.zybl.q}></font><{else}><{$v.zybl.q}><{/if}></td>
							  <td><{if $v.zybl.s>=3}><font color="red"><{$v.zybl.s}></font><{else}><{$v.zybl.s}><{/if}></td>
							  <td><{if $v.zybl.zh>=80}><font color="red"><{$v.zybl.zh}>%</font><{else}><{$v.zybl.zh}>%<{/if}></td>
							</tr>
							<{/foreach}>							
						  </tbody>
						</table>
						</div>
						<div class="swiper-slide">
							<table class="layui-table" lay-even>
						  <colgroup>
							<col>
							<col>
							<col>
							<col>
						  </colgroup>
						  <thead>
							<tr><th colspan="5" class="date_show"><{$date_time.date_q1}></th></tr> 
							<tr>
							
							   <th>时间</th>
							  <th>精<br>(身体)</th>
							  <th>气<br>(运气)</th>
							  <th>神<br>(智慧)</th>
                              <th><font color="red">匹配值</font></th>
							  
							</tr> 
						  </thead>
						  <tbody>
						  <{foreach from=$ssysdata.arrt_one.date_q1 key=k item=v}>
							<tr>
							  <td><i class="layui-icon layui-icon-log"></i> <{$k}>:00</td>
							  <td><{if $v.zybl.j>=3}><font color="red"><{$v.zybl.j}></font><{else}><{$v.zybl.j}><{/if}></td>
							 <td><{if $v.zybl.q>=3}><font color="red"><{$v.zybl.q}></font><{else}><{$v.zybl.q}><{/if}></td>
							  <td><{if $v.zybl.s>=3}><font color="red"><{$v.zybl.s}></font><{else}><{$v.zybl.s}><{/if}></td>
							  <td><{if $v.zybl.zh>=80}><font color="red"><{$v.zybl.zh}>%</font><{else}><{$v.zybl.zh}>%<{/if}></td>
							</tr>
							<{/foreach}>							
						  </tbody>
						</table>
						</div>
						<div class="swiper-slide">

							<table class="layui-table" lay-even>
						  <colgroup>
							<col>
							<col>
							<col>
							<col>
						  </colgroup>
						  <thead>
							<tr><th colspan="5" class="date_show"><{$date_time.date_td}></th></tr> 
							<tr>
							
							   <th>时间</th>
							  <th>精<br>(身体)</th>
							  <th>气<br>(运气)</th>
							  <th>神<br>(智慧)</th>
                              <th><font color="red">匹配值</font></th>
							  
							</tr> 
						  </thead>
						  <tbody>
						  <{foreach from=$ssysdata.arrt_one.date_td key=k item=v}>
							<tr>
							  <td><i class="layui-icon layui-icon-log"></i> <{$k}>:00</td>
							  <td><{if $v.zybl.j>=3}><font color="red"><{$v.zybl.j}></font><{else}><{$v.zybl.j}><{/if}></td>
							 <td><{if $v.zybl.q>=3}><font color="red"><{$v.zybl.q}></font><{else}><{$v.zybl.q}><{/if}></td>
							  <td><{if $v.zybl.s>=3}><font color="red"><{$v.zybl.s}></font><{else}><{$v.zybl.s}><{/if}></td>
							  <td><{if $v.zybl.zh>=80}><font color="red"><{$v.zybl.zh}>%</font><{else}><{$v.zybl.zh}>%<{/if}></td>
							</tr>
							<{/foreach}>							
						  </tbody>
						</table>
							
						</div>
						<div class="swiper-slide">
							<table class="layui-table" lay-even>
						  <colgroup>
							<col>
							<col>
							<col>
							<col>
						  </colgroup>
						  <thead>
							<tr><th colspan="5" class="date_show"><{$date_time.date_h1}></th></tr> 
							<tr>
							
							  <th>时间</th>
							  <th>精<br>(身体)</th>
							  <th>气<br>(运气)</th>
							  <th>神<br>(智慧)</th>
                              <th><font color="red">匹配值</font></th>
							  
							</tr> 
						  </thead>
						  <tbody>
						  <{foreach from=$ssysdata.arrt_one.date_h1 key=k item=v}>
							<tr>
							  <td><i class="layui-icon layui-icon-log"></i> <{$k}>:00</td>
							  <td><{if $v.zybl.j>=3}><font color="red"><{$v.zybl.j}></font><{else}><{$v.zybl.j}><{/if}></td>
							 <td><{if $v.zybl.q>=3}><font color="red"><{$v.zybl.q}></font><{else}><{$v.zybl.q}><{/if}></td>
							  <td><{if $v.zybl.s>=3}><font color="red"><{$v.zybl.s}></font><{else}><{$v.zybl.s}><{/if}></td>
							  <td><{if $v.zybl.zh>=80}><font color="red"><{$v.zybl.zh}>%</font><{else}><{$v.zybl.zh}>%<{/if}></td>
							</tr>
							<{/foreach}>							
						  </tbody>
						</table>
						</div>
						<div class="swiper-slide">
							<table class="layui-table" lay-even>
						  <colgroup>
							<col>
							<col>
							<col>
							<col>
						  </colgroup>
						  <thead>
							<tr><th colspan="5" class="date_show"><{$date_time.date_h2}></th></tr> 
							<tr>
							
							   <th>时间</th>
							  <th>精<br>(身体)</th>
							  <th>气<br>(运气)</th>
							  <th>神<br>(智慧)</th>
                              <th><font color="red">匹配值</font></th>
							  
							</tr> 
						  </thead>
						  <tbody>
						  <{foreach from=$ssysdata.arrt_one.date_h2 key=k item=v}>
							<tr>
							  <td><i class="layui-icon layui-icon-log"></i> <{$k}>:00</td>
							  <td><{if $v.zybl.j>=3}><font color="red"><{$v.zybl.j}></font><{else}><{$v.zybl.j}><{/if}></td>
							 <td><{if $v.zybl.q>=3}><font color="red"><{$v.zybl.q}></font><{else}><{$v.zybl.q}><{/if}></td>
							  <td><{if $v.zybl.s>=3}><font color="red"><{$v.zybl.s}></font><{else}><{$v.zybl.s}><{/if}></td>
							  <td><{if $v.zybl.zh>=80}><font color="red"><{$v.zybl.zh}>%</font><{else}><{$v.zybl.zh}>%<{/if}></td>
							</tr>
							<{/foreach}>							
						  </tbody>
						</table>
						</div>
						
					</div>
				</div>
            </div>
			
			
            <div class="swiper-slide">
              <div class="tabs3">
					<a href="javascript:;"><{$date_time.q3}></a>
					<a href="javascript:;"><{$date_time.q2}></a>
					<a href="javascript:;"><{$date_time.q1}></a>
					<a href="javascript:;" class="on"><{$date_time.td}></a>
					<a href="javascript:;"><{$date_time.h1}></a>
					<a href="javascript:;"><{$date_time.h2}></a>
				</div>			
				<div class="swiper-container swiper-tabs3">
					<div class="swiper-wrapper swiper-no-swiping  layui-ssys-tb">
					
						<div class="swiper-slide">
						<table class="layui-table" lay-even>
						  <colgroup>
							<col>
							<col>
							<col>
							<col>
						  </colgroup>
						  <thead>
							<tr><th colspan="5" class="date_show"><{$date_time.date_q3}></th></tr>
							<tr>
							
							 <th>时间</th>
							  <th>精<br>(身体)</th>
							  <th>气<br>(运气)</th>
							  <th>神<br>(智慧)</th>
                              <th><font color="red">匹配值</font></th>
							  
							</tr> 
						  </thead>
						  <tbody>
						  <{foreach from=$ssysdata.arrt_two.date_q3 key=k item=v}>
							<tr>
							  <td><i class="layui-icon layui-icon-log"></i> <{$k}>:00</td>
							  <td><{if $v.zybl.j>=3}><font color="red"><{$v.zybl.j}></font><{else}><{$v.zybl.j}><{/if}></td>
							  <td><{if $v.zybl.q>=3}><font color="red"><{$v.zybl.q}></font><{else}><{$v.zybl.q}><{/if}></td>
							  <td><{if $v.zybl.s>=3}><font color="red"><{$v.zybl.s}></font><{else}><{$v.zybl.s}><{/if}></td>
							  <td><{if $v.zybl.zh>=80}><font color="red"><{$v.zybl.zh}>%</font><{else}><{$v.zybl.zh}>%<{/if}></td>
							</tr>
							<{/foreach}>							
						  </tbody>
						</table>
							
							
						</div>
						<div class="swiper-slide">
							
							<table class="layui-table" lay-even>
						  <colgroup>
							<col>
							<col>
							<col>
							<col>
						  </colgroup>
						  <thead>
							<tr><th colspan="5" class="date_show"><{$date_time.date_q2}></th></tr> 
							<tr>
							
							  <th>时间</th>
							  <th>精<br>(身体)</th>
							  <th>气<br>(运气)</th>
							  <th>神<br>(智慧)</th>
                              <th><font color="red">匹配值</font></th>
							  
							</tr> 
						  </thead>
						  <tbody>
						  <{foreach from=$ssysdata.arrt_two.date_q2 key=k item=v}>
							<tr>
							  <td><i class="layui-icon layui-icon-log"></i> <{$k}>:00</td>
							  <td><{if $v.zybl.j>=3}><font color="red"><{$v.zybl.j}></font><{else}><{$v.zybl.j}><{/if}></td>
							 <td><{if $v.zybl.q>=3}><font color="red"><{$v.zybl.q}></font><{else}><{$v.zybl.q}><{/if}></td>
							  <td><{if $v.zybl.s>=3}><font color="red"><{$v.zybl.s}></font><{else}><{$v.zybl.s}><{/if}></td>
							  <td><{if $v.zybl.zh>=80}><font color="red"><{$v.zybl.zh}>%</font><{else}><{$v.zybl.zh}>%<{/if}></td>
							</tr>
							<{/foreach}>							
						  </tbody>
						</table>
						</div>
						<div class="swiper-slide">
							<table class="layui-table" lay-even>
						  <colgroup>
							<col>
							<col>
							<col>
							<col>
						  </colgroup>
						  <thead>
							<tr><th colspan="5" class="date_show"><{$date_time.date_q1}></th></tr> 
							<tr>
							
							   <th>时间</th>
							  <th>精<br>(身体)</th>
							  <th>气<br>(运气)</th>
							  <th>神<br>(智慧)</th>
                              <th><font color="red">匹配值</font></th>
							  
							</tr> 
						  </thead>
						  <tbody>
						  <{foreach from=$ssysdata.arrt_two.date_q1 key=k item=v}>
							<tr>
							  <td><i class="layui-icon layui-icon-log"></i> <{$k}>:00</td>
							  <td><{if $v.zybl.j>=3}><font color="red"><{$v.zybl.j}></font><{else}><{$v.zybl.j}><{/if}></td>
							 <td><{if $v.zybl.q>=3}><font color="red"><{$v.zybl.q}></font><{else}><{$v.zybl.q}><{/if}></td>
							  <td><{if $v.zybl.s>=3}><font color="red"><{$v.zybl.s}></font><{else}><{$v.zybl.s}><{/if}></td>
							  <td><{if $v.zybl.zh>=80}><font color="red"><{$v.zybl.zh}>%</font><{else}><{$v.zybl.zh}>%<{/if}></td>
							</tr>
							<{/foreach}>							
						  </tbody>
						</table>
						</div>
						<div class="swiper-slide">

							<table class="layui-table" lay-even>
						  <colgroup>
							<col>
							<col>
							<col>
							<col>
						  </colgroup>
						  <thead>
							<tr><th colspan="5" class="date_show"><{$date_time.date_td}></th></tr> 
							<tr>
							
							   <th>时间</th>
							  <th>精<br>(身体)</th>
							  <th>气<br>(运气)</th>
							  <th>神<br>(智慧)</th>
                              <th><font color="red">匹配值</font></th>
							  
							</tr> 
						  </thead>
						  <tbody>
						  <{foreach from=$ssysdata.arrt_two.date_td key=k item=v}>
							<tr>
							  <td><i class="layui-icon layui-icon-log"></i> <{$k}>:00</td>
							  <td><{if $v.zybl.j>=3}><font color="red"><{$v.zybl.j}></font><{else}><{$v.zybl.j}><{/if}></td>
							 <td><{if $v.zybl.q>=3}><font color="red"><{$v.zybl.q}></font><{else}><{$v.zybl.q}><{/if}></td>
							  <td><{if $v.zybl.s>=3}><font color="red"><{$v.zybl.s}></font><{else}><{$v.zybl.s}><{/if}></td>
							  <td><{if $v.zybl.zh>=80}><font color="red"><{$v.zybl.zh}>%</font><{else}><{$v.zybl.zh}>%<{/if}></td>
							</tr>
							<{/foreach}>							
						  </tbody>
						</table>
							
						</div>
						<div class="swiper-slide">
							<table class="layui-table" lay-even>
						  <colgroup>
							<col>
							<col>
							<col>
							<col>
						  </colgroup>
						  <thead>
							<tr><th colspan="5" class="date_show"><{$date_time.date_h1}></th></tr> 
							<tr>
							
							  <th>时间</th>
							  <th>精<br>(身体)</th>
							  <th>气<br>(运气)</th>
							  <th>神<br>(智慧)</th>
                              <th><font color="red">匹配值</font></th>
							  
							</tr> 
						  </thead>
						  <tbody>
						  <{foreach from=$ssysdata.arrt_two.date_h1 key=k item=v}>
							<tr>
							  <td><i class="layui-icon layui-icon-log"></i> <{$k}>:00</td>
							  <td><{if $v.zybl.j>=3}><font color="red"><{$v.zybl.j}></font><{else}><{$v.zybl.j}><{/if}></td>
							 <td><{if $v.zybl.q>=3}><font color="red"><{$v.zybl.q}></font><{else}><{$v.zybl.q}><{/if}></td>
							  <td><{if $v.zybl.s>=3}><font color="red"><{$v.zybl.s}></font><{else}><{$v.zybl.s}><{/if}></td>
							  <td><{if $v.zybl.zh>=80}><font color="red"><{$v.zybl.zh}>%</font><{else}><{$v.zybl.zh}>%<{/if}></td>
							</tr>
							<{/foreach}>							
						  </tbody>
						</table>
						</div>
						<div class="swiper-slide">
							<table class="layui-table" lay-even>
						  <colgroup>
							<col>
							<col>
							<col>
							<col>
						  </colgroup>
						  <thead>
							<tr><th colspan="5" class="date_show"><{$date_time.date_h2}></th></tr> 
							<tr>
							
							   <th>时间</th>
							  <th>精<br>(身体)</th>
							  <th>气<br>(运气)</th>
							  <th>神<br>(智慧)</th>
                              <th><font color="red">匹配值</font></th>
							  
							</tr> 
						  </thead>
						  <tbody>
						  <{foreach from=$ssysdata.arrt_two.date_h2 key=k item=v}>
							<tr>
							  <td><i class="layui-icon layui-icon-log"></i> <{$k}>:00</td>
							  <td><{if $v.zybl.j>=3}><font color="red"><{$v.zybl.j}></font><{else}><{$v.zybl.j}><{/if}></td>
							 <td><{if $v.zybl.q>=3}><font color="red"><{$v.zybl.q}></font><{else}><{$v.zybl.q}><{/if}></td>
							  <td><{if $v.zybl.s>=3}><font color="red"><{$v.zybl.s}></font><{else}><{$v.zybl.s}><{/if}></td>
							  <td><{if $v.zybl.zh>=80}><font color="red"><{$v.zybl.zh}>%</font><{else}><{$v.zybl.zh}>%<{/if}></td>
							</tr>
							<{/foreach}>							
						  </tbody>
						</table>
						</div>
						
					</div>
				</div>
            </div>
        
			
            
        </div>
    </div>
</div>

<script>

	layui.use('element', function(){
	  var element = layui.element;
	  
	});
	
	$('#sx_tip').on('click', function(){
		layui.use('layer', function(){
		layer.msg('生肖：<{$return.user.sx}>');
      });
	});
	$('#sx_tip2').on('click', function(){
		layui.use('layer', function(){
		layer.msg('生肖：<{$return.user2.sx}>');
      });
	});
</script>
  <script src="/statics/ffsm/ssnvp/js/swiper.min.js"></script>
  
  
  <script>
  $(function () {
    var tabsSwiper = new Swiper('.swiper-tabs1', {
      autoHeight: true,
	  on: {
        slideChangeTransitionStart: function() {
            $('.tabs .on').removeClass('on');
            $('.tabs a').eq(tabsSwiper.activeIndex).addClass('on');
        },
	},
    });

    $('.tabs a').on('touchstart mousedown', function() {
        var _ = $(this);
        _.addClass('on').siblings().removeClass('on');
        tabsSwiper.slideTo(_.index());
        return false;
    });
	var tabsSwiper2 = new Swiper('.swiper-tabs2', {
      autoHeight: true,
	initialSlide :3,
    });
	var tabsSwiper3 = new Swiper('.swiper-tabs3', {
	initialSlide :3,
    });

    $('.tabs2 a').on('touchstart mousedown', function() {
        var _ = $(this);
        _.addClass('on').siblings().removeClass('on');
        tabsSwiper2.slideTo(_.index());
        return false;
    });
	$('.tabs3 a').on('touchstart mousedown', function() {
        var _ = $(this);
        _.addClass('on').siblings().removeClass('on');
        tabsSwiper3.slideTo(_.index());
        return false;
    });
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
    })
</script>
<div class="ainuo_foot_nav cl" id="testFixedBtn" style="display: none;">
    <ul>
     <li><a href="?ac=ssnvp"><i class="shouye_1"></i><p>测算首页</p></a></li>
     <li><a href="/?ac=history"><i class="wddd_1"></i><p>订单查询</p></a></li>
     <li><a href="?ac=ssnvp"><em><i class="lijics_1"></i></em><p>继续测算</p></a></li>
     <li><a href="javascript:void(0)" onclick="dcwjalert()"><i class="gengduo_1"></i><p>建议反馈</p></a></li>
     <li><a href="/?ac=member"><i class="grzx_1"></i><p>个人中心</p></a></li>
    </ul>
</div>

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
			$(function() {
				function setCurrentSlide(ele, index) {
					$(".swiper1 .swiper-slide").removeClass("selected");
					ele.addClass("selected");
					//swiper1.initialSlide=index;
				}

				var swiper1 = new Swiper('.swiper1', {
					slidesPerView: 6,
					paginationClickable: true,//此参数设置为true时，点击分页器的指示点分页器会控制Swiper切换。
					spaceBetween: 10,//slide之间的距离（单位px）。
					freeMode: true,//默认为false，普通模式：slide滑动时只滑动一格，并自动贴合wrapper，设置为true则变为free模式，slide会根据惯性滑动且不会贴合。
					loop: false,
					onTab: function(swiper) {
						var n = swiper1.clickedIndex;
					}
				});
				if(!swiper1.slides){
					return;
				}
				swiper1.slides.each(function(index, val) {
					var ele = $(this);
					ele.on("click", function() {
						setCurrentSlide(ele, index);
						swiper2.slideTo(index, 500, false);
						swiper3.slideTo(index, 500, false);
					});
				});

				var swiper2 = new Swiper('.swiper2', {
					freeModeSticky: true,
					direction: 'horizontal',
					loop: false,
					effect : 'coverflow',
					autoHeight: false,
					onSlideChangeEnd: function(swiper) { 
						var n = swiper.activeIndex;
						setCurrentSlide($(".swiper1 .swiper-slide").eq(n), n);
						swiper1.slideTo(n, 500, false);
					}
				});
				var swiper3 = new Swiper('.swiper3', {
					freeModeSticky: true,
					direction: 'horizontal',
					loop: false,
					effect : 'coverflow',

					autoHeight: false,
					onSlideChangeEnd: function(swiper) {
						var n = swiper.activeIndex;
						setCurrentSlide($(".swiper1 .swiper-slide").eq(n), n);
						swiper1.slideTo(n, 500, false);
					}
				});
			});
		</script>

<{include file='./ffsm/ssnvp/footer_jg.tpl'}>
<{include file='./ffsm/ss_share.tpl'}>
  </body>
