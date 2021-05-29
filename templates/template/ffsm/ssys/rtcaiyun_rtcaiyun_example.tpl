<!DOCTYPE html>
<html lang="en"><head>
  <meta charset="utf-8">
  <title>实时运势示范例子</title>
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

  <link rel="stylesheet" href="/statics/ffsm/rtcaiyun/css/swiper.min.css">
  <link rel="stylesheet" href="/statics/ffsm/rtcaiyun/css/style.css">
  
  <link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
  <link href="/statics/ffsm/rtcaiyun/css/page1.css" rel="stylesheet" type="text/css"/>


  <script src="/statics/ffsm/rtcaiyun/js/vue.min.js"></script>
  <script src="/statics/ffsm/rtcaiyun/js/jquery.min.js"></script>
  <link rel="stylesheet" href="/statics/ffsm/rtcaiyun/layui/css/layui.css">  
  <link rel="stylesheet" href="/statics/ffsm/rtcaiyun/css/font/iconfont.css">
  <link rel="stylesheet" href="/statics/ffsm/rtcaiyun/css/public.css">
  <link rel="stylesheet" type="text/css" href="/statics/ffsm/rtcaiyun/css/mobileSelect.css">
  <script src="/statics/ffsm/rtcaiyun/js/mobileSelect.min.js" type="text/javascript"></script>

</head>
<body>
<script src="/statics/ffsm/rtcaiyun/layui/layui.js"></script>
<div id="order">
<div class="public_header">
<h1 class="public_h_con">实时运势</h1>
<a class="public_h_home" href="/"></a><a href="#" class="public_h_menu":class="show" @click="chooseCoupon">我的测算</a></div>
<div class="alert-marquee" id="alertMarquee"><p class="inner">每天凌晨更新数据,提供当天前后7天的实时数据！</p></div>
<div :class="show?'shadow':'shadowHide'" @click="chooseCoupon">

	</div>
<div id="coupon" :class="show?'coupon':'couponHide'">
		
		<div class="choseType">
			<div class="chose">
				<span @click="switchType(0)">已购订单({{couPonData.length}})</span>
				<span @click="switchType(1)">过期或未购买({{noCouPonData.length}})</span>
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
						<div class="sale">{{item.money}}¥</div>
						<div class="word">{{item.useMessage}}</div>
					</div>
					<div class="flexCol date">
						<div class="title">{{item.name}}</div>
						<div class="word">有效期{{item.date}}</div>
					</div>
					
				</div>
				<div v-else class="flexRow couponCardHeader">
					<div class="flexCol money">
						<div class="noSale">{{item.money}}¥</div>
						<div class="word">{{item.useMessage}}</div>
					</div>
					<div class="flexCol date">
						<div class="noTitle">{{item.name}}</div>
						<div class="word">有效期{{item.date}}</div>
					</div>
				</div>
				<a v-bind:href="item.url" ><div class="couponMsg">
					查看详情
				</div></a>
			</div>
		</div>
	</div>
</div> 

<div class="userinfo">
	<div class="userinfo_box">
		<div class="userinfo_box_left">
			<div class="userinfo_left_info">
				<p class="name"><{$ssysdata.name}><{if $ssysdata.gender==1}><span class="male">♂</span><{else}><span class="female">♀</span><{/if}></p>
				<p class="birthday" id="edit_hour">阳历：<{$ssysdata.us_calendar}> <i class="layui-icon layui-icon-edit"></i></p>
				
			</div>
		</div>
		<div class="userinfo_right" >
			<div class="userinfo_right_btn <{$return.wx_col}> layui-anim layui-anim-scale" id="sx_tip">
			<i class="icon iconfont <{$return.sx_icon}>"></i></div>
		</div>
	</div>
</div>

<div class="userinfo_tab">
<ul>
	<li class="bd1"><i class="icon iconfont icon-jianshen1"></i><span class="tex_n">精</span></li>
	<li class="bd1"><i class="icon iconfont icon-yunqiniuniu"></i><span class="tex_n">气</span></li>
	<li><i class="icon iconfont icon-shuji"></i><span class="tex_n">神</span></li>
	<li class="bd1"><span class="tex_n"><{$ssysdata.date_jqs.jin}></span></li>
	<li class="bd1"><span class="tex_n"><{$ssysdata.date_jqs.qi}></span></li>
	<li><span class="tex_n"><{$ssysdata.date_jqs.shen}></span></li>
