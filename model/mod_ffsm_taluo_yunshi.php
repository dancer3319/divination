<?php
if (!defined('CORE'))  exit('Request Error!');
class mod_ffsm_taluo_yunshi {
	
	
	public function car_bieren(){
        $sql = 'select * from `ffsm_taluo_bieren` where `lie`=1 ORDER BY rand() limit 1';
        $one = db::queryone($sql);

        if($one['img']==''){
            $one['img'] = self::carimg($one['pid'],$one['zf']);
        }
        $one['titles'] = preg_replace('|[0-9a-zA-Z/]+|','',$one['title']);
        $one['titles'] = preg_replace("/\t/","",$one['titles']);


        $sql = 'select * from `ffsm_taluo_bieren` where `lie`=2 and `pid`!="'.$one['pid'].'" ORDER BY rand() limit 1';
        $two = db::queryone($sql);

        if($two['img']==''){
            $two['img'] = self::carimg($two['pid'],$two['zf']);
        }
        $two['titles'] = preg_replace('|[0-9a-zA-Z/]+|','',$two['title']);
        $two['titles'] = preg_replace("/\t/","",$two['titles']);

        $sql = 'select * from `ffsm_taluo_bieren` where `lie`=3 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" ORDER BY rand() limit 1';
        $three = db::queryone($sql);

        if($three['img']==''){
            $three['img'] = self::carimg($three['pid'],$three['zf']);
        }
        $three['titles'] = preg_replace('|[0-9a-zA-Z/]+|','',$three['title']);
        $three['titles'] = preg_replace("/\t/","",$three['titles']);


        $sql = 'select * from `ffsm_taluo_bieren` where `lie`=4 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" and `pid`!="'.$three['pid'].'" ORDER BY rand() limit 1';
        $four = db::queryone($sql);

        if($four['img']==''){
            $four['img'] = self::carimg($four['pid'],$four['zf']);
        }
        $four['titles'] = preg_replace('|[0-9a-zA-Z/]+|','',$four['title']);
        $four['titles'] = preg_replace("/\t/","",$four['titles']);


        $sql = 'select * from `ffsm_taluo_bieren` where `lie`=5 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" and `pid`!="'.$three['pid'].'" and `pid`!="'.$four['pid'].'" ORDER BY rand() limit 1';
        $five = db::queryone($sql);

        if($five['img']==''){
            $five['img'] = self::carimg($five['pid'],$five['zf']);
        }
        $five['titles'] = preg_replace('|[0-9a-zA-Z/]+|','',$five['title']);
        $five['titles'] = preg_replace("/\t/","",$five['titles']);


        $sql = 'select * from `ffsm_taluo_bieren` where `lie`=6 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" and `pid`!="'.$three['pid'].'" and `pid`!="'.$four['pid'].'" and `pid`!="'.$five['pid'].'" ORDER BY rand() limit 1';
        $six = db::queryone($sql);

        if($six['img']==''){
            $six['img'] = self::carimg($six['pid'],$six['zf']);
        }
        $six['titles'] = preg_replace('|[0-9a-zA-Z/]+|','',$six['title']);
        $six['titles'] = preg_replace("/\t/","",$six['titles']);

        return array($one,$two,$three,$four,$five,$six);

    }

    /**
     *抽取数据库牌库-1-2-3列随机抽取
     */
    public function car(){
        $sql = 'select * from `ffsm_taluo_yunshi` where `lie`=1 ORDER BY rand() limit 1';
        $one = db::queryone($sql);

        if($one['img']==''){
            $one['img'] = self::carimg($one['pid'],$one['zf']);
        }


        $sql = 'select * from `ffsm_taluo_yunshi` where `lie`=2 and `pid`!="'.$one['pid'].'" ORDER BY rand() limit 1';
        $two = db::queryone($sql);

        if($two['img']==''){
            $two['img'] = self::carimg($two['pid'],$two['zf']);
        }

        $sql = 'select * from `ffsm_taluo_yunshi` where `lie`=3 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" ORDER BY rand() limit 1';
        $three = db::queryone($sql);

        if($three['img']==''){
            $three['img'] = self::carimg($three['pid'],$three['zf']);
        }

        return array($one,$two,$three);

    }

