<{include file='admin/header.tpl'}>
<style type="text/css">
body {
    padding-bottom: 0;
    background-color: #ffffff;
    min-height: 100%;
    font-family: "Microsoft YaHei", Arial, Helvetica, sans-serif;
    font-size: 13px;
    color: #393939;
    line-height: 1.5;
}
.nav-tabs {
    border-color: #c5d0dc;
    margin-bottom: 0;
    margin-left: 0;
    position: relative;
    top: 1px;
}
.nav-tabs {
    border-bottom: 1px solid #ddd;
}
.nav-tabs>li {
    float: left;
    margin-bottom: -1px;
}
.nav>li {
    position: relative;
    display: block;
}
.nav-tabs>li.active>a, .nav-tabs>li.active>a:hover, .nav-tabs>li.active>a:focus {
    color: #576373;
    border-color: #c5d0dc;
    border-top: 2px solid #4c8fbd;
    border-bottom-color: transparent;
    background-color: #FFF;
    z-index: 12;
    line-height: 16px;
    margin-top: -1px;
}

</style>

<link href="/static/js/bootstrap.min.css" rel="stylesheet" type="text/css" />

<script src="/static/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/clipboard.min.js"></script>
<dl class="search-class" style="border-bottom:1px solid #eee">
    <h3 class='bh'>
        你好：<font color='red'><{$users.user_name}></font>欢迎登录<font color='red'><{frame_union do='groups' var=$users.groups}></font>后台
    </h3>