</ul>
</div>
 <div class="later_tip_bgsz">
 
<div class="layui-collapse" lay-accordion>
  <div class="layui-colla-item">
    <h2 class="layui-colla-title sxtit bg_fff">事件解析</h2>
    <div class="layui-colla-content layui-card-body bg_fff">
		<br>
		<{$ssysdata.parsing}>
		<br>
		<br>
		 
	</div>
  </div>
 <div class="layui-colla-item">
    <h2 class="layui-colla-title sxtit bg_fff">Ta的属性</h2>
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
		<tr>
		  <td><{$ssysdata.my_attr.collocation}></td>
		  <td><{$ssysdata.my_attr.class}></td>
		  <td><{$ssysdata.my_attr.content}></td>
		</tr>
		
	  </tbody>
	</table>
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
  
  <div class="layui-colla-item">
    <h2 class="layui-colla-title sxtit bg_fff">常见问题&联系客服</h2>
    <div class="layui-colla-content layui-card-body bg_fff">
		<div class="layui-collapse" lay-accordion>
		<{foreach from=$faq key=k item=v}>		
		  <div class="layui-colla-item">
			<h2 class="layui-colla-title"><{$k+1}>.<{$v.question}></h2>
			<div class="layui-colla-content later_faq"><{$v.answer}></div>
		  </div>
		  <{/foreach}>
		</div>		 
	</div>
  </div>
</div>

</div>
<div class="later_tip_bgsz" style="padding-top: 0;">
	<div class="layui-card">
	  <div class="layui-card-header sxtit_by"><i class="layui-icon layui-icon-chart-screen"></i> 观表抓运势，财运滚滚来</div>
	  <div class="layui-card-body">
		① 数值小于1为差，1-3为普通。<br>
		② 下面数值<font color="red">大于3为优</font>，同时会显示<font color="red">红色</font>，
		数值越大代表该方向越好。<br>
		③ 下面数据值和上面精气神数据不同,
		上面是精气神比例,下面可以看做兑换的比率。
		
	  </div>
	</div>
</div>
<div class="later_tip_bgsz" style="padding-bottom: 15px;">
	<a href="?ac=rtcaiyun" class="layui-btn sxtit layui-btn-danger layui-btn-fluid">立即开启我的实时运势</a> 
