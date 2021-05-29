
<script type="text/javascript" src="/statics/user/js/mshare.js" ></script>
        <script>
        $('#mshare_btss').ready(function(){		
		var mshare = new mShare({
              title : '<{$sh_title}>', 
			  url   : '<{$sh_url}>',
              desc  : '<{$sh_desc}>',
              img   : '<{$sh_img}>'
        });
        $('#mshare_btss').click(function () {
            mshare.init(0,'#mshare_btss');
        });
		});
</script>
<script>
function dl_getCookie(cname){
	var name = cname + "=";
	var ca = document.cookie.split(';');
	for(var i=0; i<ca.length; i++) {
		var c = ca[i].trim();
		if (c.indexOf(name)==0) { return c.substring(name.length,c.length); }
	}
	return "";
}
function addUrlPara1(value) {  
  	var Cts =window.location.href; 
  	var name ='dl';
	if(Cts.indexOf("dl") <= 0 ){
    var currentUrl = Cts.split('#')[0];  
    if (/\?/g.test(currentUrl)) {  
        currentUrl += "&" + name + "=" + value;  
    } else {  
        currentUrl += "?" + name + "=" + value;  
    }  
    if (Cts.split('#')[1]) {  
      
        history.replaceState(null,null,currentUrl + '#' + Cts.split('#')[1]);		
    } else {  
	    history.replaceState(null,null,currentUrl);
    } 
    }
} 
addUrlPara1(<{$dl_ids}>);

</script>
