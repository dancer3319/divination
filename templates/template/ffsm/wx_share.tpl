<script type="text/javascript" src="http://res2.wx.qq.com/open/js/jweixin-1.6.0.js"></script>
<script>
    wx.config({
        debug: false,
        appId: '<{$signPackage.appId}>',
        timestamp: '<{$signPackage.timestamp}>',
        nonceStr: '<{$signPackage.nonceStr}>',
        signature: '<{$signPackage.signature}>',
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
          title: '<{$sh_title}>', // 分享标题
          link: '<{$sh_url}>', // 分享链接
          imgUrl: '<{$sh_img}>', // 分享图标
          success: function () {

          }
        });
        wx.onMenuShareAppMessage({
            title: '<{$sh_title}>', // 分享标题
            desc: '<{$sh_desc}>', // 分享描述
            link: '<{$sh_url}>', // 分享链接
            imgUrl: '<{$sh_img}>', // 分享图标
            type: '', // 分享类型,music、video或link，不填默认为link
            dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
            success: function () {

            }
        });
      wx.onMenuShareQQ({
        title: '<{$sh_title}>', // 分享标题
        desc: '<{$sh_desc}>', // 分享描述
       	link: '<{$sh_url}>',
        imgUrl: '<{$sh_img}>',
        success: function () {

        },
        cancel: function () {

        }
      });
      wx.onMenuShareWeibo({
        title: '<{$sh_title}>', // 分享标题
        desc: '<{$sh_desc}>', // 分享描述
        link: '<{$sh_url}>',
        imgUrl: '<{$sh_img}>',
        success: function () {
        // 用户确认分享后执行的回调函数
        },
        cancel: function () {
        // 用户取消分享后执行的回调函数
        }
      });
    });
</script>