</div>
<div class="wrapper">
    <div class="tabs">
        <a href="javascript:;" class="on">实时运势</a>
        <a href="javascript:;">参照表</a>
		<a href="javascript:;">详细解析</a>
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
					<a href="javascript:;"><{$date_time.h3}></a>
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
                              <th><font color="red">财运值</font></th>
							  
							</tr> 
						  </thead>
						  <tbody>
						  <{foreach from=$ssysdata.date_q3 key=k item=v}>
							<tr>
							  <td><i class="layui-icon layui-icon-log"></i> <{$k}>:00</td>
							  <td><{$v.zybl.j}></td>
							  <td><{$v.zybl.q}></td>
							  <td><{$v.zybl.s}></td>
							   <td><{if $v.zybl.zh>=100}><font color="red"><{$v.zybl.zh}>%</font><{else}><{$v.zybl.zh}>%<{/if}></td>
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
                              <th><font color="red">财运值</font></th>
							  
							</tr> 
						  </thead>
						  <tbody>
						  <{foreach from=$ssysdata.date_q2 key=k item=v}>
							<tr>
							  <td><i class="layui-icon layui-icon-log"></i> <{$k}>:00</td>
							  <td><{$v.zybl.j}></td>
							  <td><{$v.zybl.q}></td>
							  <td><{$v.zybl.s}></td>
							   <td><{if $v.zybl.zh>=100}><font color="red"><{$v.zybl.zh}>%</font><{else}><{$v.zybl.zh}>%<{/if}></td>
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
                               <th><font color="red">财运值</font></th>
							  
							</tr> 
						  </thead>
						  <tbody>
						  <{foreach from=$ssysdata.date_q1 key=k item=v}>
							<tr>
							  <td><i class="layui-icon layui-icon-log"></i> <{$k}>:00</td>
							  <td><{$v.zybl.j}></td>
							  <td><{$v.zybl.q}></td>
							  <td><{$v.zybl.s}></td>
							   <td><{if $v.zybl.zh>=100}><font color="red"><{$v.zybl.zh}>%</font><{else}><{$v.zybl.zh}>%<{/if}></td>
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
                              <th><font color="red">财运值</font></th>
							  
							</tr> 
						  </thead>
						  <tbody>
						  <{foreach from=$ssysdata.date_td key=k item=v}>
							<tr>
							  <td><i class="layui-icon layui-icon-log"></i> <{$k}>:00</td>
							  <td><{$v.zybl.j}></td>
							  <td><{$v.zybl.q}></td>
							  <td><{$v.zybl.s}></td>
							   <td><{if $v.zybl.zh>=100}><font color="red"><{$v.zybl.zh}>%</font><{else}><{$v.zybl.zh}>%<{/if}></td>
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
                              <th><font color="red">财运值</font></th>
							  
							</tr> 
						  </thead>
						  <tbody>
						  <{foreach from=$ssysdata.date_h1 key=k item=v}>
							<tr>
							  <td><i class="layui-icon layui-icon-log"></i> <{$k}>:00</td>
							  <td><{$v.zybl.j}></td>
							  <td><{$v.zybl.q}></td>
							  <td><{$v.zybl.s}></td>
							   <td><{if $v.zybl.zh>=100}><font color="red"><{$v.zybl.zh}>%</font><{else}><{$v.zybl.zh}>%<{/if}></td>
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
                              <th><font color="red">财运值</font></th>
							  
							</tr> 
						  </thead>
						  <tbody>
						  <{foreach from=$ssysdata.date_h2 key=k item=v}>
							<tr>
							  <td><i class="layui-icon layui-icon-log"></i> <{$k}>:00</td>
							  <td><{$v.zybl.j}></td>
							  <td><{$v.zybl.q}></td>
							  <td><{$v.zybl.s}></td>
							   <td><{if $v.zybl.zh>=100}><font color="red"><{$v.zybl.zh}>%</font><{else}><{$v.zybl.zh}>%<{/if}></td>
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
							<tr><th colspan="5" class="date_show"><{$date_time.date_h3}></th></tr> 
							<tr>
							
							   <th>时间</th>
							  <th>精<br>(身体)</th>
							  <th>气<br>(运气)</th>
							  <th>神<br>(智慧)</th>
                              <th><font color="red">财运值</font></th>
							  
							</tr> 
						  </thead>
						  <tbody>
						  <{foreach from=$ssysdata.date_h3 key=k item=v}>
							<tr>
							  <td><i class="layui-icon layui-icon-log"></i> <{$k}>:00</td>
							  <td><{$v.zybl.j}></td>
							  <td><{$v.zybl.q}></td>
							  <td><{$v.zybl.s}></td>
                              <td><{if $v.zybl.zh>=100}><font color="red"><{$v.zybl.zh}>%</font><{else}><{$v.zybl.zh}>%<{/if}></td>
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
				<h2 class="layui-colla-title sxtit"><{if $v.jqs==1}>体<{elseif $v.jqs==2}>气<{else}>智<{/if}> 分值：<{$v.score}> <{$v.level}> </h2>
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
					<td class="col"><{$ssysdata.date_jqs.bz.0}></td>
					<td class="col"><{$ssysdata.date_jqs.bz.2}></td>
					<td class="col"><{$ssysdata.date_jqs.bz.4}></td>
					<td class="col"><{$ssysdata.date_jqs.bz.6}></td>
					<td class="col" colspan="3">未解锁</td>
					</tr>
				  <tr>
					<td>地支</td>
					<td class="col"><{$ssysdata.date_jqs.bz.1}></td>
					<td class="col"><{$ssysdata.date_jqs.bz.3}></td>
					<td class="col"><{$ssysdata.date_jqs.bz.5}></td>
					<td class="col"><{$ssysdata.date_jqs.bz.7}></td>
					<td class="col" colspan="3">未解锁</td>
					</tr>
				  <tr>
					<td>五行</td>
					<td class="col" colspan="7">未解锁</td>

					</tr>
				  <tr>
					<td>十神</td>
					<td class="col" colspan="7">未解锁</td>
					</tr>
				  <tr>
					<td>藏干</td>
					<td class="col" colspan="7">未解锁</td>
					</tr>
				  <tr>
					<td>藏干十神</td>
					<td class="col" colspan="7">未解锁</td>
					</tr>
				  <tr>
					<td>纳音</td>
					<td class="col" colspan="7">未解锁</td>
					</tr>
				  <tr>
					<td>旬空</td>
					<td class="col" colspan="7">未解锁</td>
				  </tr>
				  <tr>
					<td>纳音命宫</td>
					<td class="col" colspan="7">未解锁</td>
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
		layer.msg('生肖：<{$return.sx}>');
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
		transitionEnd:function(indexArr, data){
			//console.log(data);
		},
		callback:function(modhour, data){
			layui.use('layer', function(){
				layer.msg('示范例子不可修改', {time: 3000});
			});
		}
	});
	

