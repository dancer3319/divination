<?php
if( !defined('CORE') ) exit('Request Error!');
/**
 * Ĭ����־��
 *
 * ע�⣺ͨ������£�debug�����ķ��������󣬲�Ҫʹ����־ϵͳ��¼����debugϵͳ���п���
 *
 * @since 2011-07-20
 * @author huahuoTM<285507230@qq>
 * @version $Id$
 */
class log
{
    
   //��־��¼�ڴ����
   private static $logs = array();
   
   //��־�ļ����ͣ�Ĭ��file��
   private static $log_type = 'file';
   
   //��־�ļ�·��
   private static $log_paths = array();
   
   /**
    * ����һ����־��¼(���������ϱ��棬��ϵͳ��������ʱ���� log::save ��������)
    * @param $log_name (��־�ļ���[Ӣ�����ֻ��»������])
    *        ͨ������£���Ӧ��ʵ���ļ����� $log_path/$log_name.'log'
    *        ���Ҫָ��ʹ���ض��Ĳ㼶Ŀ¼��ֱ��ʹ�� $path1/$path2/$log_name ������Ϊ $log_name ����
    *
    * @parem $msg  ��־��Ϣ
    * @return void
    */               
    public static function add($log_name, $msg)
    {
        $logs[ $log_name ][] = $msg;
    }
    
   /**
    * ������־(��php���н���ʱ�Զ�����)
    *
    * @return void
    */               
    public static function save()
    {
        foreach(self::$logs as $log_name => $log_datas )
        {
            $log_file = self::_get_log_path( $log_name );
            $msgs = '';
            foreach($log_datas as $msg) {
                $msgs .= $msg;
            }
            file_put_contents($log_file, $msgs, FILE_APPEND);
            self::$logs = array();
        }
    }
    
   /**
    * �����־�ļ����Ŀ¼
    */
    private static function _get_log_path( $path_name )
    {
        $base_path = $GLOBALS['config']['log']['file_path'];
        
        //path_nameֻ��ͬӢ�����ֺ��»��ߡ�'/'��ɣ����Ҳ�����ǰ������ / 
        $path_name = preg_replace('#[^\w/]#', '', $path_name);
        $path_name = preg_replace('#^/#', '', $path_name);
        $path_name = preg_replace('#/$#', '', $path_name);
        
        //������û���Ѿ�����õ��ļ���
        if( isset(self::$log_paths[$path_name]) )
        {
            return self::$log_paths[$path_name];
        }
        
        //����ʵ��·�����ļ���
        if( !preg_match('#/#', $path_name) )
        {
            self::$log_paths[$path] = $base_path.'/'.$path_name.'.log';
            return self::$log_paths[$path];
        }
        else
        {
            $log_name = preg_replace("#(.*)/#", '', $path_name);
            $path = preg_replace("#/{$log_name}$#", '', $path_name);
            $paths = explode('/', $path);
            foreach($paths as $p)
            {
                if( $p != '' )
                {
                    $base_path .= '/'.$p;
                    if( !is_dir($base_path) ) {
                        mkdir($base_path, 0660);
                    }
                }
            }
            self::$log_paths[$path] = $base_path.'/'.$log_name.'.log';
            return $base_path;
        }
    }
    
}

