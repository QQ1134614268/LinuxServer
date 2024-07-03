docker pull apache/doris
docker pull apache/doris:build-env-ldb-toolchain-latest
docker run -d --name doris -p 8030:8030 -p 9030:9030 -p 8031:8031 -p 8032:8032  apache/doris:build-env-ldb-toolchain-latest

#
wget https://apache-doris-releases.oss-accelerate.aliyuncs.com/apache-doris-2.0.12-bin-x64.tar.gz
tar zxf apache-doris-2.0.12-bin-x64.tar.gz
mv apache-doris-2.0.12-bin-x64 ./dev

#apache-doris/be/conf/be.conf
JAVA_HOME=/home/doris/jdk8

./bin/start_fe.sh --daemon
./bin/start_be.sh --daemon

Doris 的管理界面: 	http://ggok.top:8030/   用户名:admin 密码空

create database demo;
use demo;
create table mytable
(
    k1 TINYINT,
    k2 DECIMAL(10, 2) DEFAULT "10.05",
    k3 CHAR(10) COMMENT "string column",
    k4 INT NOT NULL DEFAULT "1" COMMENT "int column"
)
COMMENT "my first table"
DISTRIBUTED BY HASH(k1) BUCKETS 1
PROPERTIES ('replication_num' = '1');