</script>
  <script src="/statics/ffsm/rtcaiyun/js/swiper.min.js"></script>
  
  
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
    <{if $i.oid && $i.endtime>$i.dqtime && $i.status==1}>
	{"name":'<{$i.data.username}>',"money":"<{$i.money}>","useMessage":"实时财运","date":"<{$i.endtime|date_format:'%Y.%m.%d'}>","url":"<{$i.url}>",'isUse':true},
     <{/if}>
 <{/foreach}> 
            ],
            
            noCouPonData:[
				<{foreach key =k1 item=i1 from=$my_order}>
				<{if $i1.oid && ($i1.endtime<=$i1.dqtime || $i1.status==0)}>
                {"name":'<{$i.data.username}>',"money":"<{$i.money}>","useMessage":"实时财运","date":"<{$i.createtime|date_format:'%Y.%m.%d'}>","url":"<{$i.url}>",'isUse':false},
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
                        this.dataObj = this.noCouPonData;
                        break;
                }
            },
            chooseCoupon(){
                this.show = !this.show;
            }
        }
    })
</script>
<div class="ainuo_foot_nav cl" id="testFixedBtn" style="height: 44px;">
    <ul>
     <li><a href="?ac=rtcaiyun"><i class="shouye_1"></i><p>测算首页</p></a></li>
     <li><a href="/?ac=history"><i class="wddd_1"></i><p>订单查询</p></a></li>
     <li><a href="?ac=rtcaiyun"class="botpost"><em><i class="lijics_1"></i></em><p>继续测算</p></a></li>
     <li><a href="javascript:void(0)" onclick="dcwjalert()"><i class="gengduo_1"></i><p>建议反馈</p></a></li>
     <li><a href="/?ac=member"><i class="grzx_1"></i><p>个人中心</p></a></li>
    </ul>
</div>
<style type="text/css">
.ainuo_foot_nav{display: block; padding: 2px 0; background:#ff2e0c; position: fixed; bottom: 0; width: 100%; z-index: 99;max-width:640px;}
.ainuo_foot_nav ul{margin: 0;padding: 0;}
.ainuo_foot_nav li{width: 20%; text-align: center; float: left;}
.ainuo_foot_nav li a{width: 100%; display: block;}
.ainuo_foot_nav .foothover i{color: #f13030;}
.ainuo_foot_nav li i{display: block; line-height: 25px; height: 25px; margin: auto; padding: 0; width: 25px; overflow: hidden; background-size: 100%;}
.ainuo_foot_nav li a.botpost{position: relative; margin-top: -11px; background-color: rgba(0,0,0,0.0);}
.ainuo_foot_nav li a.botpost em{background: #ffffff; padding: 2px; border: 1px solid #ff5e5e; display: block; border-radius: 50%; width: 30px; height: 30px; margin: 0 auto; margin-bottom: 2px;padding-bottom: 0px;}
.ainuo_foot_nav li p{overflow: hidden; font-size: 12px; height: 16px; line-height: 16px; color: #fff; font-weight: 400;margin: 0;padding: 0;}
.shouye_1{background: url(/statics/ffsm/public/images/shouye.png) no-repeat;}
.wddd_1{background: url(/statics/ffsm/public/images/dingdan.png) no-repeat;}
.lijics_1{background: url(/statics/ffsm/public/images/suan.png) no-repeat;}
.gengduo_1{background: url(/statics/ffsm/public/images/gengduo.png) no-repeat;}
.grzx_1{background: url(/statics/ffsm/public/images/grzx.png) no-repeat;}
</style>
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
<{include file='./ffsm/ssys/footer_jg.tpl'}>
<{include file='./ffsm/dl_ck_nojq.tpl'}>
  </body>
