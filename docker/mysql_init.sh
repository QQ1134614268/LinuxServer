#!/usr/bin/env bash
docker stop mysql && docker rm mysql

echo '[client]
port=3306
default-character-set=utf8
[mysql]
default-character-set=utf8
[mysqld]
character_set_server=utf8
max_connections=100' > /etc/mysql/conf/my.cnf

chmod 644 /etc/mysql/conf/my.cnf

docker run  -d --name mysql -p 3306:3306 --privileged=true -v /etc/mysql/conf/my.cnf:/etc/mysql/my.cnf -v /var/lib/mysql-files:/var/lib/mysql-files -v /var/lib/mysql:/var/lib/mysql -v /var/log/mysql:/var/log/mysql -e MYSQL_ROOT_PASSWORD=1234567890 --restart=always mysql:8.0.19
sleep 20
docker exec -it mysql mysql -uroot -p1234567890 -e "
use mysql;
create user 'wg'@'%' identified with mysql_native_password by '123456';
grant all privileges on *.* to 'wg'@'%' with grant option;
flush privileges;"

# docker exec -it mysql mysql -uroot -p1234567890 -e "source /var/lib/mysql/sqlfile.sql"

# firewall-cmd --zone=public --add-port=3306/tcp --permanent
# firewall-cmd --reload
# systemctl restart docker
# systemctl restart firewalld
