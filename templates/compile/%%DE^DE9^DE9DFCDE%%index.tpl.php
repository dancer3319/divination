<?php /* Smarty version 2.6.25, created on 2021-05-10 17:26:57
         compiled from ffsm/index.tpl */ ?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8"/>
<title>2021算命占卜测算塔罗牌-<?php echo $this->_tpl_vars['zhanming']; ?>
</title>
<meta name="keywords" content="算命,付费算命,塔罗占卜" />
<meta name="description" content="算命塔罗牌占卜,测算八字合在线起名批八字塔罗牌占卜" />
<meta name="viewport" content="initial-scale=1,maximum-scale=1, minimum-scale=1">
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
<meta content="telephone=no" name="format-detection"/>
<link rel="shortcut icon" href="statics/ffsm/favicon.ico"/>
<link href="statics/ffsm/public/wap.min-v=0817.css" rel="stylesheet" type="text/css"/>
<link href="statics/ffsm/index/swiper.min.css" rel="stylesheet" type="text/css"/>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => './ffsm/wx_share.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<script type="text/javascript" src="statics/ffsm/index/swiper.min.js"></script>
<script src="https://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
<header class="public_header">
<h1 class="public_h_con"><?php echo $this->_tpl_vars['zhanming']; ?>
</h1>
<a href="/?ac=member" class="public_h_menu">个人中心</a></header>
<?php if ($this->_tpl_vars['gundong']): ?><div class="alert-marquee" id="alertMarquee"><p class="inner"><?php echo $this->_tpl_vars['gundong']; ?>
</p></div><?php endif; ?>
<div class="CommonSwiper">
	<div class="swiper-container swiper-container-horizontal swiper-container-wp8-horizontal">
		<div class="swiper-wrapper">
		
		
		
		  <!--
          <div class="swiper-slide">
				<a href="/?ac=rtcaiyun"><img src="/statics/ffsm/rtcaiyun/img/caiyunbg_1.png" class="index_img">
					<p class="img_title"></p>
				</a>
			</div>
		
			
			
          <div class="swiper-slide">
				<a href="/?ac=ssxo"><img src="/statics/ffsm/ssxo/img/banner.jpg" class="index_img">
					<p class="img_title"></p>
				</a>
			</div>
          <div class="swiper-slide">
				<a href="/?ac=ssjf"><img src="/statics/ffsm/ssjf/img/banner.jpg" class="index_img">
					<p class="img_title"></p>
				</a>
			</div>
          <div class="swiper-slide">
				<a href="/?ac=ssnvp"><img src="/statics/ffsm/ssnvp/img/banner.png" class="index_img">
					<p class="img_title"></p>
				</a>
			</div>
          <div class="swiper-slide">
				<a href="/?ac=ssnnp"><img src="/statics/ffsm/ssnnp/img/banner.jpg" class="index_img">
					<p class="img_title"></p>
				</a>
			</div>
				-->
			
			
			
			
			<div class="swiper-slide">
				<a href="/?ac=taluoxinli"><img src="/statics/ffsm/index/images/1.jpg" class="index_img">
					<p class="img_title"></p>
				</a>
			</div>
			<div class="swiper-slide">
				<a href="/?ac=dashi"><img src="/statics/ffsm/index/images/2.jpg" class="index_img">
					<p class="img_title"></p>
				</a>
			</div>
			<!--<div class="swiper-slide">
				<a href="/?ac=hehun"><img src="/statics/ffsm/index/images/4.jpg" class="index_img">
					<p class="img_title"></p>
				</a>
			</div>-->
			<div class="swiper-slide">
				<a href="/?ac=aiqingyun"><img src="/statics/ffsm/index/images/6.jpg" class="index_img">
					<p class="img_title"></p>
				</a>
			</div>
			<div class="swiper-slide">
				<a href="/?ac=bazijp"><img src="/statics/ffsm/index/images/5.jpg" class="index_img">
					<p class="img_title"></p>
				</a>
			</div>
			<div class="swiper-slide">
				<a href="/?ac=xydd"><img src="/statics/ffsm/index/images/7.jpg" class="index_img">
					<p class="img_title"></p>
				</a>
			</div>
			</div>
		<div class="swiper-pagination swiper-pagination-clickable swiper-pagination-bullets"></div>
	</div>
