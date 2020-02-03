
# 安装mysql
dnf install mysql
systemctl enable mysqld

#开启端口
firewall-cmd --zone=public --add-port=3306/tcp --permanent
firewall-cmd --reload

# 与脚本相关设置参考网址
# mysql
# use mysql;
# update user set host='%' where user='root';
# ALTER USER 'root'@'%' IDENTIFIED BY '123456';
# FLUSH  PRIVILEGES;
#
