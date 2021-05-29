

$(document).ready(function(){
	var sConfig = {
		baidu: {
			action: "http://www.baidu.com/s",
			name: "wd",
			params:{
				tn:'ylmf_4_pg',
				ch:'7',
				ie:'gbk'
			}
		},
		sogou: {
			action: "http://www.sogou.com/web",
			name: "query",
			params:{
				pid:'sogou-site-dfb84a11f431c624'
			}
		}
	};
   
	//添加收藏
	function AddFavorite(url,title){
	    try{
	        window.external.addFavorite(url, title);
	    }
	    catch(e){
	        try{
	            window.sidebar.addPanel(title, url, "");
	        }
	        catch(e){
	            alert("您的浏览器不支持收藏功能，请使用Ctrl+D进行添加");
	        }
	    }
	};
	$("#collet").click(function(){
		AddFavorite('http://www.114la.com/?114la','114啦网址导航'); return false;
	});
	var categorys = false;
	$(".categorys").bind({
		mouseover:function(){
			categorys = true;
		},
		mouseout:function(){
			categorys = false;
		}
	});
	$("a.cates").click(function(){
		$(".categorys").slideToggle();
		$(this).toggleClass('active');
	}).hover(function(){
		categorys = true;
	},function(){
		categorys = false;
	});
	$(".comRowGuid dl").hover(
		function(){
			$(this).addClass('hover');
		},
		function(){
			$(this).removeClass('hover');
		}
	);
	$(".blk-show").find("h3").hover(function(){
		$(this).addClass('hover');
	},function(){
		$(this).removeClass('hover');
	}).click(function(){
		// $(".blk-show h3").removeClass("active");
		// $(".parConts").hide();
		$(this).toggleClass('active').next().toggle();
	})
	$(".searcha span").click(function(){
		$(this).next("ul").toggle();
	});
	var searcha = false;
	$(".searcha").bind({
		mouseover:function(){
			searcha = true;
		},
		mouseout:function(){
			searcha = false;
		}
	});
	$(document).click(function(){
		if(!searcha) $(".searcha ul").hide();
		if(!categorys){
			$(".categorys").slideUp();
			$("a.cates").removeClass('active');
		}
	});
	$(".searcha input").bind({
		focus:function(){
			if($(this).val() == '请输入搜索关键字') $(this).val('');
			$(".searcha ul").hide();
		},
		blur:function(){
			if($(this).val() == '') $(this).val('请输入搜索关键字');
		}
	});
	$(".searcha ul li").click(function(){
		var relue = $(this).attr("rel");
		var relTxt = $(this).text();
		var sArry = sConfig[relue];
		var params = sArry.params;
		var input = '';
		for (v in params){
			$(params).each(function (i,items){
				input += '<input type="hidden" name="'+v+'" value="'+params[v]+'" />';
			});
		};
		//console.log(input)
		$(".searcha span").html(relTxt+'<i />');
		$(".searcha ul").hide();
		$("#innerTxt").attr("name",sArry.name);
		$(".searcha").find("input[type='hidden']").remove();
		$("#searForm").attr("action",sArry.action).append(input);
	})

	//回到顶部
	var gotoTop = {
		fixed: "#costom",
		id: "#gotop",
		clickMe : function(){
			$('html,body').animate({scrollTop : '0px'},{ duration:500});
		},
		toggleMe : function() {
			if($(window).scrollTop() == 0) {
				$(this.fixed).stop().animate({'opacity': 0}, "slow");
			} else {
				$(this.fixed).stop().animate({'opacity': 1}, "slow");
			}
		},
		init : function() {
			$(this.fixed).css('opacity', 0);
			$(this.id).click(function(){
				gotoTop.clickMe();
				return false;
			});
			$(window).bind('scroll resize', function(){
				gotoTop.toggleMe();
			});
		}
	};
	gotoTop.init();
});