</div>

<div class="menu">
	<ul>
		<li><a href="/?ac=hehun"><img src="/statics/ffsm/index/images/001.jpg" alt="" class="bg1"><p>八字合婚</p></a></li>
		<li><a href="/?ac=taluoanlian"><img src="/statics/ffsm/index/images/002.jpg" alt="" class="bg2"><p>暗恋评估</p></a></li>
		<li><a href="/?ac=taluoyunshi"><img src="/statics/ffsm/index/images/003.jpg" alt="" class="bg3"><p>塔罗占卜</p></a></li>
		<li><a href="/?ac=xmpd"><img src="/statics/ffsm/index/images/004.jpg" alt="" class="bg4"><p>姓名配对</p></a></li>
		<li><a href="/?ac=bzyy"><img src="/statics/ffsm/index/images/005.jpg" alt="" class="bg5"><p>命中注定</p></a></li>
		<li><a href="/?ac=xingzuo"><img src="/statics/ffsm/index/images/006.png" alt="" class="bg6"><p>星座运势</p></a></li>
		<li><a href="/?ac=bazijp"><img src="/statics/ffsm/index/images/007.jpg" alt="" class="bg7"><p>八字精批</p></a></li>
      	<li><a href="/?ac=xydd"><img src="/statics/ffsm/index/images/008.jpg" alt="" class="bg8"><p>点灯祈福</p></a></li>
        <!--<li><a href="/?ac=rtcaiyun"><img src="/statics/ffsm/rtcaiyun/img/caiyun_lg.png" alt="" class="bg2"><p>实时财运</p></a></li>
		<li><a href="/?ac=ssxo"><img src="/statics/ffsm/ssxo/img/ssxo_icon_h.jpg" alt="" class="bg2"><p>实时寻偶</p></a></li>
		<li><a href="/?ac=ssjf"><img src="/statics/ffsm/ssjf/img/ssjf_icon_h.jpg" alt="" class="bg3"><p>实时减肥</p></a></li>
		<li><a href="/?ac=sssx"><img src="/statics/ffsm/sssx/img/sssx_icon_h.png" alt="" class="bg5"><p>实时速学</p></a></li>
		<li><a href="/?ac=ssjs"><img src="/statics/ffsm/ssjs/img/ssjs_icon_h.jpg" alt="" class="bg2"><p>实时健身</p></a></li>
		<li><a href="/?ac=ssjk"><img src="/statics/ffsm/ssjk/img/ssjk_icon_h.jpg" alt="" class="bg3"><p>实时健康</p></a></li>
		<li><a href="/?ac=ssjj"><img src="/statics/ffsm/ssjj/img/ssjj_icon_h.jpg" alt="" class="bg5"><p>实时竞技</p></a></li>
		<li><a href="/?ac=sslg"><img src="/statics/ffsm/sslg/img/sslg_icon_h.jpg" alt="" class="bg2"><p>实时灵感</p></a></li>
		<li><a href="/?ac=ssnvp"><img src="/statics/ffsm/ssnvp/img/ssnvp_icon_h.jpg" alt="" class="bg3"><p>实时男女配</p></a></li>
		<li><a href="/?ac=ssnnp"><img src="/statics/ffsm/ssnnp/img/ssnnp_icon_h.jpg" alt="" class="bg5"><p>实时兄弟情</p></a></li>
		<li><a href="/?ac=ssvvp"><img src="/statics/ffsm/ssvvp/img/ssvvp_icon_h.jpg" alt="" class="bg2"><p>实时闺蜜情</p></a></li>
		<li><a href="/?ac=sscwy"><img src="/statics/ffsm/sscwy/img/sscwy_icon_h.jpg" alt="" class="bg3"><p>实时查外遇</p></a></li>-->
	</ul>
