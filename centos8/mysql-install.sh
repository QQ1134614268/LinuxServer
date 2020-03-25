# 安装mysql
dnf install mysql
systemctl enable mysqld

#开启端口
firewall-cmd --zone=public --add-port=3306/tcp --permanent
firewall-cmd --reload

# 与脚本相关设置参考网址
# mysql
# use mysql;
# ALTER USER 'root'@'localhost' IDENTIFIED BY '123456';
# create user 'wg'@'%' identified with mysql_native_password by '123456';
# grant all privileges on *.* to 'root'@'%' with grant option;
# flush privileges;
# exit;
