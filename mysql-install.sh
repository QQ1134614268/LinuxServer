
# centos7 tar包:
#     https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-8.0.18-1.el7.x86_64.rpm-bundle.tar
# centos7 yum:
#     https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm

yum -y localinstall https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
yum -y install mysql-community-server

# Yum Repository，以后每次yum操作都会自动更新，需要把这个卸载掉：
# yum -y remove mysql80-community-release-el7-3.noarch.rpm

systemctl start  mysqld.service
systemctl status mysqld.service

systemctl enable mysqld
systemctl daemon-reload

grep 'temporary password' /var/log/mysqld.log
mysql -uroot -p

SHOW VARIABLES LIKE 'validate_password.%';
set global validate_password.length=6;
set global validate_password.policy=0;
set global validate_password.check_user_name=off;

ALTER USER 'root'@'localhost' IDENTIFIED BY '123456';


create user 'root'@'%' identified with mysql_native_password by '123456';
grant all privileges on *.* to 'root'@'%' with grant option;
flush privileges;
exit;