</div>
      
  <div class="xm_item">
    <div class="xm_item_tit">
    <dd>测试街</dd>
    </div>
  <div class="smjlist"> 
   <ul class="clearfix"> 
    <li> <a href="/?ac=gsqm"> <p class="ptit">公司测名</p> <p class="ptxt">最适合的吉祥美名</p> <p class="pimg"><img src="/statics/ffsm/index/images/gsqmi.png" alt="" /></p> </a> </li> 
    <li> <a href="/?ac=yinyuancs"> <p class="ptit">算姻缘</p> <p class="ptxt">想脱单的你必看</p> <p class="pimg"><img src="/statics/ffsm/index/images/0002.jpg" alt="" /></p> </a> </li> 
    <li> <a href="/?ac=hehun"> <p class="ptit">婚前合婚</p> <p class="ptxt">避免短命的婚姻</p> <p class="pimg"><img src="/statics/ffsm/index/images/0003.jpg" alt="" /></p> </a> </li> 
    <li> <a href="/?ac=bazi"> <p class="ptit">算财运</p> <p class="ptxt">财富命盘 偏财运</p> <p class="pimg"><img src="/statics/ffsm/index/images/0004.jpg" alt="" /></p> </a> </li> 
    <li> <a href="/?ac=hmjx"> <p class="ptit">手机号测吉凶</p> <p class="ptxt">解读数字能量</p> <p class="pimg"><img src="/statics/ffsm/index/images/0005.jpg" alt="" /></p> </a> </li>
    <li> <a href="/?ac=xydd"> <p class="ptit">祈福点灯</p> <p class="ptxt">点明灯 招好运</p> <p class="pimg"><img src="/statics/ffsm/index/images/0006.jpg" alt="" /></p> </a> </li> 
   </ul> 
  </div>
  </div>

<!--心理评测部分开始-->
<!--<a target="_blank" href="?ac=yuanma"><div class="aui-loan-body"><h1>付费测试介绍</h1><p>购买-安装-解答-演示-售后</p></div></a>
<div class="fengge_1"><em><a target="_blank" href="/?ac=i2">模版二</a></em>┃<em><a target="_blank" href="/?ac=i3">模板三</em></a></div>
<div class="xm_item">
    <div class="xm_item_tit">
    <dd>心理评测</dd>
    </div>
<div class="xlcslist">
  <ul class="clearfix">
    <li class="item">
      <a class="link" href="https://www.yiadc.com/yuanma.html">
        <img class="img" src="/statics/ffsm/index/images/00001.jpg" alt="爱情测试"></a>
    </li>
    <li class="item">
      <a class="link" href="https://www.yiadc.com/yuanma.html">
        <img class="img" src="/statics/ffsm/index/images/00002.jpg" alt="情商测试"></a>
    </li>
    <li class="item">
      <a class="link" href="https://www.yiadc.com/yuanma.html">
        <img class="img" src="/statics/ffsm/index/images/00003.jpg" alt="抑郁测试"></a>
    </li>
    <li class="item">
      <a class="link" href="https://www.yiadc.com/yuanma.html">
        <img class="img" src="/statics/ffsm/index/images/00004.jpg" alt="职业测试"></a>
    </li>
  </ul>
<p>本套不含心理评测部分，如需请联系我们</p>
</div>
</div>-->
  <!--全部测试-->
 

<div class="xm_item">
    <div class="xm_item_tit">
    <dd>全部测试</dd>
    </div>
