<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8"/>
<title><{$data.name}>和<{$data.name_a}>合婚测试结果-<{$zhanming}></title>
<meta name="keywords" content="八字合婚,周易八字配对,在线八字合婚,八字合婚免费测试" />
<meta name="description" content="<{$zhanming}>提供婚姻测试八字合婚服务，解开婚姻与八字的姻缘关系，普渡每一个善信的有缘人，我们衷心祝愿您拥有幸福的婚姻生活。" />
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
<meta content="telephone=no" name="format-detection"/>
<link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
<link href="/statics/ffsm/bazihehun/1/wap.min.css" rel="stylesheet" type="text/css"/>
<link href="/statics/ffsm/bazihehun/1/bazihehun.min.css" rel="stylesheet" type="text/css"/>
<{include file='./ffsm/wx_share.tpl'}>
<script src="https://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
<div class="hehun_1">
<header class="public_header">
<h1 class="public_h_con">八字合婚</h1>
<a class="public_h_home" href="/"></a><a href="/?ac=history" class="public_h_menu">我的测试</a></header>
<div class="public_banner">
	<img src="/statics/ffsm/bazihehun/1/images/mainb.jpg" alt="八字合婚"/>
</div>
<div class="order_wrapper">
	<div class="order_code">
		订单编号：<{$oid}>
	</div>
	<div class="user_info">
		<div class="user_info_box left">
			<p class="tit"><{$data.name}></p>
			<p><img src="/statics/ffsm/bazihehun/1/images/big_man.jpg" alt="先生"/></p>
			<p><{$data.gongli1}></p>
		</div>
		<span class="icon_center"><img src="/statics/ffsm/bazihehun/1/images/icon_hehun.png" alt="#"/></span>
		<div class="user_info_box right">
			<p class="tit"><{$data.name_a}></p>
			<p><img src="/statics/ffsm/bazihehun/1/images/big_woman.jpg" alt="小姐"/></p>
			<p><{$data.gongli2}></p>
		</div>
	</div>
</div>
<div class="pay_item">
	<div class="words">
		<span><{$data.name}>与<{$data.name_a}>的合婚结果</span>
	</div>
    <div class="public_bzhh_title J_payPopupShow">
		<span class="left"></span><span class="right"></span><span class="center">第一：<{$data.name}>先生的命格</span><i></i>
	</div>
	<div class="public_lock_content">
		<div class="list1 left">
			<p>生肖：<b><{$data.shengxiao1}></b> 命宫：<b>为<{$data.m_n}></b></p>
			<p>十神：<b><{$data.shishen1}> | <{$data.shishen2}></b></p>
            <p>乾造：<b><{$data.qianzao1}></b></p>
            <p>支十神：<b><{$data.zhishishen1}></b></p>
            <p>十神：<{$data.shishen_for1}></p>
            <p>您属于：<{$data.m_na}>四命，宜住<{$data.m_na}>四宅的房子为最佳，<br>最佳坐向：<{$data.m_nfw}></p>
		</div>
	</div>
    <div class="public_bzhh_title J_payPopupShow">
		<span class="left"></span><span class="right"></span><span class="center">第二：<{$data.name_a}>小姐的命格</span><i></i>
	</div>
	<div class="public_lock_content">
		<div class="list1 left">
			<p>生肖：<b><{$data.shengxiao2}></b> 命宫：<b>为<{$data.m_v}></b></p>
			<p>十神：<b><{$data.shishenb1}> | <{$data.shishenb2}></b></p>
            <p>坤造： <b><{$data.qianzao2}></b></p>
            <p>支十神：<b><{$data.zhishishen2}></b></p>
            <p>十神：<{$data.shishen_for2}></p>
            <p>您属于： <{$data.m_va}>四命，宜住<{$data.m_va}>四宅的房子为最佳，最佳坐向：<{$data.m_vfw}></p>
		</div>
	</div>
	
	<div class="public_bzhh_title J_payPopupShow">
		<span class="left"></span><span class="right"></span><span class="center">第三：从生肖角度论配婚吉凶（合婚指数）</span><i></i>
	</div>
	<div class="public_lock_content">
		<div class="list2 left">
			<p><{$data.haar1}></p>
		</div>
		<div class="right J_payPopupShow">
		</div>
	</div>
	<div class="public_bzhh_title J_payPopupShow">
		<span class="left"></span><span class="right"></span><span class="center">第四：从星座角度分析<{$data.name_a}>与<{$data.name}>的合婚</span><i></i>
	</div>
	<div class="public_lock_content">
		<div class="list2 left">
			<p><b style="color:#00b98d;">配对指数</b></p>
			<p><{$xz.shorttxt}></p>
			<p><b style="color:#00b98d;">配对分析</b></p>
			<p><{$xz.content}></p>
		</div>
		<div class="right J_payPopupShow">
		</div>
	</div>
	<div class="public_bzhh_title J_payPopupShow">
		<span class="left"></span><span class="right"></span><span class="center">第五：从正五行角度论配婚吉凶（合婚指数）</span><i></i>
	</div>
	<div class="public_lock_content">
		<div class="list2 left">
       <p><{$data.haar2}></p>
		</div>
	</div>
	<div class="public_bzhh_title J_payPopupShow">
		<span class="left"></span><span class="right"></span><span class="center">第六：从婚姻宫角度论配婚吉凶（合婚指数）</span><i></i>
	</div>
	<div class="public_lock_content">
		<div class="list2 left">
     <p><{$data.haar3}></p>
		</div>
	</div>
	<div class="public_bzhh_title J_payPopupShow">
		<span class="left"></span><span class="right"></span><span class="center">第七：从子女宫角度论配婚吉凶（合婚指数）</span><i></i>
	</div>
	<div class="public_lock_content">
		<div class="list2 left">
		<p><{$data.haar4}></p>
		</div>
	</div>
	<div class="public_bzhh_title J_payPopupShow">
		<span class="left"></span><span class="right"></span><span class="center">第八：双方子女信息</span><i></i>
	</div>
	<div class="public_lock_content">
		<div class="list2 left">
		<p>命宫为：<{$data.m_v}></p>
		<p>头胎为：<{$data.erzi_a}></p>
		</div>
	</div>
	<div class="public_bzhh_title J_payPopupShow">
		<span class="left"></span><span class="right"></span><span class="center">第九：名师综合点评</span><i></i>
	</div>
	<div class="public_lock_content">
		<div class="list2 left">
			<p>二位命卦九宫落在宫位：'<{$data.m_n}>'，此为上等婚 ，(甲方命卦：<{$data.m_n}>（<{$data.m_na}>四命） 乙方命卦：<{$data.m_v}>（<{$data.m_va}>四命）)</p>
            <p style="color:#F00;">只要是上等婚，则对其它方面的事情，可以不再理睬，比如：属相相犯、命里相犯均可不予考虑。</p>
            <p>(男方属相：<{$data.shengxiao1}> 女方属相：<{$data.shengxiao2}>)双方生肖合婚方面属于中等婚配。</p>
		</div>
		<div class="right J_payPopupShow">
		</div>
	</div>
	<div class="public_bzhh_title J_payPopupShow">
		<span class="left"></span><span class="right"></span><span class="center">第十：（婚后生活）子女同步</span><i></i>
	</div>
	<div class="public_lock_content">
		<div class="list2 left">
			<p>双方命局子女信息，属于<{if $data.erzi!=$data.erzi_a}>不<{/if}>同步，<{if $data.erzi==$data.erzi_a}>儿孙满堂晚年享受儿孙之福。<{else}>可通过后天的一些措施来补救。如工作行业、方位、颜色、饮食、兴趣、日常用品,平时生活需要注意多忍让对方等。<{/if}></p>
			<p><b style="color:#00b98d;">婚姻格言：</b></p>
			<p>婚姻就是把爱情落实到生活里，睁开一只眼看清楚对方的优点，闭上一只眼无视对方的缺点。在婚姻中学着做个合适的人，而不是去找个合适的人。</p>
			<p>夫妻相处之道是重视及感谢对方所做的一切，不要凡事视为当然。</p>
			<p>能有智慧'建立一个温馨美满家庭'的人，才算是一个真正成功的人。</p>
			<p>没有100分的另一半，只有50分的两个人。</p>
		</div>
	</div>
