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

  <link rel="stylesheet" href="/statics/ffsm/sslg/css/swiper.min.css">
  <link rel="stylesheet" href="/statics/ffsm/sslg/css/style.css">
  
  <link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
  <link href="/statics/ffsm/sslg/css/page1.css" rel="stylesheet" type="text/css"/>
  <link href="/statics/ffsm/sslg/css/wap.css" rel="stylesheet" type="text/css"/>

  <script src="/statics/ffsm/sslg/js/vue.min.js"></script>
  <script src="/statics/ffsm/sslg/js/jquery.min.js"></script>
  <link rel="stylesheet" href="/statics/ffsm/sslg/layui/css/layui.css">  
  <link rel="stylesheet" href="/statics/ffsm/sslg/css/font/iconfont.css">
  <link rel="stylesheet" href="/statics/ffsm/sslg/css/public.css">
  <link rel="stylesheet" type="text/css" href="/statics/ffsm/sslg/css/mobileSelect.css">
  <script src="/statics/ffsm/sslg/js/mobileSelect.min.js" type="text/javascript"></script>
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
<a class="public_h_con" href="/?ac=sslg">实时灵感</a><a href="javascript:void(0)" class="public_h_menu"<{if $nologin}>  onclick="layui.use('layer', function(){layer.msg('请登陆后查看',{time: 20000,btn: ['去登陆','不了'],yes: function(index, layero){
location.href='?ac=userlogin&return_url=<{$return_url}>';
}});});"<{else}>:class="show" @click="chooseCoupon"<{/if}> ><img src="/statics/ffsm/sslg/img/wddd.png" /></a></div>
<div class="alert-marquee" id="alertMarquee"><span><img src="/statics/ffsm/sslg/img/laba.png" /></span><p class="inner"><{$gundong}></p></div>
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
						<div class="title">{{item.name}}</div>
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
<div class="userinfo <{if $data.data.gender==1}>userinfo_n<{else}>userinfo_v<{/if}>">	
	<div class="userinfo_box">
		<div class="userinfo_box_left">
			<div class="userinfo_left_info">
				<p class="name"><{$data.data.username}><{if $data.data.gender==1}><span class="male">♂</span><{else}><span class="female">♀</span><{/if}></p>
				<p class="birthday" id="edit_hour">阳历：<{$data.data.y}>年<{$data.data.m}>月<{$data.data.d}>日 <{$data.data.h}>时 <i class="layui-icon layui-icon-edit"></i></p>
				<p class="birthday">阴历：<{$data.data.lDate}></p>
			</div>
		</div>
		<div class="userinfo_right" >
			<div class="userinfo_right_btn <{$return.wx_col}> layui-anim layui-anim-scale" id="sx_tip">
			<i class="icon iconfont <{$return.sx_icon}>"></i></div>
		</div>
	</div>
</div>
<{include file='./ffsm/sslg/ss_icon.tpl'}>
<div class="userinfo_jqs">
	<div class="jqsjdwk">
	<div class="skillbar-title ji_jd"><span>身体 : <{$ssysdata.date_jqs.jin}></span></div>
		<div class="skillbar clearfix " data-percent="<{$ssysdata.date_jqs.jin}>%">
			<div class="skillbar-bar ji_jd_cl"></div>
			<div class="skill-bar-percent"></div>
		</div> 
	</div>
	<div class="jqsjdwk">
	<div class="skillbar-title qi_jd"><span>运气 : <{$ssysdata.date_jqs.qi}></span></div>
		<div class="skillbar clearfix " data-percent="<{$ssysdata.date_jqs.qi}>%">
			<div class="skillbar-bar qi_jd_cl"></div>
			<div class="skill-bar-percent"></div>
		</div> 
	</div>
	<div class="jqsjdwk">
	<div class="skillbar-title shen_jd"><span>智慧 : <{$ssysdata.date_jqs.shen}></span></div>
		<div class="skillbar clearfix " data-percent="<{$ssysdata.date_jqs.shen}>%">
			<div class="skillbar-bar shen_jd_cl"></div>
			<div class="skill-bar-percent"></div>
		</div> 
	</div>	
