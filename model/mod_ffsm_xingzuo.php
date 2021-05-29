<?php
if (!defined('CORE'))  exit('Request Error!');
$arr_xz=array("白羊座","金牛座","双子座","巨蟹座","狮子座","处女座","天秤座","天蝎座","射手座","摩羯座","水瓶座","双鱼座");
defined('XZ',$arr_xz);
class mod_ffsm_xingzuo {
	/***
     * 取列表数据
     */
    public static function fenxi($row){
        $row['data'] = json_decode(urldecode($row['data']),true);
        if($row['data']['xz']){
            $xz = str_replace('座','',$row['data']['xz']);
            $zh_on = self::xz_zh_on($xz);
            $row['zh_on'] = $zh_on;

            $base = self::xz_base($xz.'座');
            $row['base'] = $base;

            $row['aq'] = self::xz_aq($xz.'座');

            $row['cy'] = self::xz_cy($xz.'座');

            $row['sy'] = self::xz_sy($xz.'座');

            return $row;
        }
        return false;
    }

    public static function xz_aq($xz){
        $sql = 'select * from `ffsm_xingzuo_aq` where `xz`="'.$xz.'"';
        return db::queryone($sql);
    }


    public static function xz_cy($xz){
        $sql = 'select * from `ffsm_xingzuo_cy` where `xz`="'.$xz.'"';
        return db::queryone($sql);
    }

    public static function xz_sy($xz){
        $sql = 'select * from `ffsm_xingzuo_sy` where `xz`="'.$xz.'"';
        return db::queryone($sql);
    }


    public static function xz_zh_on($xz){
        $sql = 'select * from `ffsm_xingzuo_zh` where `xz`="'.$xz.'"';
        return db::queryone($sql);
    }


    public static function xz_base($xz){
        $sql = 'select * from `ffsm_xingzuo_base` where `xz`="'.$xz.'"';
        return db::queryone($sql);
    }






}