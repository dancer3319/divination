<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312" />
<title>Untitled Document</title>
</head>

<body>

<?php

//header("Content-type:text/html;charset=utf-8");

mysql_connect('localhost','root','root');

mysql_select_db('114la_xingzuo');

mysql_query("set names utf8");


		

//GO = http://www.xingzuowu.com/cx/8/110099.html?

//END = http://www.xingzuowu.com/cx/8/22002020.html?		


$xingzuo = array(1=>'������',2=>'��ţ��',3=>'˫����',4=>'��з��',5=>'ʨ����',6=>'��Ů��',7=>'�����',8=>'��Ы��',9=>'������',10=>'ħ����',11=>'ˮƿ��',12=>'˫����');
$shuxiang = array(1=>'��',2=>'ţ',3=>'��',4=>'��',5=>'��',6=>'��',7=>'��',8=>'��',9=>'��',10=>'��',11=>'��',12=>'��');
for($i=0;$i<12;$i++){
	
	for($is=1;$is<13;$is++){
	
	
		echo 'iAstro='.$i.'&lunar='.$shuxiang[$is].'&serveid=AMB0020';
		
		$url = 'http://www.go108.com.cn/free/xingzuoshengxiao/result.php';
		$xx = send($url,'iAstro='.$i.'&lunar='.$shuxiang[$is].'&serveid=AMB0020');
		
		
		preg_match_all('/<TD width="603" align="right" vAlign=top>([\W\w]*?)<\/TD>/',$xx,$cc);
		
		
		$contents = $cc[1][0];
		
		preg_match_all('/<SPAN class=style2>���������([\W\w]*?) <\/SPAN>([\w\W]*?)<SPAN class=style2>�����Ф��([\w\W]*?)<\/SPAN>/is',$contents,$nnew);
		
		//print_r($nnew[1][0]);
		$contents = iconv('GB2312', 'UTF-8', $contents);
		$t1=iconv('GB2312', 'UTF-8', $nnew[1][0]);
		$t2=iconv('GB2312', 'UTF-8', $nnew[3][0]);
		
		//echo $contents;
		
		$md = $t1.'-'.$t2;
		
		//echo '<br>'.$t1.$t2;
		
		//die;
		
		if($t1!='' && $t2!=''){
			
			
			
			
			$sql="INSERT INTO `peidui_data` (`title`, `content`, `tid`, `shorttxt`,`t1`,`t2`) VALUES ('".$md."', '".$contents."', '6', '".$md."','".$t1."','".$t2."')";
		
			$c = mysql_query($sql);
			
			echo $i.'ok<br>';
			
		}
		
	
	}
	
	
}
		


print_r($xx);
	
die;		




/**
 * ��ȡԶ������
 * @param  $url ��ַ
 * @param  $post_data ����
 * @param  $method ����
 * @param  $timeout ��ʱ
 */
function send($url = "", $post_data = '', $method = 'POST', $timeout = 3,$debug=false) {
    if (is_array($post_data)) {
        $post_data = http_build_query($post_data);
    }
    if ($method == 'GET') {
        if ($post_data)
            $url = $url . '?' . ltrim($post_data, '?');
    }
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, trim($url));
    curl_setopt($ch, CURLOPT_HTTPHEADER, array('User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) \r\n Accept: */*'));
    curl_setopt($ch, CURLOPT_TIMEOUT, $timeout);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    if ($method == 'POST') {
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
    }
    $content = curl_exec($ch);
    $response = curl_getinfo($ch);
    if($debug){
        var_dump($response);
    }
    return $content;
}

?>

</body>
</html>