</div> 

<div class="later_tip_bgsz">
 
<div class="layui-collapse" lay-accordion>
 <div class="layui-colla-item">
    <h2 class="layui-colla-title sxtit bg_fff">我的属性</h2>
    <div class="layui-colla-content bg_fff  ztxy_3vw">
	
	<p>搭配:<{$ssysdata.my_attr.collocation}></p>
	<p>类型:<{$ssysdata.my_attr.class}></p>
	<p>解析:<{$ssysdata.my_attr.content}></p>
	</div>
  </div>
	<div class="layui-colla-item">
		<h2 class="layui-colla-title sxtit bg_fff">精气神人格属性</h2>
		<div class="layui-colla-content bg_fff  ztxy_3vw">
		
		<table class="layui-table">
		  <colgroup>
			<col width="19%">
			<col width="22%">
			<col>
		  </colgroup>
		  <thead>
			<tr>
			  <th>搭配</th>
			  <th>类型</th>
			  <th>解析</th>
			</tr> 
		  </thead>
		  <tbody>
		  <{foreach from=$ssysdata.attr key=k item=v}>
			<tr>
			  <td><{$v.collocation}></td>
			  <td><{$v.class}></td>
			  <td><{$v.content}></td>
			</tr>
			<{/foreach}>
		  </tbody>
		</table>
		</div>
	  </div>
</div>
</div>
<div class="taohuazhi J_testFixedShow">
	<div class="taohuazhi_tit">
	我的灵感值
	<span class="taohuazhi_tit_l"></span><span class="taohuazhi_tit_r"></span>
	</div>
	<div class="taohuazhi_jd clearfix " data-percent="<{$ssysdata.date_jqs.th}>%">
		<div class="taohuazhi_jd_bar"></div>
		<div class="taohuazhi_jd_bar_percent"><{$ssysdata.date_jqs.th}>%</div>
	</div>
	<div class="taohuazhi_data">
		<div class="taohuazhi_data_info">
			<span class="taohuazhi_data_info_l">魅力值</span><span class="taohuazhi_data_info_r"><{$ssysdata.date_jqs.ml}>/100</span>
		</div>
		<div class="taohuazhi_data_info">
			<span class="taohuazhi_data_info_l">潜力值</span><span class="taohuazhi_data_info_r"><{$ssysdata.date_jqs.ql}>/100</span>
		</div>
		<div class="taohuazhi_data_info">
			<span class="taohuazhi_data_info_l">智力值</span><span class="taohuazhi_data_info_r"><{$ssysdata.date_jqs.zl}>/100</span>
		</div>
		<div class="taohuazhi_data_info">
			<span class="taohuazhi_data_info_l">精力值</span><span class="taohuazhi_data_info_r"><{$ssysdata.date_jqs.jl}>/100</span>
		</div>
		
	</div>
</div>
<script type="text/javascript">
		$(function(){
			$('.taohuazhi_jd').each(function(){
				$(this).find('.taohuazhi_jd_bar').animate({
					width:$(this).attr('data-percent')
				},1000);
			});
			$('.skillbar').each(function(){
				$(this).find('.skillbar-bar').animate({
					width:$(this).attr('data-percent')
				},1000);
			});
		});
	</script>  
<div class="later_tip_bgsz bg_fff" style="padding: 0;">
	<div class="layui-card">
	  <div class="layui-card-header sxtit_by"><i class="layui-icon layui-icon-chart-screen"></i> 观表指南</div>
	  <div class="layui-card-body">
        </br>
		<p>① 下面数据为”精气神”实时<font color="red">倍率值</font>，数值小于1为差，1-3为普通。</p></br>
		<p>② 下面数值<font color="red">大于3为优</font>，同时会显示<font color="red">红色</font>， 数值越大代表该方向越好。</p></br>
		<p>③ 在相关数值显红时，进行对应的行动。如：”精”数值显红时，多进行运动；”气”数值显红时，多与人结交；”神”数值显红时，多思考。</p></br>
	  </div>
	</div>
