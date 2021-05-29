<?php 
if (!defined('CORE'))  exit('Request Error!'); 
class mod_hehun_api { 
	function hehun($data){
		$hh1 = trim($data[qianzao1]);
		$hh1 = strtr($hh1, ' ', '');
		$hh1 = str_replace('&nbsp;', '1',$hh1);
		$hh1 = htmlspecialchars_decode($hh1);//把一些预定义的 HTML 实体转换为字符
		$hh1 = str_replace("&nbsp;","",$hh1);//将空格替换成空
		$hh1 = strip_tags($hh1);
		$hh1 = preg_replace('# #','',$hh1); 
		$hh1 = strip_tags($hh1);
		$hh2 = rtrim($data[qianzao2]);
		$pieces1 = explode("\n",$hh1);
		$pieces2 = explode("\n",$hh2);
		$haar1 = '';
		$haar2 = '';
		$haar3 = '';
		$haar4 = '';
		foreach($pieces1 as $key1 => $value1){
			foreach($pieces2 as $key2 => $value2){
				if($key1==0&&$key2==0){
					$length = mb_strlen($value1, 'utf-8');
					$array1 = [];
					for ($i=0; $i<$length; $i++){
						$ssr = mb_substr($value1, $i, 1, 'utf-8');
					if(strlen($ssr)==3){
						$array1[] = $ssr; 
					}
					}
					#var_dump($array1);
					$length = mb_strlen($value2, 'utf-8');
					$array2 = [];
					for ($i=0; $i<$length; $i++){
						$ssr = mb_substr($value2, $i, 1, 'utf-8');
					if(strlen($ssr)==3){
						$array2[] = $ssr; 
					}
					}
					#var_dump($array2);
					
					foreach($array1 as $key11 => $value11){
						foreach($array2 as $key22 => $value22){
						if($key11==1&&$key22==1){
							$haarx=$value11.$value22;
							$haar1 = db::fetch_all(db::query("SELECT * FROM `hehun` WHERE name='".$haarx."' limit 1"));
							$haar1 = $haar1[0][content];
						}
					}
					}	
				}elseif($key1==2&&$key2==2){
					$length = mb_strlen($value1, 'utf-8');
					$array1 = [];
					for ($i=0; $i<$length; $i++){
						$ssr = mb_substr($value1, $i, 1, 'utf-8');
					if(strlen($ssr)==3){
						$array1[] = $ssr; 
					}
					}
					#var_dump($array1);
					$length = mb_strlen($value2, 'utf-8');
					$array2 = [];
					for ($i=0; $i<$length; $i++){
						$ssr = mb_substr($value2, $i, 1, 'utf-8');
					if(strlen($ssr)==3){
						$array2[] = $ssr; 
					}
					}
					#var_dump($array2);
					
					foreach($array1 as $key11 => $value11){
						foreach($array2 as $key22 => $value22){
						if($key11==0&&$key22==0){
							$haarx=$value11.$value22;
							$haary = db::fetch_all(db::query("SELECT * FROM `hehun10` WHERE name='".$haarx."' limit 1"));
						
							if($haary){
								$haar2 = $haary[0][content];
							}
						
						}elseif($key11==1&&$key22==1){
							$haarx=$value11.$value22;
							$haar3 = db::fetch_all(db::query("SELECT * FROM `hehun1` WHERE name='".$haarx."' limit 1"));
							$haar3 = $haar3[0][content];
						}
					}
					}
				}elseif($key1==3&&$key2==3){
					$length = mb_strlen($value1, 'utf-8');
					$array1 = [];
					for ($i=0; $i<$length; $i++){
						$ssr = mb_substr($value1, $i, 1, 'utf-8');
					if(strlen($ssr)==3){
						$array1[] = $ssr; 
					}
					}
					#var_dump($array1);
					$length = mb_strlen($value2, 'utf-8');
					$array2 = [];
					for ($i=0; $i<$length; $i++){
						$ssr = mb_substr($value2, $i, 1, 'utf-8');
					if(strlen($ssr)==3){
						$array2[] = $ssr; 
					}
					}
					#var_dump($array2);
					
					foreach($array1 as $key11 => $value11){
						foreach($array2 as $key22 => $value22){
						if($key11==1&&$key22==1){
							$haarx=$value11.$value22;
							$haar4 = db::fetch_all(db::query("SELECT * FROM `hehun2` WHERE name='".$haarx."' limit 1"));
							$haar4 = $haar4[0][content];
						}
					}
					}
				}
			}
		}
		#var_dump($haar1);die;
		#print_r($hh1);die;

		$data['haar1']=$haar1;
		$data['haar2']=$haar2;
		$data['haar3']=$haar3;
		$data['haar4']=$haar4;
		$data['oid']=$oid;
		return $data;
	}
	
	
    
} 