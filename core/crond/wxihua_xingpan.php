<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312" />
<title>Untitled Document</title>
</head>

<body>

<?php

//header("Content-type:text/html;charset=utf-8");
ini_set('max_execution_time', 0);

mysql_connect('localhost','root','root');

mysql_select_db('114la_xingzuo');

mysql_query("set names utf8");


$xingpan = array(1=>'̫��',2=>'����',3=>'ˮ��',4=>'����',5=>'����',6=>'ľ��',7=>'����',8=>'������',9=>'������',10=>'ڤ����');

$xingzuo = array(1=>'������',2=>'��ţ��',3=>'˫����',4=>'��з��',5=>'ʨ����',6=>'��Ů��',7=>'�����',8=>'��Ы��',9=>'������',10=>'ħ����',11=>'ˮƿ��',12=>'˫����');

for($i=1;$i<11;$i++){
	
	
	for($di=1;$di<13;$di++){
			
			$f = file_get_contents('http://mix.sina.com.cn/astro/view.php?flag=11&11-1='.$xingpan[$i].'&11-2='.$xingzuo[$di].'');
			
			preg_match_all('/<DIV id=wrap>([\W\w]*?)<H3>([\W\w]*?)<\/H3>([\W\w]*?)<\/DIV>/',$f,$n);
			
			//print_r($n);
			$tc =iconv('GB2312', 'UTF-8', $n[2][0]);
			$cc = iconv('GB2312', 'UTF-8', $n[3][0]);
			
			$t1=iconv('GB2312', 'UTF-8', $xingpan[$i]);			
		
			$t2=iconv('GB2312', 'UTF-8', $xingzuo[$di]);
		
			$md =$t1 .'-'.$t2;
			
			
			$sql="INSERT INTO `xingpan_data` (`title`, `content`, `tid`, `shorttxt`,`t1`,`t2`) VALUES ('".$tc."', '".$cc."', '1', '".$md."','".$t1."','".$t2."')";
			
			$c = mysql_query($sql);
		
		
		
		
	}


}

exit;

while($r = mysql_fetch_array($c)){
	echo $r['title'];
}

?>

</body>
</html>