    /***
     * 卡牌图库
     */
	public function carimg($pid,$zf){
	    $imgdir = '/statics/ffsm/taluo/yunshi/images/';
	    return $imgdir.$pid.'_'.$zf.'.jpg';


    }


    /***---------分割线---------***/


    /**
     *抽取数据库牌库-1-2-3列随机抽取
     */
    public function car_xinli(){
        $sql = 'select * from `ffsm_taluo_xinli` where `lie`=1 ORDER BY rand() limit 1';
        $one = db::queryone($sql);

        if($one['img']==''){
            $one['img'] = self::carimg($one['pid'],$one['zf']);
        }


        $sql = 'select * from `ffsm_taluo_xinli` where `lie`=2 and `pid`!="'.$one['pid'].'" ORDER BY rand() limit 1';
        $two = db::queryone($sql);

        if($two['img']==''){
            $two['img'] = self::carimg($two['pid'],$two['zf']);
        }

        $sql = 'select * from `ffsm_taluo_xinli` where `lie`=3 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" ORDER BY rand() limit 1';
        $three = db::queryone($sql);

        if($three['img']==''){
            $three['img'] = self::carimg($three['pid'],$three['zf']);
        }


        $sql = 'select * from `ffsm_taluo_xinli` where `lie`=4 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" and `pid`!="'.$three['pid'].'" ORDER BY rand() limit 1';
        $four = db::queryone($sql);

        if($four['img']==''){
            $four['img'] = self::carimg($four['pid'],$four['zf']);
        }

        return array($one,$two,$three,$four);

    }



    /**
     *抽取数据库牌库-1-2-3列随机抽取
     */
    public function car_anlian(){
        $sql = 'select * from `ffsm_taluo_anlian` where `lie`=1 ORDER BY rand() limit 1';
        $one = db::queryone($sql);

        if($one['img']==''){
            $one['img'] = self::carimg($one['pid'],$one['zf']);
        }


        $sql = 'select * from `ffsm_taluo_anlian` where `lie`=2 and `pid`!="'.$one['pid'].'" ORDER BY rand() limit 1';
        $two = db::queryone($sql);

        if($two['img']==''){
            $two['img'] = self::carimg($two['pid'],$two['zf']);
        }

        $sql = 'select * from `ffsm_taluo_anlian` where `lie`=3 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" ORDER BY rand() limit 1';
        $three = db::queryone($sql);

        if($three['img']==''){
            $three['img'] = self::carimg($three['pid'],$three['zf']);
        }


        $sql = 'select * from `ffsm_taluo_anlian` where `lie`=4 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" and `pid`!="'.$three['pid'].'" ORDER BY rand() limit 1';
        $four = db::queryone($sql);

        if($four['img']==''){
            $four['img'] = self::carimg($four['pid'],$four['zf']);
        }

        return array($one,$two,$three,$four);

    }


    /**
     *抽取数据库牌库-1-2-3列随机抽取
     */
    public function car_jixu(){
        $sql = 'select * from `ffsm_taluo_jixu` where `lie`=1 ORDER BY rand() limit 1';
        $one = db::queryone($sql);

        if($one['img']==''){
            $one['img'] = self::carimg($one['pid'],$one['zf']);
        }


        $sql = 'select * from `ffsm_taluo_jixu` where `lie`=2 and `pid`!="'.$one['pid'].'" ORDER BY rand() limit 1';
        $two = db::queryone($sql);

        if($two['img']==''){
            $two['img'] = self::carimg($two['pid'],$two['zf']);
        }

        $sql = 'select * from `ffsm_taluo_jixu` where `lie`=3 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" ORDER BY rand() limit 1';


        $three = db::queryone($sql);

        if($three['img']==''){
            $three['img'] = self::carimg($three['pid'],$three['zf']);
        }


        $sql = 'select * from `ffsm_taluo_jixu` where `lie`=4 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" and `pid`!="'.$three['pid'].'" ORDER BY rand() limit 1';
        $four = db::queryone($sql);

        if($four['img']==''){
            $four['img'] = self::carimg($four['pid'],$four['zf']);
        }

        return array($one,$two,$three,$four);

    }



