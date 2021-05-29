<{include file="admin/header.tpl"}>
<script lang='javascript'>
function show_data(nid)
{
	tb_show('浏览/编辑用户', '?ct=users&ac=index&even=edit&tb=users&uid='+ nid +'&TB_iframe=true&height=350&width=500', true);
}
function do_delete()
{
	document.form1.even.value = 'delete';
	var msg = "你确定要删除选中的用户？！";
	msg += "<br/><a href='javascript:tb_remove();'>&lt;&lt;点错了</a> &nbsp;|&nbsp; <a href='javascript:document.form1.submit();'>确定要删除&gt;&gt;</a>";
	tb_showmsg(msg);
}
function do_delete_one(uid)
{
	var msg = "你确定要删除选中的用户？！";
	msg += "<br/><a href='javascript:tb_remove();'>&lt;&lt;点错了</a> &nbsp;|&nbsp; <a href='?ct=users&ac=index&even=delete&tb=users&uid[]="+ uid +"&TB_iframe=true&height=400&width=500'>确定要删除&gt;&gt;</a>";
	tb_showmsg(msg);
}
</script>

<div id="contents">
  <div style="background-color:#DAFBCA;padding:5px 10px;line-height:32px;">
        <form method="post" action="/acs/?ct=users&ac=index">
          <label>用户ID：</label>
           <input type="text" id="search_uid" name="uid_s" value="<{$sch_uid}>" class="text m">
          &nbsp;&nbsp;&nbsp;
          <label>上级用户ID：</label>
           <input type="text" id="search_uid" name="sd_uid" value="<{$sd_uid}>" class="text m">
          &nbsp;&nbsp;&nbsp;
          <label>用户账号：</label>
           <input type="text" id="search_user_name" name="sch_user_name" value="<{$sch_user_name}>" class="text m">
          &nbsp;&nbsp;&nbsp;
          <label>用户电话：</label>
           <input type="text" id="search_phone" name="sch_phone" value="<{$sch_phone}>" class="text m">
            <button type="submit">搜索</button><span style="margin-left:25px;">

        </form>
    </div>
		<table class="table-sort table-operate">
			<tr>
				<th> <input name="checkbox" type="checkbox" value="" rel="parent" /> </th>
				<th> 用户ID </th>
				<th> 上级ID </th>
				<th> 用户账号 </th>
				<th> 用户昵称 </th>
				<th> 用户等级 </th>
				<th> 积分 </th>
              <th> 独立提成</th>
              	<th> 未提佣金 </th>
              	<th> 全部佣金 </th>
              	<th> 电话</th>
              	<th> QQ </th>
				<!--<th> 类型 </th>-->
				<th> 权限组 </th>
				<th> 注册时间 </th>
				<th> 操作 </th>
			</tr>
			<{lurd_list item='v'}>
			<tr>
				<td> 
				    <input type="checkbox" class="checkbox" name="uid[]" value="<{$v.uid}>" rel="child" />
				</td>
				<td> <{$v.uid}> </td>
				<td> <{$v.sd_uid}> </td>
				<td> <{$v.user_name|truncate:8}> </td>
				<td> 
				    <a href="javascript:show_data('<{$v.uid}>');">
				        <img src='images/images/icons/auditing.gif' alt='查看/修改' title='查看/修改' border='0' /> <{$v.nickname}>
				    </a>
			    </td>
			    <td> <{if $v.vip_type==38}>包月VIP 到期时间：<{$v.vip_time|date_format:'%Y-%m-%d'}><{elseif $v.vip_type==39}>包年VIP 到期时间：<{$v.vip_time|date_format:'%Y-%m-%d'}><{elseif $v.vip_type==40}>终身VIP<{else}>普通用户<{/if}></td>
				<td> <{$v.integral}></td>
                <td> <{$v.dl_tcbl}>%</td>
                <td> <{$v.dl_syjf|round:2}> </td>
                <td> <{$v.dl_zjf|round:2}> </td>
                <td> <{$v.phone}> </td>
                <td> <{$v.qq}> </td>
				<!--<td> <{frame_union do='pools' var=$v.pools}> </td>-->
				<td> <{frame_union do='groups' var=$v.groups}> </td>
				<td> <{lurd do="format_date" var=$v.regtime format="" }> </td>
				<td><a href="javascript:show_data('<{$v.uid}>');">修改</a>&nbsp;|&nbsp;<a href="javascript:do_delete_one('<{$v.uid}>');">删除</a></td>
			</tr>
			<{/lurd_list}>
		</table>
</div>

<div id="bottom">
	<form name="form1" action="?ct=users" method="POST">
	<div class="fl">
	<button type="button" onclick="tb_show('增加管理员', '?ct=users&ac=index&even=add&tb=users&TB_iframe=true&height=300&width=500', true);">增加管理员</button>
	</div>
	</form>
	<div class="pages">
		<div class="ylmf-page">
			<{$lurd_pagination}>
		</div>
	</div>
</div>

</body>
</html>
