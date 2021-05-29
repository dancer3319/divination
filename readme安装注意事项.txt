一、权限目录
\data\cache
\templates\compile
目录必须给足够权限，特别是cache下面的cfc_data.php必须给读写。

二、debug模式，调试信息
调试的时候打开/config/inc_config.php。用以显示错误提示。
define('OPEN_DEBUG', true);
线上请关闭

三、服务器要正确安装mbstring.so组件，不然mb_substr()函数用不了；可以再php.ini,或者php -m |less查看是否加载模块成功，
没有的话执行安装：
yum install php-mbstring

四、服务器要正确安装GD库，不然验证码用不了
没有的话执行安装：
yum -y install php-gd



bug记录：
注册的时候，验证码错误被跳过