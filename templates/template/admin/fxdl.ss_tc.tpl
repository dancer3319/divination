<{include file='admin/header.tpl'}>
<link href="/static/js/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="/static/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/clipboard.min.js"></script>
<style type="text/css">
.text-hint.normal{color:#F00;}

</style>

<div style="width:96%;margin:auto;padding:auto;" class="page-content clearfix">
    <div class="clearfix administrator_style" id="administrator">
                <div class="table_menu_list" id="testIframe" style="width: 100%; height: 551px;">
                    <!--<table class="table table-striped table-bordered table-hover" id="sample_table">-->
					<table id="sample-table-1" class="table table-striped table-bordered table-hover" style="margin-top: 20px;">
                        <thead>
                        <tr>
                            <th>实时套餐</th>
                            <th>剩余次数</th>
                            <th>成交订单数</th>
                            <th>访问次数</th>
                            <th>vip</th>
                            <th>vip到期时间</th>
                        </tr>
                        </thead>
                        <tbody id="goodsTb">
                        
                        <tr>
							<td><{$message.ins}></td>
							<td><{$message.package}></td>
							<td><{$message.access}></td>
							<td><{$message.access_num}></td>
							<td><{$message.vip_type}></td>
							<td><{$message.vip_time}></td>
						</tr>
            
						</tbody>
                    </table>
					
					
                    <table id="sample-table-1" class="table table-striped table-bordered table-hover" style="margin-top: 20px;">
                        <thead>
                        <tr>
                            <th>排序</th>
                            <th>订单ID</th>
                            <th>商品名称</th>
                            <th>商品价格</th>
                            <th>成交时间</th>
                        </tr>
                        </thead>
                        <tbody id="goodsTb">
                      
            <{foreach from="$order" item=v key=k}>
            <tr>
                <td><{$k}></td>
                <td><{$v.orderid}></td>
                <td><{$v.type}></td>
				<td><{$v.amount}></td>
                <td><{$v.time|date_format:'%Y-%m-%d %H:%M:%S'}></td>
            </tr>
            <{/foreach}>
            </tbody>
                    </table>
                    
                 </div>
                </div>
    </div>
</body>
</html>
