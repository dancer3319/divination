<?php /* Smarty version 2.6.25, created on 2021-05-10 17:26:57
         compiled from ./ffsm/wx_share.tpl */ ?>
<script type="text/javascript" src="http://res2.wx.qq.com/open/js/jweixin-1.6.0.js"></script>
<script>
    wx.config({
        debug: false,
        appId: '<?php echo $this->_tpl_vars['signPackage']['appId']; ?>
',
        timestamp: '<?php echo $this->_tpl_vars['signPackage']['timestamp']; ?>
',
        nonceStr: '<?php echo $this->_tpl_vars['signPackage']['nonceStr']; ?>
',
        signature: '<?php echo $this->_tpl_vars['signPackage']['signature']; ?>
',
        jsApiList: [
           	'checkJsApi',
            'onMenuShareTimeline',
            'onMenuShareAppMessage',
            'onMenuShareQQ',
            'onMenuShareWeibo'
        ]
    });
  
    wx.ready(function () {   
      	wx.onMenuShareTimeline({
          title: '<?php echo $this->_tpl_vars['sh_title']; ?>
', // 分享标题
          link: '<?php echo $this->_tpl_vars['sh_url']; ?>
', // 分享链接
          imgUrl: '<?php echo $this->_tpl_vars['sh_img']; ?>
', // 分享图标
          success: function () {

          }
        });
        wx.onMenuShareAppMessage({
            title: '<?php echo $this->_tpl_vars['sh_title']; ?>
', // 分享标题
            desc: '<?php echo $this->_tpl_vars['sh_desc']; ?>
', // 分享描述
            link: '<?php echo $this->_tpl_vars['sh_url']; ?>
', // 分享链接
            imgUrl: '<?php echo $this->_tpl_vars['sh_img']; ?>
', // 分享图标
            type: '', // 分享类型,music、video或link，不填默认为link
            dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
            success: function () {

            }
        });
      wx.onMenuShareQQ({
        title: '<?php echo $this->_tpl_vars['sh_title']; ?>
', // 分享标题
        desc: '<?php echo $this->_tpl_vars['sh_desc']; ?>
', // 分享描述
       	link: '<?php echo $this->_tpl_vars['sh_url']; ?>
',
        imgUrl: '<?php echo $this->_tpl_vars['sh_img']; ?>
',
        success: function () {

        },
        cancel: function () {

        }
      });
      wx.onMenuShareWeibo({
        title: '<?php echo $this->_tpl_vars['sh_title']; ?>
', // 分享标题
        desc: '<?php echo $this->_tpl_vars['sh_desc']; ?>
', // 分享描述
        link: '<?php echo $this->_tpl_vars['sh_url']; ?>
',
        imgUrl: '<?php echo $this->_tpl_vars['sh_img']; ?>
',
        success: function () {
        // 用户确认分享后执行的回调函数
        },
        cancel: function () {
        // 用户取消分享后执行的回调函数
        }
      });
    });
</script>