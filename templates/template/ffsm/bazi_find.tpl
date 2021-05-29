<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8"/>
	<title>八字精批测试结果-<{$zhanming}></title>
	<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<meta content="yes" name="apple-mobile-web-app-capable"/>
	<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
	<meta content="telephone=no" name="format-detection"/>
	<link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
	<link href="/statics/ffsm/bazi/page1.css" rel="stylesheet" type="text/css"/>
	<{include file='./ffsm/wx_share.tpl'}>
	<script src="https://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
<header class="public_header">
	<h1 class="public_h_con">八字精批结果</h1>
	<a class="public_h_home" href="/"></a><a href="/?ac=history" class="public_h_menu">我的测试</a></header>
<div class="public_banner">
	<img style="width: 100%;" src="/statics/ffsm/public/images/banner_wd.png" alt="八字精批"/>
</div>
<audio src="" id="myAudio"></audio>
<section class="page3-bg-1">
  <div class="material-box">
    <div class="material-img1"></div>
    <div class="material-img2"></div>
    <div class="top clearfix">
      <em class="left center-text">您输入的个人资料</em>
    </div>
    <div class="center clearfix">
      <div class="infor clearfix">
        <div class="infor1 left">
          <span class="key-text">性别:</span>
          <span class="value-text"><{if $data.data.gender==1}>男<{else}>女<{/if}></span></div>
        <div class="infor2 left">
          <span class="key-text">生肖:</span>
          <span class="value-text"><{$return.user.sx}></span></div>
      </div>
      <div class="infor-data clearfix">
        <span class="key-text left">生辰:</span>
        <div class="value-text left">
          <p><{$data.data.y}>年<{$data.data.m}>月<{$data.data.d}>日 <{$data.data.h}>时</p>
          <p><{$data.data.lDate}></p>
        </div>
      </div>
      <div class="infor-table">
        <p class="key-text">您的五行八字资料</p>
        <table>
          <tbody>
            <tr>
              <th>八字</th>
              <th>年柱</th>
              <th>月柱</th>
              <th>日柱</th>
              <th>时柱</th></tr>
            <tr>
              <td>天干</td>
              <td><{$return.user.bazi.0}></td>
              <td><{$return.user.bazi.2}></td>
              <td><{$return.user.bazi.4}></td>
              <td><{$return.user.bazi.6}></td></tr>
            <tr>
              <td>地支</td>
              <td><{$return.user.bazi.1}></td>
              <td><{$return.user.bazi.3}></td>
              <td><{$return.user.bazi.5}></td>
              <td><{$return.user.bazi.7}></td></tr>
          </tbody>
        </table>
      </div>
      <div class="solution-box clearfix">
        <div class="sol-left">
          <p>本命属<{$cookies.sx}>，<{$nayin.0.layin}>命。<{$wang.wang}><{$wang.que}>；日主天干为<{$nayin.0.layin}><{$wang.wang}><{$wang.que}><{$cookies.bazi.4}>，生于<{$cookies.siji}>季。</p>
          <p><span>喜用神:</span>  <{$return.data.xiyongshen.data.xishen}></p>
        </div>
        <!--<div class="sol-right">-->
        <!--<img src="//statics/ffsm/bazimf/images/pic8.png" alt="">-->
        <!--</div>--></div>
    </div>
  </div>
  <div class="content-box page3-content">
    <div class="title clearfix" style="display: flex">
      <img style="text-align: center;margin: 2% auto;" src="/statics/ffsm/bazimf/images/pic-text4.png" alt=""></div>
    <div class="list-box list1">
      <h2 class="clearfix">
        <span class="icon icon1"></span>
        <em>八字排盘</em></h2>
      <div class="list-text">
        <span class="red">提示:</span>
        <span>八字命盘从阴阳干支三合历取得。上排是天干，由五行「金水木火土」轮流排列。下排是地支，用十二生肖顺序排列。十二生肖可转换成五行。</span></div>
      <table>
        <tbody>
          <tr>
            <th>八字</th>
            <th>年柱</th>
            <th>月柱</th>
            <th>日柱</th>
            <th>时柱</th></tr>
          <tr>
            <!--1=天干 2地支 3本气 4余气 5杂气-->
            <th>天干</th>
            <td><{$return.user.bazi.0}>/<{$pp.shishen3}></td>
            <td><{$return.user.bazi.2}>/<{$pp.shishen1}></td>
            <td><{$return.user.bazi.4}>/<{$pp.shishen4}></td>
            <td><{$return.user.bazi.6}>/<{$pp.shishen2}></td></tr>
          <tr>
            <th>地支</th>
            <td><{$return.user.bazi.1}>/<{$pp.shishen1}></td>
            <td><{$return.user.bazi.3}>/<{$pp.shishen2}></td>
            <td><{$return.user.bazi.5}>/<{$pp.shishen3}></td>
            <td><{$return.user.bazi.7}>/<{$pp.shishen4}></td></tr>
          <tr>
            <th>藏干</th>
            <td><{$pp.zanggan1}></td>
            <td><{$pp.zanggan2}></td>
            <td><{$pp.zanggan3}></td>
            <td><{$pp.zanggan4}></td></tr>
          <tr>
            <th>空亡</th>
            <td><{$pp.ykw}></td>
            <td><{$pp.mkw}></td>
            <td><{$pp.rkw}></td>
            <td><{$pp.hkw}></td></tr>
         <tr>
           <th>十二长生</th>
           <td><{$pp.srchangsheng.0}></td>
           <td><{$pp.srchangsheng.1}></td>
           <td><{$pp.srchangsheng.2}></td>
           <td><{$pp.srchangsheng.3}></td></tr>
         <tr>
           <th>神煞</th>
           <td><{$pp.shenshas_y.0}></br>
              <{$pp.shenshas_y.1}></br>
              <{$pp.shenshas_y.2}></br>
              <{$pp.shenshas_y.3}></br></td>
            <td>
              <{$pp.shenshas_m.0}></br>
              <{$pp.shenshas_m.1}></br>
              <{$pp.shenshas_m.2}></br>
              <{$pp.shenshas_m.3}></br></td>
           <td>
            <{$pp.shenshas_d.0}></br>
            <{$pp.shenshas_d.1}></br>
            <{$pp.shenshas_d.2}></br>
            <{$pp.shenshas_d.3}></br></td>
           <td>
            <{$pp.shenshas_h.0}></br>
            <{$pp.shenshas_h.1}></br>
            <{$pp.shenshas_h.2}></br>
            <{$pp.shenshas_h.3}></br></td>
            </tr>
            <th>命宫</th>
            <td colspan="4"><{$pp.minggong}></td></tr>
          <tr>
            <th>胎元</th>
            <td colspan="4"><{$pp.taiyuan}></td></tr>
          <tr>
            <th>胎息</th>
            <td colspan="4"><{$return.user.bazi.6}><{$return.user.bazi.7}></td></tr>
          <tr>
            <th>日空</th>
            <td colspan="4"><{$pp.xkrgz}></td></tr>
        </tbody>
      </table>
    </div>
    <!--<div class="list-box list2">
      <h2 class="clearfix">
        <span class="icon icon2"></span>
        <em>吉神凶煞</em></h2>
      <table>
        <tbody>
          <tr>
            <th>四柱</th>
            <th>神煞</th></tr>
          <tr>
            <th>年柱</th>
            <td>月德 天乙贵人</td></tr>
          <tr>
            <th>月柱</th>
            <td>病符 亡神 反朝桃花 四大空亡 天福贵 福星贵 截路空亡 大败</td></tr>
          <tr>
            <th>日柱</th>
            <td>福德 天喜 桃花 绞煞 天德 流霞 阴阳差错 交神</td></tr>
          <tr>
            <th>时柱</th>
            <td>岁破 灾煞 天哭</td></tr>
        </tbody>
      </table>
    </div>-->
    <div class="list-box list3">
      <h2 class="clearfix">
        <span class="icon icon3"></span>
        <em>五行综述</em></h2>
      <table>
        <tbody>
          <tr>
            <th>八字</th>
            <th><{$return.user.bazi.0}><{$return.user.bazi.1}></th>
            <th><{$return.user.bazi.2}><{$return.user.bazi.3}></th>
            <th><{$return.user.bazi.4}><{$return.user.bazi.5}></th>
            <th><{$return.user.bazi.6}><{$return.user.bazi.7}></th></tr>
			<tr>
            <th>五行</th>
            <td><{$cookies.wh.0}><{$cookies.wh.1}></td>
            <td><{$cookies.wh.2}><{$cookies.wh.3}></td>
            <td><{$cookies.wh.4}><{$cookies.wh.5}></td>
            <td><{$cookies.wh.6}><{$cookies.wh.7}></td>
                </tr>
        </tbody>
      </table>
    </div>
