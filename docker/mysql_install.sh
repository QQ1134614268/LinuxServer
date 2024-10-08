#!/usr/bin/env bash

# rm -rf /etc/mysql
mkdir -m 644 -p /etc/mysql/conf

echo '
[client]
port=3306
default-character-set=UTF8MB4
[mysql]
default-character-set=UTF8MB4
[mysqld]
character_set_server=UTF8MB4
max_connections=100
' > /etc/mysql/conf/my.cnf

docker pull mysql:8.0.19

docker run  --name mysql --restart=always  --privileged=true \
-p 3306:3306 \
-v /etc/mysql/conf/my.cnf:/etc/mysql/my.cnf \
-v /var/lib/mysql-files:/var/lib/mysql-files \
-v /var/lib/mysql:/var/lib/mysql \
-v /var/log/mysql:/var/log/mysql \
-e MYSQL_ROOT_PASSWORD=1234567890 \
-d mysql:8.0.19

# docker stop mysql && docker rm mysql

sleep 20
docker exec -it mysql mysql -uroot -p1234567890 -e "
use mysql;
create user 'wg'@'%' identified with mysql_native_password by '123456';
grant all privileges on *.* to 'wg'@'%' with grant option;
flush privileges;"

# docker exec -it mysql mysql -uroot -p1234567890 -e "source /var/lib/mysql/sqlfile.sql"

# firewall-cmd --zone=public --add-port=3306/tcp --permanent && firewall-cmd --reload