<div class="sortlist">
  <ul class="clearfix">
  
  
  
  <!--
  
    <li>
      <a href="/?ac=rtcaiyun">
        <p class="pimg2">
          <img src="/statics/ffsm/rtcaiyun/img/caiyunbg_2.png" alt=""></p>
        <p class="ptxt">观表抓运势，财运滚滚来，彻底改善自身的财运</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>70746测试</span>
          <span>
            <i class="ihp"></i>98.9%好评</span>
        </p>
      </a>
    </li>
  
    
    
    
    
    <li>
      <a href="/?ac=ssxo">
        <p class="pimg">
          <img src="/statics/ffsm/ssxo/img/banner.jpg" alt=""></p>
        <p class="ptxt">想要脱单的你必看</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>30746测试</span>
          <span>
            <i class="ihp"></i>95.9%好评</span>
        </p>
      </a>
    </li>
	<li>
      <a href="/?ac=ssjf">
        <p class="pimg">
          <img src="/statics/ffsm/ssjf/img/banner.jpg" alt=""></p>
        <p class="ptxt">多吃不胖，躺着也能减！</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>84234测试</span>
          <span>
            <i class="ihp"></i>98%好评</span>
        </p>
      </a>
    </li>
	<li>
      <a href="/?ac=ssjs">
        <p class="pimg">
          <img src="/statics/ffsm/ssjs/img/banner.jpg" alt=""></p>
        <p class="ptxt">健身10分钟，效果2小时！</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>3906测试</span>
          <span>
            <i class="ihp"></i>97%好评</span>
        </p>
      </a>
    </li>
	<li>
      <a href="/?ac=ssjk">
        <p class="pimg">
          <img src="/statics/ffsm/ssjk/img/banner.jpg" alt=""></p>
        <p class="ptxt">观身体状态，增强体质</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>5827测试</span>
          <span>
            <i class="ihp"></i>96%好评</span>
        </p>
      </a>
    </li>
	<li>
      <a href="/?ac=ssjj">
        <p class="pimg">
          <img src="/statics/ffsm/ssjj/img/banner.jpg" alt=""></p>
        <p class="ptxt">欧皇十连抽，轻松升段位</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>5536测试</span>
          <span>
            <i class="ihp"></i>92%好评</span>
        </p>
      </a>
    </li>
	<li>
      <a href="/?ac=sslg">
        <p class="pimg">
          <img src="/statics/ffsm/sslg/img/banner.jpg" alt=""></p>
        <p class="ptxt">锁定你的灵感爆发时间</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>1285测试</span>
          <span>
            <i class="ihp"></i>93%好评</span>
        </p>
      </a>
    </li>
	<li>
      <a href="/?ac=ssnvp">
        <p class="pimg">
          <img src="/statics/ffsm/ssnvp/img/banner.png" alt=""></p>
        <p class="ptxt">避免短期的爱情</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>78212测试</span>
          <span>
            <i class="ihp"></i>98%好评</span>
        </p>
      </a>
    </li>
	<li>
      <a href="/?ac=ssnnp">
        <p class="pimg">
          <img src="/statics/ffsm/ssnnp/img/banner.png" alt=""></p>
        <p class="ptxt">纯纯兄弟情，腐女请绕道</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>6348测试</span>
          <span>
            <i class="ihp"></i>94%好评</span>
        </p>
      </a>
    </li>
	<li>
      <a href="/?ac=ssvvp">
        <p class="pimg">
          <img src="/statics/ffsm/ssvvp/img/banner.png" alt=""></p>
        <p class="ptxt">防火防盗防？？？</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>4385测试</span>
          <span>
            <i class="ihp"></i>96%好评</span>
        </p>
      </a>
    </li>
    
     
    
    
    
	<li>
      <a href="/?ac=sscwy">
        <p class="pimg">
          <img src="/statics/ffsm/sscwy/img/banner.png" alt=""></p>
        <p class="ptxt">TA现在渣吗？</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>7892测试</span>
          <span>
            <i class="ihp"></i>91.9%好评</span>
        </p>
      </a>
    </li>
	<li>
      <a href="/?ac=sssx">
        <p class="pimg">
          <img src="/statics/ffsm/sssx/img/banner.jpg" alt=""></p>
        <p class="ptxt">你和天才，只差高效的学习时间</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>60823测试</span>
          <span>
            <i class="ihp"></i>95.9%好评</span>
        </p>
      </a>
    </li>

    
    <li>
      <a href="/?ac=rtcaiyun">
        <p class="pimg">
          <img src="/statics/ffsm/rtcaiyun/img/caiyunbg_2.png" alt=""></p>
        <p class="ptxt">观表抓运势，财运滚滚来，彻底改善自身的财运</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>70746测试</span>
          <span>
            <i class="ihp"></i>98.9%好评</span>
        </p>
      </a>
    </li>
    -->
    
    
    
    
    
    
    <li>
      <a href="/?ac=xydd">
        <p class="pimg">
          <img src="/statics/ffsm/index/images/12.jpg" alt=""></p>
        <p class="ptxt">点灯祈福，数万缘友加持助你达成心愿！</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>649197测试</span>
          <span>
            <i class="ihp"></i>99%好评</span>
        </p>
      </a>
    </li>
    
    
  
    
    
    
    <li>
      <a href="/?ac=xingzuo">
        <p class="pimg">
          <img src="/statics/ffsm/index/images/xingzuo.jpg" alt=""></p>
        <p class="ptxt">2021年十二星座运势分析专业版</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>254160测试</span>
          <span>
            <i class="ihp"></i>98.8%好评</span>
        </p>
      </a>
    </li>
    <li>
      <a href="/?ac=taluoaiqing">
        <p class="pimg">
          <img src="/statics/ffsm/index/images/21.jpg" alt=""></p>
        <p class="ptxt">深度占卜，让你更加透彻的了解自己的感情</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>1080746测试</span>
          <span>
            <i class="ihp"></i>97.8%好评</span>
        </p>
      </a>
    </li>
    <li>
      <a href="/?ac=ziwei">
        <p class="pimg">
          <img src="/statics/ffsm/index/images/16.jpg" alt=""></p>
        <p class="ptxt">知流年安太岁，事事顺遂</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>15409测试</span>
          <span>
            <i class="ihp"></i>97.9%好评</span>
        </p>
      </a>
    </li>
    <li>
      <a href="/?ac=taluobieren">
        <p class="pimg">
          <img src="/statics/ffsm/index/images/22.jpg" alt=""></p>
        <p class="ptxt">他心里只有你，还是开始有了别人</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>14501测试</span>
          <span>
            <i class="ihp"></i>97.9%好评</span>
        </p>
      </a>
    </li>
    <li>
      <a href="/?ac=taluoxinli">
        <p class="pimg">
          <img src="/statics/ffsm/index/images/02.jpg" alt=""></p>
        <p class="ptxt">塔罗牌占卜-揭秘Ta的心里究竟有没有你？</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>16509测试</span>
          <span>
            <i class="ihp"></i>好评</span>
        </p>
      </a>
    </li>
    <li>
      <a href="/?ac=taluojixu">
        <p class="pimg">
          <img src="/statics/ffsm/index/images/20.jpg" alt=""></p>
        <p class="ptxt">和你现在的恋人该继续发展下去吗？</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>92299测试</span>
          <span>
            <i class="ihp"></i>97.1%好评</span>
        </p>
      </a>
    </li>
    <li>
      <a href="/?ac=jinnian">
        <p class="pimg">
          <img src="/statics/ffsm/index/images/2020.jpg" alt=""></p>
        <p class="ptxt">2021庚子牛年运势分析、抢占先机</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>514812</span>
          <span>
            <i class="ihp"></i>99.6%好评</span>
        </p>
      </a>
    </li>
    <li>
      <a href="/?ac=xmpd">
        <p class="pimg">
          <img src="/statics/ffsm/index/images/05.jpg" alt=""></p>
        <p class="ptxt">从姓名分析你们的缘分深浅</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>684021测试</span>
          <span>
            <i class="ihp"></i>98.3%好评</span>
        </p>
      </a>
    </li>
    <li>
      <a href="/?ac=bazijp">
        <p class="pimg">
          <img src="/statics/ffsm/index/images/06.jpg" alt=""></p>
        <p class="ptxt">神准预测！传统八字详批</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>33835测试</span>
          <span>
            <i class="ihp"></i>97.9%好评</span>
        </p>
      </a>
    </li>
    <li>
      <a href="/?ac=hmjx">
        <p class="pimg">
          <img src="/statics/ffsm/index/images/07.jpg" alt=""></p>
        <p class="ptxt">您的手机号码蕴含什么魔力？</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>65884测试</span>
          <span>
            <i class="ihp"></i>97.9%好评</span>
        </p>
      </a>
    </li>
    <li>
      <a href="/?ac=hehun">
        <p class="pimg">
          <img src="/statics/ffsm/index/images/08.jpg" alt=""></p>
        <p class="ptxt">[专业合婚配对]开启专属你们的婚姻幸福密码</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>549631测试</span>
          <span>
            <i class="ihp"></i>97.5%好评</span>
        </p>
      </a>
    </li>
    <li>
      <a href="/?ac=xmfx">
        <p class="pimg">
          <img src="/statics/ffsm/index/images/xmfx.jpg" alt=""></p>
        <p class="ptxt">你的名字跟你的八字相合还是相冲突，能搭配吗？</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>14501测试</span>
          <span>
            <i class="ihp"></i>97.9%好评</span>
        </p>
      </a>
    </li>
    <li>
      <a href="/?ac=bazi">
        <p class="pimg">
          <img src="/statics/ffsm/index/images/10.jpg" alt=""></p>
        <p class="ptxt">想成为有钱人？八字财运告诉你发财机会</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>27949测试</span>
          <span>
            <i class="ihp"></i>97.9%好评</span>
        </p>
      </a>
    </li>
    <li>
      <a href="/?ac=yinyuancs">
        <p class="pimg">
          <img src="/statics/ffsm/index/images/11.jpg" alt=""></p>
        <p class="ptxt">恋爱桃花运 看看你最近异性缘怎么样？</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>465181测试</span>
          <span>
            <i class="ihp"></i>97.9%好评</span>
        </p>
      </a>
    </li>
    <li>
      <a href="/?ac=xydd">
        <p class="pimg">
          <img src="/statics/ffsm/index/images/12.jpg" alt=""></p>
        <p class="ptxt">点灯祈福，数万缘友加持助你达成心愿！</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>649197测试</span>
          <span>
            <i class="ihp"></i>99%好评</span>
        </p>
      </a>
    </li>
    <li>
      <a href="/?ac=bzyy">
        <p class="pimg">
          <img src="/statics/ffsm/index/images/13.jpg" alt=""></p>
        <p class="ptxt">月老牵线，紧抓真爱机缘</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>329487测试</span>
          <span>
            <i class="ihp"></i>98.6%好评</span>
        </p>
      </a>
    </li>
    <li>
      <a href="/?ac=aiqingyun">
        <p class="pimg">
          <img src="/statics/ffsm/index/images/14.jpg" alt=""></p>
        <p class="ptxt">看你什么时候会恋爱结婚</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>38792测试</span>
          <span>
            <i class="ihp"></i>97.9%好评</span>
        </p>
      </a>
    </li>
    <li>
      <a href="/?ac=bazi">
        <p class="pimg">
          <img src="/statics/ffsm/index/images/15.jpg" alt=""></p>
        <p class="ptxt">看事业财运,能否飞黄腾达一看便知</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>291903测试</span>
          <span>
            <i class="ihp"></i>97.9%好评</span>
        </p>
      </a>
    </li>
    <li>
      <a href="/?ac=ffqm">
        <p class="pimg">
          <img src="/statics/ffsm/index/images/17.jpg" alt=""></p>
        <p class="ptxt">宝宝起名 送宝宝一世好名（命）</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>204732测试</span>
          <span>
            <i class="ihp"></i>98.7%好评</span>
        </p>
      </a>
    </li>
    <li>
      <a href="/?ac=ziwei">
        <p class="pimg">
          <img src="/statics/ffsm/index/images/18.jpg" alt=""></p>
        <p class="ptxt">紫薇命盘，揭命运本质</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>288765测试</span>
          <span>
            <i class="ihp"></i>98.8%好评</span>
        </p>
      </a>
    </li>
    <li>
      <a href="/?ac=taluotuodan">
        <p class="pimg">
          <img src="/statics/ffsm/index/images/19.jpg" alt=""></p>
        <p class="ptxt">未来三个月内你会脱单吗？</p>
        <p class="pbot">
          <span>
            <i class="ics"></i>158751测试</span>
          <span>
            <i class="ihp"></i>96.8%好评</span>
        </p>
      </a>
    </li>
  </ul>