    /**
     *抽取数据库牌库-1-2-3列随机抽取
     */
    public function car_aiqing(){
        $sql = 'select * from `ffsm_taluo_aiqing` where `lie`=1 ORDER BY rand() limit 1';
        $one = db::queryone($sql);

        if($one['img']==''){
            $one['img'] = self::carimg($one['pid'],$one['zf']);
        }
        $one['titles'] = preg_replace('|[0-9a-zA-Z/]+|','',$one['title']);
        $one['titles'] = preg_replace("/\t/","",$one['titles']);


        $sql = 'select * from `ffsm_taluo_aiqing` where `lie`=2 and `pid`!="'.$one['pid'].'" ORDER BY rand() limit 1';
        $two = db::queryone($sql);

        if($two['img']==''){
            $two['img'] = self::carimg($two['pid'],$two['zf']);
        }
        $two['titles'] = preg_replace('|[0-9a-zA-Z/]+|','',$two['title']);
        $two['titles'] = preg_replace("/\t/","",$two['titles']);

        $sql = 'select * from `ffsm_taluo_aiqing` where `lie`=3 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" ORDER BY rand() limit 1';
        $three = db::queryone($sql);

        if($three['img']==''){
            $three['img'] = self::carimg($three['pid'],$three['zf']);
        }
        $three['titles'] = preg_replace('|[0-9a-zA-Z/]+|','',$three['title']);
        $three['titles'] = preg_replace("/\t/","",$three['titles']);


        $sql = 'select * from `ffsm_taluo_aiqing` where `lie`=4 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" and `pid`!="'.$three['pid'].'" ORDER BY rand() limit 1';
        $four = db::queryone($sql);
        $four['des'] = explode(',',$four['des']);

        if($four['img']==''){
            $four['img'] = self::carimg($four['pid'],$four['zf']);
        }
        $four['titles'] = preg_replace('|[0-9a-zA-Z/]+|','',$four['title']);
        $four['titles'] = preg_replace("/\t/","",$four['titles']);


        $sql = 'select * from `ffsm_taluo_aiqing` where `lie`=5 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" and `pid`!="'.$three['pid'].'" and `pid`!="'.$four['pid'].'" ORDER BY rand() limit 1';
        $five = db::queryone($sql);

        if($five['img']==''){
            $five['img'] = self::carimg($five['pid'],$five['zf']);
        }
        $five['titles'] = preg_replace('|[0-9a-zA-Z/]+|','',$five['title']);
        $five['titles'] = preg_replace("/\t/","",$five['titles']);


        $sql = 'select * from `ffsm_taluo_aiqing` where `lie`=6 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" and `pid`!="'.$three['pid'].'" and `pid`!="'.$four['pid'].'" and `pid`!="'.$five['pid'].'" ORDER BY rand() limit 1';
        $six = db::queryone($sql);

        if($six['img']==''){
            $six['img'] = self::carimg($six['pid'],$six['zf']);
        }
        $six['titles'] = preg_replace('|[0-9a-zA-Z/]+|','',$six['title']);
        $six['titles'] = preg_replace("/\t/","",$six['titles']);

        return array($one,$two,$three,$four,$five,$six);

    }

    /***
     * car_tuodan
     */
    public function car_tuodan(){
        $sql = 'select * from `ffsm_taluo_tuodan` where `lie`=1 ORDER BY rand() limit 1';
        $one = db::queryone($sql);

        if($one['img']==''){
            $one['img'] = self::carimg($one['pid'],$one['zf']);
        }


        $sql = 'select * from `ffsm_taluo_tuodan` where `lie`=2 and `pid`!="'.$one['pid'].'" ORDER BY rand() limit 1';
        $two = db::queryone($sql);

        if($two['img']==''){
            $two['img'] = self::carimg($two['pid'],$two['zf']);
        }
        $two['day'] = explode(',',$two['day']);

        if($two['day']==''){
            $two['day'] = array('05月06日','06月13日','07月14日');
        }

        $sql = 'select * from `ffsm_taluo_tuodan` where `lie`=3 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" ORDER BY rand() limit 1';
        $three = db::queryone($sql);

        if($three['img']==''){
            $three['img'] = self::carimg($three['pid'],$three['zf']);
        }



        $sql = 'select * from `ffsm_taluo_tuodan` where `lie`=4 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" and `pid`!="'.$three['pid'].'" ORDER BY rand() limit 1';
        $four = db::queryone($sql);

        if($four['img']==''){
            $four['img'] = self::carimg($four['pid'],$four['zf']);
        }



        $sql = 'select * from `ffsm_taluo_tuodan` where `lie`=5 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" and `pid`!="'.$three['pid'].'" and `pid`!="'.$four['pid'].'" ORDER BY rand() limit 1';
        $five = db::queryone($sql);

        if($five['img']==''){
            $five['img'] = self::carimg($five['pid'],$five['zf']);
        }


        return array($one,$two,$three,$four,$five);

    }




