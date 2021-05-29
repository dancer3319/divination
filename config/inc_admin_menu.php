<?php exit();//<item name='软件应用' url='?ct=version3&ac=application'/>
?>
<root>
<menu name='算命频道'>
	  <node name='系统基配置'>
	    <item name='系统基本配置' url='?ct=system&amp;ac=index' />
	    <item name='测算价格配置' url='?ct=system&amp;ac=index_m' />
	    <item name='在线预约配置' url='?ct=ffsm_dsyy&amp;ac=index' />
	    <item name='系统信息配置' url='?ct=system&amp;ac=index_a' />
	    <item name='代理分成配置' url='?ct=system&amp;ac=index_b' />
        <item name='推广积分配置' url='?ct=system&amp;ac=integral' />
		<item name='VIP 价格配置' url='?ct=system&amp;ac=index_d' />
      
		<item name='帐号管理' url='?ct=users&amp;ac=index' ct='users' ac='index' />
	  </node>
    <node name='付费应用'>
        <item name='订单管理' url='?ct=ffsm_order&ac=index' ct='ffsm_order' ac='index'/>
        <item name='订单导出' url='?ct=ffsm_order&ac=excel' ct='ffsm_order' ac='excel'/>
    </node>
  <node name='推广管理'>
  		<item name='我的信息' url='?ct=tj&amp;ac=index' default='1' ct='tj' ac='index'/>
  		<item name='推广链接' url='?ct=fxdl&amp;ac=links' ct='fxdl' ac='links'/>
        <item name='订单管理' url='?ct=fxdl&ac=index' ct='fxdl' ac='index'/>
        <item name='提现管理' url='?ct=fxdltxzh&ac=index' ct='fxdltxzh' ac='index'/>
   </node>
</menu>
<menu name='系统'> 
  <node name='帐号管理'>
    <item name='系统帐号管理' url='?ct=users&amp;ac=index' ct='users' ac='index' />
    <item name='组权限管理' url='?ct=users&amp;ac=edit_purview_groups' ct='users' ac='edit_purview_groups' />
    <item name='组权限XML配置' url='?ct=users&amp;ac=edit_purview_xml' ct='users' ac='edit_purview_xml' />
    <item name='我的信息' url='?ct=tj&amp;ac=index' default='1' ct='tj' ac='index'/>
    <item name='修改密码' url='?ct=users&amp;ac=editpwd' ct='users' ac='editpwd' />
  </node>
  <node name='系统其它'>
    <item name='操作日志' url='?ct=users&amp;ac=log' ct='users' ac='log' />
    <item name='登录日志' url='?ct=users&amp;ac=login_log' ct='users' ac='login_log' /> 
  </node>
    <node name='常规管理'>
        <item name='缓存管理' url='?ct=cache&ac=index'/>
    </node> 
</menu>
</root> 