<div class="group_container" id="taluo">
   <div id="tab_scroll_2"></div>
   <img class="part_title" src="/statics/ffsm/index/images/sycy_title1.png" alt="">
   <div class="cs_item">
    <div class="left">
     <a href="/?ac=taluofuhe"><img class="cs_img" src="/statics/ffsm/index/images/taluofuhe.png" alt=""></a>
    </div>
    <a href="/?ac=taluofuhe"><div class="right">
     立即查看
    </div>
    <div class="middle">
     <div class="div_one">
      你能和前任复合吗
     </div>
     <div class="div_two">
      精准分析→你是否应该和前任复合←
     </div>
     <div class="div_three">
      <img src="/statics/ffsm/index/images/cesuan_icon.png" alt="">
      <span>39.15万人查看</span>
      <img class="img_haoping" src="/statics/ffsm/index/images/haoping_icon.png" alt="">
      <span>98.4%好评</span>
     </div>
    </div></a>
   </div>
   <div class="cs_item">
    <div class="left">
     <a href="/?ac=taluozuihou"><img class="cs_img" src="/statics/ffsm/index/images/zuihou.png" alt=""></a>
    </div>
    <a href="/?ac=taluozuihou"><div class="right">
     立即查看
    </div>
    <div class="middle">
     <div class="div_one">
      你和TA能走到最后吗？
     </div>
     <div class="div_two">
      你爱的人和你真的合适吗？
     </div>
     <div class="div_three">
      <img src="/statics/ffsm/index/images/cesuan_icon.png" alt="">
      <span>31.14万人查看</span>
      <img class="img_haoping" src="/statics/ffsm/index/images/haoping_icon.png" alt="">
      <span>96.2%好评</span>
     </div>
    </div></a>
   </div>
   
   <div class="cs_item">
    <div class="left">
     <a href="/?ac=taluofenshou"><img class="cs_img" src="/statics/ffsm/index/images/taluofenshou.png" alt=""></a>
    </div>
    <a href="/?ac=taluofenshou"><div class="right">
     立即查看
    </div>
    <div class="middle">
     <div class="div_one">
      你和他该分手吗？
     </div>
     <div class="div_two">
      失望？心累？感情还要继续吗？
     </div>
     <div class="div_three">
      <img src="/statics/ffsm/index/images/cesuan_icon.png" alt="">
      <span>31.14万人查看</span>
      <img class="img_haoping" src="/statics/ffsm/index/images/haoping_icon.png" alt="">
      <span>96.2%好评</span>
     </div>
    </div></a>
   </div>