    public function car_fuhe(){
        $sql = 'select * from `ffsm_taluo_fuhe` where `lie`=1 ORDER BY rand() limit 1';
        $one = db::queryone($sql);

        if($one['img']==''){
            $one['img'] = self::carimg($one['pid'],$one['zf']);
        }


        $sql = 'select * from `ffsm_taluo_fuhe` where `lie`=2 and `pid`!="'.$one['pid'].'" ORDER BY rand() limit 1';
        $two = db::queryone($sql);

        if($two['img']==''){
            $two['img'] = self::carimg($two['pid'],$two['zf']);
        }

        $sql = 'select * from `ffsm_taluo_fuhe` where `lie`=3 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" ORDER BY rand() limit 1';
        $three = db::queryone($sql);

        if($three['img']==''){
            $three['img'] = self::carimg($three['pid'],$three['zf']);
        }


        $sql = 'select * from `ffsm_taluo_fuhe` where `lie`=4 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" and `pid`!="'.$three['pid'].'" ORDER BY rand() limit 1';
        $four = db::queryone($sql);

        if($four['img']==''){
            $four['img'] = self::carimg($four['pid'],$four['zf']);
        }

        return array($one,$two,$three,$four);

    }




    public function car_zuihou(){
        $sql = 'select * from `ffsm_taluo_zuihou` where `lie`=1 ORDER BY rand() limit 1';
        $one = db::queryone($sql);

        if($one['img']==''){
            $one['img'] = self::carimg($one['pid'],$one['zf']);
        }


        $sql = 'select * from `ffsm_taluo_zuihou` where `lie`=2 and `pid`!="'.$one['pid'].'" ORDER BY rand() limit 1';
        $two = db::queryone($sql);

        if($two['img']==''){
            $two['img'] = self::carimg($two['pid'],$two['zf']);
        }

        $sql = 'select * from `ffsm_taluo_zuihou` where `lie`=3 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" ORDER BY rand() limit 1';
        $three = db::queryone($sql);

        if($three['img']==''){
            $three['img'] = self::carimg($three['pid'],$three['zf']);
        }


        $sql = 'select * from `ffsm_taluo_zuihou` where `lie`=4 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" and `pid`!="'.$three['pid'].'" ORDER BY rand() limit 1';
        $four = db::queryone($sql);

        if($four['img']==''){
            $four['img'] = self::carimg($four['pid'],$four['zf']);
        }

        return array($one,$two,$three,$four);

    }
	
	
	public function car_fenshou(){
        $sql = 'select * from `ffsm_taluo_fenshou` where `lie`=1 ORDER BY rand() limit 1';
        $one = db::queryone($sql);

        if($one['img']==''){
            $one['img'] = self::carimg($one['pid'],$one['zf']);
        }


        $sql = 'select * from `ffsm_taluo_fenshou` where `lie`=2 and `pid`!="'.$one['pid'].'" ORDER BY rand() limit 1';
        $two = db::queryone($sql);

        if($two['img']==''){
            $two['img'] = self::carimg($two['pid'],$two['zf']);
        }

        $sql = 'select * from `ffsm_taluo_fenshou` where `lie`=3 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" ORDER BY rand() limit 1';
        $three = db::queryone($sql);

        if($three['img']==''){
            $three['img'] = self::carimg($three['pid'],$three['zf']);
        }


        $sql = 'select * from `ffsm_taluo_fenshou` where `lie`=4 and `pid`!="'.$one['pid'].'" and `pid`!="'.$two['pid'].'" and `pid`!="'.$three['pid'].'" ORDER BY rand() limit 1';
        $four = db::queryone($sql);

        if($four['img']==''){
            $four['img'] = self::carimg($four['pid'],$four['zf']);
        }

        return array($one,$two,$three,$four);

    }





}