</div>
<div class="wrapper">
    <div class="tabs">
        <a href="javascript:;" class="on">实时运势</a>
        <a href="javascript:;">补运参考</a>
		<a href="javascript:;">详细补运</a>
        <a href="javascript:;">八字排盘</a>
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
                              <th><font color="red">灵感值</font></th>
							  
							</tr> 
						  </thead>
						  <tbody>
						  <{foreach from=$ssysdata.date_q3 key=k item=v}>
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
                              <th><font color="red">灵感值</font></th>
							  
							</tr> 
						  </thead>
						  <tbody>
						  <{foreach from=$ssysdata.date_q2 key=k item=v}>
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
                              <th><font color="red">灵感值</font></th>
							  
							</tr> 
						  </thead>
						  <tbody>
						  <{foreach from=$ssysdata.date_q1 key=k item=v}>
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
                              <th><font color="red">灵感值</font></th>
							  
							</tr> 
						  </thead>
						  <tbody>
						  <{foreach from=$ssysdata.date_td key=k item=v}>
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
                              <th><font color="red">灵感值</font></th>
							  
							</tr> 
						  </thead>
						  <tbody>
						  <{foreach from=$ssysdata.date_h1 key=k item=v}>
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
                              <th><font color="red">灵感值</font></th>
							  
							</tr> 
						  </thead>
						  <tbody>
						  <{foreach from=$ssysdata.date_h2 key=k item=v}>
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
			<hr class="layui-bg-orange">
				
			   <fieldset class="layui-elem-field">
				  <legend><i class="layui-icon layui-icon-rate-solid layui-bg-orange"></i> 提示:</legend>
				  <div class="layui-field-box">
					分值参照表仅代表单项精(身体)、气(运气)、神(智慧)的大体状态，具体情况请查看【详细解析】。
				  </div>
				</fieldset>
				
				
			<div class="ssyunshi_info ztxy_3vw">
			<table class="layui-table">
				  <colgroup>
					<col>
					<col>
					<col>
				  </colgroup>
				  <thead>
					<tr>
					  <th>分值</th>
					  <th>评价</th>
					  <th>说明</th>
					</tr> 
				  </thead>
				  <tbody>
					<tr>
					  <td>0-1</td>
					  <td>差</td>
					  <td>尽量不要做相关事情</td>
					</tr>
					<tr>
					  <td>1-2</td>
						<td>普通</td>
						<td>可以少量相关事情</td>
					</tr>
					<tr>
					  <td>2-3</td>
						<td>良好</td>
						<td>正常进行相关事情</td>
					</tr>
					<tr>
					  <td>3-100</td>
						<td>优</td>
						<td>多多参与相关事情</td>
					</tr>
				  </tbody>
				</table>
					
				</div>		
				
								
						
      
			</div>
        
			<div class="swiper-slide">
             <hr class="layui-bg-orange">
			 <fieldset class="layui-elem-field">
				  <legend><i class="layui-icon layui-icon-rate-solid layui-bg-orange"></i> 提示:</legend>
				  <div class="layui-field-box">
					精、气、神的具体分值，仅代表所属时段的单项状态，具体情况需看3项分值的综合影响，方可决定状态偏向和行为选择。
				  </div>
				</fieldset>
				
			
			<div class="layui-collapse mg_bt150" lay-accordion>
			<{foreach from=$ssysdata.ins key=k item=v}>
			  <div class="layui-colla-item">
				<h2 class="layui-colla-title sxtit"><{if $v.jqs==1}>精<{elseif $v.jqs==2}>气<{else}>神<{/if}> 分值：<{$v.score}> <{$v.level}> </h2>
				<div class="ztxy_3vw2 layui-colla-content  <{if $k==11}>layui-show<{/if}>"><{$v.content}></div>
			  </div>
			  <{/foreach}>
			  
			</div>
			 
			
				
				
			</div>
            <div class="swiper-slide">
			<hr class="layui-bg-orange">
		<div class="ssyunshi_info ztxy_3vw">
		<table class="layui-table tabf">
				  <colgroup>
					<col>
					<col>
					<col>
				  </colgroup>
				  <thead>
					<tr>
						<th>八字</th>
						<th>年柱</th>
						<th>月柱</th>
						<th>日柱</th>
						<th>时柱</th>
						<th>胎元</th>
						<th>命宫</th>
						<th>身宫</th>
					</tr> 
				  </thead>
				  <tbody>
					 <tr>
					<td>天干</td>
					<td class="col"><{$pp.yg}></td>
					<td class="col"><{$pp.mg}></td>
					<td class="col"><{$pp.rg}></td>
					<td class="col"><{$pp.hg}></td>
					<td class="col"><{$pp.taiyuan_g}></td>
					<td class="col"><{$pp.minggong_g}></td>
					<td class="col"><{$pp.shengong_g}></td>
					</tr>
				  <tr>
					<td>地支</td>
					<td class="col"><{$pp.yz}></td>
					<td class="col"><{$pp.mz}></td>
					<td class="col"><{$pp.rz}></td>
					<td class="col"><{$pp.hz}></td>
					<td class="col"><{$pp.taiyuan_z}></td>
					<td class="col"><{$pp.minggong_z}></td>
					<td class="col"><{$pp.shengong_z}></td>
					</tr>
				  <tr>
					<td>五行</td>
					<td class="col"><{$pp.wuxing.yg}><{$pp.wuxing.yz}></td>
					<td class="col"><{$pp.wuxing.mg}><{$pp.wuxing.mz}></td>
					<td class="col"><{$pp.wuxing.rg}><{$pp.wuxing.rz}></td>
					<td class="col"><{$pp.wuxing.hg}><{$pp.wuxing.hz}></td>
					<td class="col"><{$pp.wuxing.tyg}><{$pp.wuxing.tyz}></td>
					<td class="col"><{$pp.wuxing.mgg}><{$pp.wuxing.mgz}></td>
					<td class="col"><{$pp.wuxing.sgg}><{$pp.wuxing.sgz}></td>

					</tr>
				  <tr>
					<td>十神</td>
					<td class="col"><{$pp.shishen1}></td>
					<td class="col"><{$pp.shishen2}></td>
					<td class="col1">日主</td>
					<td class="col"><{$pp.shishen4}></td>
					<td class="col"><{$pp.shishen5}></td>
					<td class="col"><{$pp.shishen6}></td>
					<td class="col"><{$pp.shishen7}></td>
					</tr>
				  <tr>
					<td>藏干</td>
					<td class="col"><{$pp.zanggan1}></td>
					<td class="col"><{$pp.zanggan2}></td>
					<td class="col"><{$pp.zanggan3}></td>
					<td class="col"><{$pp.zanggan4}></td>
					<td class="col"><{$pp.zanggan5}></td>
					<td class="col"><{$pp.zanggan6}></td>
					<td class="col"><{$pp.zanggan7}></td>
					</tr>
				  <tr>
					<td>藏干十神</td>
					<td class="col"><{$pp.z_shishen1}></td>
					<td class="col"><{$pp.z_shishen2}></td>
					<td class="col"><{$pp.z_shishen3}></td>
					<td class="col"><{$pp.z_shishen4}></td>
					<td class="col"><{$pp.z_shishen5}></td>
					<td class="col"><{$pp.z_shishen6}></td>
					<td class="col"><{$pp.z_shishen7}></td>
					</tr>
				  <tr>
					<td>纳音</td>
					<td class="col"><{$pp.nayin1}></td>
					<td class="col"><{$pp.nayin2}></td>
					<td class="col"><{$pp.nayin3}></td>
					<td class="col"><{$pp.nayin4}></td>
					<td class="col"><{$pp.nayin5}></td>
					<td class="col"><{$pp.nayin6}></td>
					<td class="col"><{$pp.nayin7}></td>
					</tr>
				  <tr>
					<td>旬空</td>
					<td colspan="7"><{$pp.xkrgz}></td>
				  </tr>
				  <tr>
					<td>纳音命宫</td>
					<td colspan="7"><{$pp.nayinminggong}></td></tr>
				  </tbody>
				</table>
				
				
			
          


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
	var hourArr=["00:00-00:59早子", "01:00-01:59丑", "02:00-02:59丑", "03:00-03:59寅", "04:00-04:59寅", "05:00-05:59卯", "06:00-06:59卯", "07:00-07:59辰", "08:00-08:59辰", "09:00-09:59巳", "10:00-10:59巳", "11:00-11:59午", "12:00-12:59午", "13:00-13:59未", "14:00-14:59未", "15:00-15:59申", "16:00-16:59申", "17:00-17:59酉", "18:00-18:59酉", "19:00-19:59戌", "20:00-20:59戌", "21:00-21:59亥", "22:00-22:59亥", "23:00-23:59晚子"];
	var mobileSelect1 = new MobileSelect({
		trigger: '#edit_hour',
		title: '修改时辰',
		triggerDisplayData:false,
		wheels: [
					{data: hourArr}
				],
		position:[<{$data.data.h}>], 
		transitionEnd:function(indexArr, data){
			//console.log(data);
		},
		callback:function(modhour, data){
		layui.use('layer', function(){
			$.ajax({
				type : "POST",
				url : "?ac=rtcaiyun",
				data:{"modhour":modhour[0],"oid":"<{$oid}>"},
				dataType: 'json',
				timeout: 30000,
				success : function(data) {
					if (data.code==200) {
					layer.msg('修改成功', {time: 2000},function(){
						window.location.reload();
					});
					}else{
						layer.msg('修改失败,请稍后再试', {time: 2000});
					}
					
				},
				error : function(){
					layer.msg('修改失败,请稍后再试', {time: 2000});
				}

			});
			
			});
		}
	});
	