</div>

<div class="ainuo_foot_nav cl" id="testFixedBtn">
    <ul>
     <li><a href="/"><i class="shouye_1"></i><p>测试首页</p></a></li>
     <li><a href="/?ac=history"><i class="wddd_1"></i><p>订单查询</p></a></li>
     <li><a href="/"class="botpost"><em><i class="lijics_1"></i></em><p>继续测试</p></a></li>
     <li><a href="/"><i class="gengduo_1"></i><p>更多测试</p></a></li>
     <li><a href="/?ac=member"><i class="grzx_1"></i><p>个人中心</p></a></li>
    </ul>
</div>
<style type="text/css">
.ainuo_foot_nav{display: block; padding: 2px 0; background:#f31b34; position: fixed; bottom: 0; width: 100%; z-index: 99999;max-width: 640px;}
.ainuo_foot_nav li{width: 20%; text-align: center; float: left;}
.ainuo_foot_nav li a{width: 100%; display: block;}
.ainuo_foot_nav .foothover i{color: #f13030;}
.ainuo_foot_nav li i{display: block; line-height: 25px; height: 25px; margin: auto; padding: 0; width: 25px; overflow: hidden; background-size: 100%;}
.ainuo_foot_nav li a.botpost{position: relative; margin-top: -11px; background-color: rgba(0,0,0,0.0);}
.ainuo_foot_nav li a.botpost em{background: #ffffff; padding: 2px; border: 1px solid #ff5e5e; display: block; border-radius: 50%; width: 30px; height: 30px; margin: 0 auto; margin-bottom: 2px;padding-bottom: 0px;}
.ainuo_foot_nav li p{overflow: hidden; font-size: 12px; height: 16px; line-height: 16px; color: #fff; font-weight: 400;}
.shouye_1{background: url(/statics/ffsm/public/images/shouye.png) no-repeat;}
.wddd_1{background: url(/statics/ffsm/public/images/dingdan.png) no-repeat;}
.lijics_1{background: url(/statics/ffsm/public/images/suan.png) no-repeat;}
.gengduo_1{background: url(/statics/ffsm/public/images/gengduo.png) no-repeat;}
.grzx_1{background: url(/statics/ffsm/public/images/grzx.png) no-repeat;}
</style>
<{include file='./ffsm/footer.tpl'}>
<{include file='./ffsm/dl_ck.tpl'}>
</div>
</body>
</html>