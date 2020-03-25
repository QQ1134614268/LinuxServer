docker stop mysql && docker rm mysql
rm -rf /opt/docker/
mkdir -p  /opt/docker/mysql/data  /opt/docker/mysql/conf /opt/docker/mysql/logs /opt/docker/mysql/mysql-files

echo '[client]
port=3306
default-character-set=utf8
[mysql]
default-character-set=utf8
[mysqld]
character_set_server=utf8
max_connections=100' > /opt/docker/mysql/conf/my.cnf

chmod -R 777 /opt/docker/mysql
chmod 644 /opt/docker/mysql/conf/my.cnf

docker run  -d --name mysql -p 3306:3306 --privileged=true -v /opt/docker/mysql/conf/my.cnf:/etc/mysql/my.cnf -v /opt/docker/mysql/mysql-files:/var/lib/mysql-files -v /opt/docker/mysql/data:/var/lib/mysql -v /opt/docker/mysql/logs:/var/log/mysql -e MYSQL_ROOT_PASSWORD=1234567890 --restart=always mysql:8.0.19
sleep 20
docker exec -it mysql mysql -uroot -p1234567890 -e "
use mysql;
create user 'wg'@'%' identified with mysql_native_password by '123456';
grant all privileges on *.* to 'wg'@'%' with grant option;
flush privileges;"

# firewall-cmd --zone=public --add-port=3306/tcp --permanent
# firewall-cmd --reload
# systemctl restart docker
# systemctl restart firewalld