</div>

   <div class="cs_item">
    <div class="left">
     <a href="/?ac=taluoanlian"><img class="cs_img" src="/statics/ffsm/index/images/taluoanlian.png" alt=""></a>
    </div>
    <a href="/?ac=taluoanlian"><div class="right">
     立即查看
    </div>
    <div class="middle">
     <div class="div_one">
      塔罗牌暗恋对象评估
     </div>
     <div class="div_two">
      什么相处模式最适合你们？
     </div>
     <div class="div_three">
      <img src="/statics/ffsm/index/images/cesuan_icon.png" alt="">
      <span>31.14万人查看</span>
      <img class="img_haoping" src="/statics/ffsm/index/images/haoping_icon.png" alt="">
      <span>96.2%好评</span>
     </div>
    </div></a>
   </div>
</div>

</div>
</div>
<script type="text/javascript" src="/statics/ffsm/public/js/dibu.js"></script>
<link href="/statics/user/css/extend_module.css" rel="stylesheet" type="text/css"/>
<div class="zcdgbox"><a href="javascript:void(0)" class="back_top" id="back_top" style="display: inline-block;"></a></div>
<div class="zxcs-fixed">
  <div class="tabs-wrapper">
    <div class="tab index-tab">
      <div class="icon icon-sy">
        <img src="/statics/ffsm/index/images/daquan.png"></div>
      <div class="active tab-name">测试大全</div></div>
    <div class="tab index-tab" onclick="window.open('/?ac=dashi','_self')">
      <div class="icon icon-sy">
        <img src="/statics/ffsm/index/images/dashiyy.png"></div>
      <div class="tab-name">大师预约</div></div>
      
      
    <!--
    <div class="tab index-tab" onclick="window.open('?ac=rtcaiyun','_self')">
      <div class="icon icon-sy">
        <img src="/statics/ffsm/index/images/yun.png">
      </div>
      <div class="tab-name">实时运程</div>
    </div>
   -->

  </div>
  
  
  