</div>
  <div class="content-box page3-content">
    <div class="title" style="display: flex">
      <img style="text-align: center;margin: 2% auto;" src="/statics/ffsm/bazimf/images/pic-text2.png" alt=""></div>
    <div class="content-warp1">
      <div class="warp1-text-box">
        <h3>●有利事业的方向以及概要:
          <span></span></h3>
        <div class="warp1-text">
		<p> <{$return.data.xiyongshen.shiye}></p>
		<p>与三合贵人共事或者得到三合贵人的帮助有利于你的事业的发展，有利于你的三合生肖，你的生肖<{$return.data.xiyongshen.sanhe.sanhe.0}>三合生肖<{$return.data.xiyongshen.sanhe.sanhe.1}>和生肖<{$return.data.xiyongshen.sanhe.sanhe.2}>。</p>
		</div>
      </div>
      <div class="warp1-text-box">
        <h3>●流年财运:
          <span></span></h3>
        <div class="warp1-text">
		<p><{if $return.data.zonghe.lncy}><{$return.data.zonghe.lncy}><{else}>你今年的财运浮沉反复，故此不宜大量投资及赌博，以免焦头烂额!幸而正财收入尚算稳定，故此若能量入为出，经济便不会出现赤字问题。此外，必须慎防受骗破财。今年的财运低沉的月份，是农历正月、五月、六月、九月及十二月，必须尽量减少不必要开支。财运较佳的月份，是农历一月、八月及十一月。<{/if}></p>
		</div>
      </div>
      <div class="warp1-text-box">
        <h3>●先天财运:
          <span></span></h3>
        <div class="warp1-text">
		<p><{if $return.data.zonghe.xtcy}><{$return.data.zonghe.xtcy}><{else}>本命财运，你的财运上从总体上来说是相当不错的。你拥有着让人艳羡的终生不用为钱烦恼的运气。然而由于做人积极且个性外向，是个天生的乐天派的马大哈性格，大都没有储蓄的习惯，手头充裕的时候，常不会做有效的运用，反而是挥霍无度。然而，他们打进了中年以后，却很有可能获得意外之财。如果在理财上如何趋利避害，关键便在于运用、开发好自己的大脑一般都会是大富大贵之人。<{/if}></p>
		</div>
      </div>
      <div class="warp1-text-box">
        <h3>●注意事项:
          <span></span></h3>
        <div class="warp1-text">
		<p><{if $return.data.zonghe.zhuyi}><{$return.data.zonghe.zhuyi}><{else}>建议主动帮长辈定期做身体检查，一则避免亲人有突发的重大疾病而意外破财，二则主动消费对财运有帮助。易有意料之外的小财运，但难以保存，最好购置保值物品或小投资的方式留财。外地走动财运更好，特别是外出业务合作、表演。<{/if}></p>
		</div>
      </div>
      <div class="warp1-text-box">
        <h3>●性格分析:
          <span></span></h3>
        <div class="warp1-text">
		<p>您出生于农历<{$return.user.lDate}>，五行生肖为:<{$return.user.sx}></p>
		<{$return.info.sxgx.sxgx}>
		</div>
      </div>
      <div class="warp1-text-box">
        <h3>●性格优缺点:
          <span></span></h3>
        <div class="warp1-text">
		  <p><font color="#ff4632">优点</font>:<{if $return.data.zonghe.yx}><{$return.data.zonghe.yx}><{else}>才智高且具优秀的头脑，行动活泼好动且伶俐。好竞争，手腕敏捷有侠义心情，反应快，能见机行事。社交手腕高明善解人意，很快与人打成一片，但不喜欢被人控制，喜爱追求新鲜事务。聪明、机智、创新有才华，能言善道，有极强的自我表现欲。非常适合演艺和推销工作猴年生的男性精力充沛身体健壮，常表现达观机智勇敢，对环境变化有很强的适应能力生性顽强不服输，拥有多项才能而能居主导地位。求知欲很强，记忆力超人，头脑灵活很有创造力。善于把握机会扩大发展，造成时势，成为大企业家。<{/if}></p>
          <p><font color="#ff4632">缺点</font>:<{if $return.data.zonghe.qd}><{$return.data.zonghe.qd}><{else}>平常爱说大话，有时有反对人之意见虚语或伪诈行为。忽略必需遵守社会全体规范，有点不脚踏实地。生性爱玩缺乏耐心毅力，眼光看得不远，犯有今朝有酒今朝醉的毛病。依赖心很重，好夸张和爱慕虚荣且喜新厌旧，不管做任何事都不会持续太久。狡滑伪善，无耐心不忠实狂妄自大，过份乐观，自负心强喜投机。为了达成目的喜爱说谎骗人，尽管才智出众八面玲珑，却不能以德服人，是典型的机会主义者。猴年生人无论说话做事一定要诚实踏实，否则会一塌糊涂。有自以为是急就章的毛病，所以常导致错误失败。<{/if}></p>
          </div>
      </div>
      <div class="warp1-text-box">
        <h3>●爱情分析:
          <span></span></h3>
        <div class="warp1-text">
		<p>您命中有:红艳桃花<{if $return.data.zonghe.th}><{$return.data.zonghe.th}><{else}>1<{/if}>朵</p>
          <p><{$rglm.aqfx}></p></div>
      </div>
      <div class="warp1-text-box">
        <h3>●事业分析:
          <span></span></h3>
        <div class="warp1-text">
		<p><{$rglm.syfx}></p>
		<p><{$tywh.hyhw}></p>
		</div>
      </div>
      <div class="warp1-text-box">
        <h3>●健康分析:
          <span></span></h3>
        <div class="warp1-text">
		<p><{$return.data.rgxx.jkfx}></p>
		<p>易患疾病:<{$return.info.wharr.whjk.jb}></p>
		<p>易发症状:<{$return.info.wharr.whjk.zz}></p>
		<p>从中医养生上来说，您基本上是<font color="#ff4632"><{$return.info.wharr.wang}></font>型人。</p>
		<p>养生要点:<{$return.info.wharr.whjk.yd}></p>
		<p>生活起居:<{$return.info.wharr.whjk.sh}></p>
		<p>饮食调养:<{$return.info.wharr.whjk.ys}></p>
		<p>保健膳食:<{$return.info.wharr.whjk.bj}></p></div>
      </div>
      <div class="warp1-text-box">
        <h3>●财运分析:
          <span></span></h3>
        <div class="warp1-text">
          <p><{$rglm.cyfx}></p>
        </div>
      </div>
      <div class="warp1-text-box">
        <h3>●三命通会:
          <span></span></h3>
        <div class="warp1-text">
          <p><{$sxth.tf1}></p>
          <p><{$sxth.tf2}></p>
        </div>
      </div>
      <div class="warp1-text-box">
        <h3>●未来一年:
          <span></span></h3>
        <div class="warp1-text">
          <p><{$myq_text}></p>
        </div>
      </div>
    </div>
  </div>
</section>


<div class="ainuo_foot_nav cl" id="testFixedBtn" style="height: 44px;">
    <ul>
     <li><a href="/"><i class="shouye_1"></i><p>测试首页</p></a></li>
     <li><a href="/?ac=history"><i class="wddd_1"></i><p>订单查询</p></a></li>
     <li><a href="/"class="botpost"><em><i class="lijics_1"></i></em><p>继续测试</p></a></li>
     <li><a href="/"><i class="gengduo_1"></i><p>更多测试</p></a></li>
     <li><a href="/?ac=member"><i class="grzx_1"></i><p>个人中心</p></a></li>
    </ul>
</div>
<style type="text/css">
.ainuo_foot_nav{display: block; padding: 2px 0; background:#ff2e0c; position: fixed; bottom: 0; width: 100%; z-index: 99999;max-width:640px;}
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
<{include file='./ffsm/footer.tpl'}>
<{include file='./ffsm/dl_ck.tpl'}>
</body>
</html>