</script>
  <script src="/statics/ffsm/sslg/js/swiper.min.js"></script>
  
  
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

    $('.tabs2 a').on('touchstart mousedown', function() {
        var _ = $(this);
        _.addClass('on').siblings().removeClass('on');
        tabsSwiper2.slideTo(_.index());
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
     <li><a href="?ac=sslg"><i class="shouye_1"></i><p>测算首页</p></a></li>
     <li><a href="/?ac=history"><i class="wddd_1"></i><p>订单查询</p></a></li>
     <li><a href="?ac=sslg"><em><i class="lijics_1"></i></em><p>继续测算</p></a></li>
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
						//mySwiper.initialSlide=index;
					});
				});

				var swiper2 = new Swiper('.swiper2', {
					freeModeSticky: true,
					direction: 'horizontal',//Slides的滑动方向，可设置水平(horizontal)或垂直(vertical)。
					loop: false,
//					effect : 'fade',//淡入
					//effect : 'cube',//方块
					effect : 'coverflow',//3D流
//					effect : 'flip',//3D翻转
					autoHeight: false,//自动高度。设置为true时，wrapper和container会随着当前slide的高度而发生变化。
					onSlideChangeEnd: function(swiper) {  //回调函数，swiper从一个slide过渡到另一个slide结束时执行。
						var n = swiper.activeIndex;
						setCurrentSlide($(".swiper1 .swiper-slide").eq(n), n);
						swiper1.slideTo(n, 500, false);
					}
				});
			});
		</script>
<{include file='./ffsm/sslg/footer_jg.tpl'}>
<{include file='./ffsm/ss_share.tpl'}>
  </body>