</dl>
<div class="margin clearfix" style="margin:0px 10px;">
<{if $userinfo.uid==1}>
 <div class="amounts_style">
     <div>
         <ul class="nav nav-tabs">
             <li class="active"><a id="day_a">全部数据统计</a></li>
            <span id="rank_agent_name"></span>
         </ul>
     </div>
     <div class="row" id="order-summary-stats-panel">
         <div class="col-md-3">
             <div class="well" id="today_total">
                 <b style="font-size: 1.5em;">今日成交金额</b>
                <div class="text-primary" style="font-size:32px;margin:5px 0">
                    ¥<span data-bind="price: stats_today.paid_amount" id="today_totle_money"><{$row_Todays.s_money}></span>
                </div>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6" style="padding:0">
                            <div>已支付: <span data-bind="text: stats_today.welth_order_paid_count" id="ytd_compelte"><{$row_Todays.s_count}></span> 笔</div>
                            <div>未支付: <span data-bind="text: stats_today.welth_order_unpaid_count" id="ytd_no_compelte"><{$row_Todays.f_count}></span> 笔</div>
                        </div>
						<div class="col-sm-6" style="padding:0">
                            <div style="color: #ff0000;"><b data-bind="">成交率:</b><span style="margin-left: 5px;" id="ytd_rote_money"><{$row_Todays.wcl}></span>
                            </div>
                        </div>
                        
                    </div>
                    <div style="margin-top:20px;" id="today_qrcode_div"></div>
                </div>
             </div>
         </div>

         <div class="col-md-3">
             <div class="well" id="yesterday_total">
                 <b style="font-size: 1.5em;">昨日成交金额</b>
                <div class="text-primary" style="font-size:32px;margin:5px 0">
                    ¥<span data-bind="price: stats_today.paid_amount" id="ytd_totle_money"><{$row_Yesterdays.s_money}></span>
                </div>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6" style="padding:0">
                            <div>已支付: <span data-bind="text: stats_today.welth_order_paid_count" id="ytd_compelte"><{$row_Yesterdays.s_count}></span> 笔</div>
                            <div>未支付: <span data-bind="text: stats_today.welth_order_unpaid_count" id="ytd_no_compelte"><{$row_Yesterdays.f_count}></span> 笔</div>
                        </div>
                        <div class="col-sm-6" style="padding:0">
                            <div style="color: #ff0000;"><b data-bind="">成交率:</b><span style="margin-left: 5px;" id="ytd_rote_money"><{$row_Yesterdays.wcl}></span>
                            </div>
                        </div>
                    </div>
                    <div style="margin-top:20px;" id="yesterday_qrcode_div"></div>
                </div>
             </div>
         </div>

         <div class="col-md-3">
             <div class="well" id="month_total">
                 <b style="font-size: 1.5em;">本月成交金额</b>
                <div class="text-primary" style="font-size:32px;margin:5px 0">
                    ¥<span data-bind="price: stats_today.paid_amount" id="month_totle_money"><{$row_Thismonths.s_money}></span>
                </div>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6" style="padding:0">
                            <div>已支付: <span data-bind="text: stats_today.welth_order_paid_count" id="month_compelte"><{$row_Thismonths.s_count}></span> 笔</div>
                            <div>未支付: <span data-bind="text: stats_today.welth_order_unpaid_count" id="month_no_compelte"><{$row_Thismonths.f_count}></span> 笔</div>
                        </div>
                        <div class="col-sm-6" style="padding:0">
                            <div style="color: #ff0000;"><b data-bind="">成交率:</b><span style="margin-left: 5px;" id="month_rote_money"><{$row_Thismonths.wcl}></span>
                            </div>
                        </div>
                    </div>
                    <div style="margin-top:20px;" id="month_qrcode_div"></div>
                </div>
             </div>
         </div>

         <div class="col-md-3">
             <div class="well" id="history_total">
                 <b style="font-size: 1.5em;">历史累计成交金额</b>
                <div class="text-primary" style="font-size:32px;margin:5px 0">
                    ¥<span data-bind="price: stats_today.paid_amount" id="hist_totle_money"><{$row_alls.s_money}></span>
                </div>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6" style="padding:0">
                            <div>已支付: <span data-bind="text: stats_today.welth_order_paid_count" id="hist_compelte"><{$row_alls.s_count}></span> 笔</div>
                            <div>未支付: <span data-bind="text: stats_today.welth_order_unpaid_count" id="hist_no_compelte"><{$row_alls.f_count}></span> 笔</div>
                        </div>
                        <div class="col-sm-6" style="padding:0">
                            <div style="color: #ff0000;"><b data-bind="">成交率:</b><span style="margin-left: 5px;" id="hist_rote_money"><{$row_alls.wcl}></span>
                            </div>
                        </div>
                    </div>
                    <div style="margin-top:20px;" id="history_qrcode_div"></div>
                </div>
             </div>
         </div>

     </div>
    </div>
	<{/if}>
 <div class="amounts_style">
     <div>
         <ul class="nav nav-tabs">
             <li class="active"><a id="day_a">每日数据统计</a></li>
            <span id="rank_agent_name"></span>
         </ul>
     </div>
     <div class="row" id="order-summary-stats-panel">
         <div class="col-md-3">
             <div class="well" id="today_total">
                 <b style="font-size: 1.5em;">今日成交金额</b>
                <div class="text-primary" style="font-size:32px;margin:5px 0">
                    ¥<span data-bind="price: stats_today.paid_amount" id="today_totle_money"><{$data.total_today.total}></span>
                </div>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6" style="padding:0">
                            <!--<div style="margin-bottom: 10px;"><strong data-bind="PV: pv_value">PV:</strong><span style="margin-left: 5px;" id="today_pv">2</span></div>
                            <div style="margin-bottom: 5px;"><b data-bind="order: stats_today.welth_order_paid_amount">已支付订单量:</b><span style="margin-left: 5px;" id="today_count">0</span></div>-->
                            <div>已支付: <span data-bind="text: stats_today.welth_order_paid_count" id="today_compelte"><{$data.total_today.numpay}></span> 笔</div>
                            <div>未支付: <span data-bind="text: stats_today.welth_order_unpaid_count" id="today_no_compelte"><{$data.total_today.numall}></span> 笔</div>
                            <div>
                            完成率: <span data-bind="text: Math.round(stats_today.welth_order_completion_rate() * 100)" id="today_percent"><{$data.total_today.bili}></span>
                            </div>
                        </div>
                        <div class="col-sm-6" style="padding:0">
                            <!--<div style="margin-bottom: 10px;"><strong data-bind="UV: uv_value">UV:</strong><span style="margin-left: 5px;" id="today_UV">1</span></div>-->
                            <div style="margin-bottom: 8px;"><b data-bind=""><!-- 总佣金: --></b><span style="margin-left: 5px;" id="today_rote_moneyss"></span></div>
                            <div style="margin-bottom: 8px;"><b data-bind=""><!-- 总手续费: --></b><span style="margin-left: 5px;" id="today_poundagess"></span></div>
                            <div style="color: #ff0000;"><b data-bind="">总佣金:</b><span style="margin-left: 5px;" id="today_rote_money"><{$data.total_today.lirun}></span>
                            </div>
                        </div>
                    </div>
                    <div style="margin-top:20px;" id="today_qrcode_div"></div>
                </div>
             </div>
         </div>

         <div class="col-md-3">
             <div class="well" id="yesterday_total">
                 <b style="font-size: 1.5em;">昨日成交金额</b>
                <div class="text-primary" style="font-size:32px;margin:5px 0">
                    ¥<span data-bind="price: stats_today.paid_amount" id="ytd_totle_money"><{$data.total_yesterday.total}></span>
                </div>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6" style="padding:0">
                            <!--<div style="margin-bottom: 10px;"><strong data-bind="PV: pv_value">PV:</strong><span style="margin-left: 5px;" id="ytd_pv">2</span></div>
                            <div style="margin-bottom: 5px;"><b data-bind="order: stats_today.welth_order_paid_amount">已支付订单量:</b><span style="margin-left: 5px;" id="ytd_count">0</span></div>-->
                            <div>已支付: <span data-bind="text: stats_today.welth_order_paid_count" id="ytd_compelte"><{$data.total_yesterday.numpay}></span> 笔</div>
                            <div>未支付: <span data-bind="text: stats_today.welth_order_unpaid_count" id="ytd_no_compelte"><{$data.total_yesterday.numall}></span> 笔</div>
                            <div>
                            完成率: <span data-bind="text: Math.round(stats_today.welth_order_completion_rate() * 100)" id="ytd_percent"><{$data.total_yesterday.bili}></span> 
                            </div>
                        </div>
                        <div class="col-sm-6" style="padding:0">
                            <!--<div style="margin-bottom: 10px;"><strong data-bind="UV: uv_value">UV:</strong><span style="margin-left: 5px;" id="ytd_UV">1</span></div>-->
                            <div style="margin-bottom: 8px;"><b data-bind=""><!-- 总佣金: --></b><span style="margin-left: 5px;" id="ytd_rote_moneyss"></span></div>
                            <div style="margin-bottom: 8px;"><b data-bind=""><!-- 总手续费: --></b><span style="margin-left: 5px;" id="ytd_poundagess"></span></div>
                            <div style="color: #ff0000;"><b data-bind="">总佣金:</b><span style="margin-left: 5px;" id="ytd_rote_money"><{$data.total_yesterday.lirun}></span>
                            </div>
                        </div>
                    </div>
                    <div style="margin-top:20px;" id="yesterday_qrcode_div"></div>
                </div>
             </div>
         </div>

         <div class="col-md-3">
             <div class="well" id="month_total">
                 <b style="font-size: 1.5em;">本月成交金额</b>
                <div class="text-primary" style="font-size:32px;margin:5px 0">
                    ¥<span data-bind="price: stats_today.paid_amount" id="month_totle_money"><{$data.total_smonth.total}></span>
                </div>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6" style="padding:0">
                            <!--<div style="margin-bottom: 10px;"><strong data-bind="PV: pv_value">PV:</strong><span style="margin-left: 5px;" id="month_pv">4</span></div>
                            <div style="margin-bottom: 5px;"><b data-bind="order: stats_today.welth_order_paid_amount">已支付订单量:</b><span style="margin-left: 5px;" id="month_count"><{$data.total_smonth.total}></span></div>-->
                            <div>已支付: <span data-bind="text: stats_today.welth_order_paid_count" id="month_compelte"><{$data.total_smonth.numpay}></span> 笔</div>
                            <div>未支付: <span data-bind="text: stats_today.welth_order_unpaid_count" id="month_no_compelte"><{$data.total_smonth.numall}></span> 笔</div>
                            <div>
                            完成率: <span data-bind="text: Math.round(stats_today.welth_order_completion_rate() * 100)" id="month_percent"><{$data.total_smonth.bili}></span> 
                            </div>
                        </div>
                        <div class="col-sm-6" style="padding:0">
                            <!--<div style="margin-bottom: 10px;"><strong data-bind="UV: uv_value">UV:</strong><span style="margin-left: 5px;" id="month_UV">2</span></div>-->
                            <div style="margin-bottom: 8px;"><b data-bind=""><!-- 总佣金: --></b><span style="margin-left: 5px;" id="month_rote_moneyss"></span></div>
                            <div style="margin-bottom: 8px;"><b data-bind=""><!-- 总手续费: --></b><span style="margin-left: 5px;" id="month_poundagess"></span></div>
                            <div style="color: #ff0000;"><b data-bind="">总佣金:</b><span style="margin-left: 5px;" id="month_rote_money"><{$data.total_smonth.lirun}></span>
                            </div>
                        </div>
                    </div>
                    <div style="margin-top:20px;" id="month_qrcode_div"></div>
                </div>
             </div>
         </div>

         <div class="col-md-3">
             <div class="well" id="history_total">
                 <b style="font-size: 1.5em;">历史累计成交金额</b>
                <div class="text-primary" style="font-size:32px;margin:5px 0">
                    ¥<span data-bind="price: stats_today.paid_amount" id="hist_totle_money"><{$data.total.total}></span>
                </div>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6" style="padding:0">
                            <!--<div style="margin-bottom: 10px;"><strong data-bind="PV: pv_value">PV:</strong><span style="margin-left: 5px;" id="hist_pv">4</span></div>
                            <div style="margin-bottom: 5px;"><b data-bind="order: stats_today.welth_order_paid_amount">已支付订单量:</b><span style="margin-left: 5px;" id="hist_count"><{$data.numpay}></span></div>-->
                            <div>已支付: <span data-bind="text: stats_today.welth_order_paid_count" id="hist_compelte"><{$data.total.numpay}></span> 笔</div>
                            <div>未支付: <span data-bind="text: stats_today.welth_order_unpaid_count" id="hist_no_compelte"><{$data.total.numall}></span> 笔</div>
                            <div>
                            完成率: <span data-bind="text: Math.round(stats_today.welth_order_completion_rate() * 100)" id="hist_percent"><{$data.total.bili}></span> 
                            </div>
                        </div>
                        <div class="col-sm-6" style="padding:0">
                            <!--<div style="margin-bottom: 10px;"><strong data-bind="UV: uv_value">UV:</strong><span style="margin-left: 5px;" id="hist_UV">2</span></div>-->
                            <div style="margin-bottom: 8px;"><b data-bind=""><!-- 总佣金: --></b><span style="margin-left: 5px;" id="hist_rote_moneyss"></span></div>
                            <div style="margin-bottom: 8px;"><b data-bind=""><!-- 总手续费: --></b><span style="margin-left: 5px;" id="hist_poundagess"></span></div>
                            <div style="color: #ff0000;"><b data-bind="">总佣金:</b><span style="margin-left: 5px;" id="hist_rote_money"><{$data.total.lirun}></span>
                            </div>
                        </div>
                    </div>
                    <div style="margin-top:20px;" id="history_qrcode_div"></div>
                </div>
             </div>
         </div>

     </div>
    </div>   
<div style="line-height:28px; text-align:center;">
<h2><span style="color:#E53333;">分销代理推广链接说明</span> </h2>
<p>复制你的专属推广链接，只要用户下单你即可获取提成。</p>
<p><strong>关于提现：</strong>请到提现管理栏目，申请提现，提现方式为微信或者支付宝，任何时间内申请提现最迟24小时内到账。</p>
<p><strong>分成比例：</strong>请咨询一级管理员或者联系开发者QQ285507230，分销提成比例一级管理员可在后台设置，可设置一二级代理提成比例。</p>
<p>如果你有任何疑问，请联系QQ：285507230获取解答，谢谢支持！</p>

<!--
<h2><span style="color:#E53333;">我的推广二维码</span> </h2>

<td><img src="https://api.nbhao.org/v1/qrcode/make?text=http://yshi2.shengqianmiji.cn/?dl=<{$users.uid}>" width="150" height="150" style="border: 1px solid rgba(0, 0, 0, .2); padding:4px; margin-top:5px;display: block;margin: 0 auto;"></td>

-->

</div>

 </div>
</div>
<script type="text/javascript" src="#http://www.ohbbs.cn/"></script>
</body>
</html>