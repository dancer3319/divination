<?php
//星座屋-星座爱情
ini_set('max_execution_time','0');
header('Content-Type:text/html;charset=utf-8');
ini_set('display_errors',1);
$tid = '471';
$path_log = PATH_ROOT . '/data/log/'.date('Ym').'/xingzuowu/';
$time_start = microtime(true);
if( !is_dir($path_log) )
{
    if(!@mkdir( $path_log, 0777, true ))
    {
        exit("无法创建日志目录/data/log/，请检查是否具有相应目录的写权限");
    }
}

$category_array = array(13=>'鼠', 14=>'牛', 15=>'虎', 16=>'兔', 17=>'龙', 18=>'蛇', 19=>'马', 20=>'羊', 21=>'猴', 22=>'鸡', 23=>'狗', 24=>'猪');
$cath_url = array('http://www.yiabs.com/shengxiao/zishu/l_1.html','http://www.yiabs.com/shengxiao/chouniu/l_1.html','http://www.yiabs.com/shengxiao/yinhu/l_1.html','http://www.yiabs.com/shengxiao/maotu/l_1.html','http://www.yiabs.com/shengxiao/chenlong/l_1.html','http://www.yiabs.com/shengxiao/sishe/l_1.html','http://www.yiabs.com/shengxiao/wuma/l_1.html','http://www.yiabs.com/shengxiao/weiyang/l_1.html','http://www.yiabs.com/shengxiao/shenhou/l_1.html','http://www.yiabs.com/shengxiao/youji/l_1.html','http://www.yiabs.com/shengxiao/xugou/l_1.html','http://www.yiabs.com/shengxiao/haizhu/l_1.html');

_wlog(date( 'Y-m-d H:i:s', $_SERVER['REQUEST_TIME'] ) . "\t ".date('Y-m-d H:i:s')." \t 开始数据分析\r\n");

foreach($category_array as $k=>$v){
$urlk = $k-13;

$listurl = $cath_url[$urlk];
_wlog("开始分析数据".$listurl."\r\n");
$files =  file_get_contents($listurl);

preg_match_all('/<div class="main">([\W\w]*?)<div class="pagelist">/is',$files,$list_arr);
preg_match_all('/<h3><a href="(.*?)"/is',$list_arr[0][0],$url_arr);
$url_arr = $url_arr[1];

for($i=0;$i<count($url_arr);$i++){
	
		if(false === stripos($url_arr[$i], 'http')){
			$url =	'http://www.xingzuowu.com'.$url_arr[$i];
		}else{
			$url = 	$url_arr[$i];
		}
		
		$file = file_get_contents($url);
		
		preg_match_all('/<div class="sbody"><h2 class="title">([\W\w]*?)<\/h2>([\W\w]*?)<div class="pagelist"><\/div>/is',$file,$nnc);
		
		$title = $nnc[1][0];
		$contents = $nnc[0][0];
		
		$title =  iconv('GB2312', 'UTF-8', $title);
		$cc = iconv('GB2312', 'UTF-8', $contents);
		
		if($title){
			$cls = new mod_cai();
			$cc = $cls->replace($cc,'http://www.yiabs.com');
			
			$img = $cc['img'];
			$shorttxt = $cc['shorttxt'];
			$content = $cc['content'];
			
			$sql = 'select `id` from `news_data` where `title`="'.$title.'"';
			$data = db::queryone($sql);
			
			if($data['id']==''){
				$sql="INSERT INTO `news_data` (`title`, `content`,`img`, `tid`,`shorttxt`,`category`) VALUES ('".$title."', '".$content."','".$img."', '".$tid."','".$shorttxt."','".$k."')";
				if($content!=''){
					if(db::query($sql)){
						_wlog("采集成功\r\n");
					}else{
						//_wlog($title."存入失败\r\n");
					}
				}else{
					_wlog("空内容\r\n");
				}
			}else{
				_wlog($title."cunzai\r\n");
			}
			
		}else{
			_wlog("空标题\r\n");
		}
	
}


}

$total_time = microtime(true) - $time_start;
_wlog(date( 'Y-m-d H:i:s', $_SERVER['REQUEST_TIME'] ) . "\t ".date('Y-m-d H:i:s')." \t 完成数据分析，耗时 $total_time s\r\n");


/**
 * 写日志函数
 * @param $msg 信息
 * @param bool $isEcho 是否输出
 * @param bool $isExit 是否退出
 */
function _wlog($msg,$isEcho=true,$isExit=false)
{
    global $path_log,$filename,$log_file_name;
    if(!$msg)return false;
    if($isEcho)echo iconv('gbk','utf-8',$msg)."\r\n";
    error_log($msg."\r\n",3,$path_log . 'xingzuowushuxiang.log');
    //if($isExit)exit();
}


?>