</div>

<script language="javascript">   
function keypress1() javascript:;
{  
    var text1 = document.getElementById("title").value;  
    var len = 30 - text1.length;  
    var show = "" + len + "";  
    document.getElementById("name").innerText = show;  
}
        function toggle(targetid){
            if (document.getElementById){
                target=document.getElementById(targetid);
                if (target.style.display=="block"){
                    target.style.display="none";
                } else {
                    target.style.display="block";
                }
            }
        }
</script>
<script>
	//图片轮播
	var swiper = new Swiper('.swiper-container', {
		slidesPerView: 1,
		autoplay: {
			delay: 2000,
			disableOnInteraction: false,
		},
		loop: true,
		pagination: {
			el: '.swiper-pagination',
			clickable: false,
		},
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		},
	});

	//TAB——Box
	var switchBox=$('.m-wrap'),
		switchTit=$('#tab>li');
	function xun(num){
		for(var i=0,len=switchBox.length;i<len;i++){
			if(num == i){
				switchBox[i].style.display="block";
			}else{
				switchBox[i].style.display='none';
			}
		}
	}
	for(var j=0;j<switchTit.length;j++){
		switchTit[j].setAttribute('data-num',j);
		switchTit[j].addEventListener('click',function(){
			var num=this.getAttribute('data-num');
			$(this).parents('ul').find('li').find('div').removeClass('select').siblings('span').removeClass('line');
			$(this).find('div').addClass('select').siblings('span').addClass('line');
			xun(num);
		})
	}
</script>
<footer class="public_footer">
</p>
<?php echo $this->_tpl_vars['shouyedb']; ?>



<!--
<p><a href="https://qcapism.nedor.cn/?ac=yuanma" target="_blank" class="public_footer_words">得到科技新版qq43676791</a></p>
-->

<img src="/statics/ffsm/index/images/footer.png" alt="">
</footer>
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?<?php echo $this->_tpl_vars['tongjidm']; ?>
";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => './ffsm/footers.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => './ffsm/dl_ck.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
</body>
</html>