#1. jdk
yum install java-1.8.0-openjdk.x86_64 -y
vi /etc/profile
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.312.b07-1.el7_9.x86_64/jre/bin/java
export PATH=$JAVA_HOME:$PATH
source /etc/profile
#2. 安装mysql

#3. 安装zookeeper
wget https://dlcdn.apache.org/zookeeper/zookeeper-3.7.0/apache-zookeeper-3.7.0-bin.tar.gz  --no-check-certificate
tar -xvf  apache-zookeeper-3.7.0-bin.tar.gz -C /usr/local/apache-zookeeper-3.7.0
cp /usr/local/apache-zookeeper-3.7.0/conf/zoo_sample.cfg /usr/local/apache-zookeeper-3.7.0/conf/zoo.cfg
./usr/local/apache-zookeeper-3.7.0/bin/zkServer.sh start

#4
wget https://dlcdn.apache.org/dolphinscheduler/1.3.9/apache-dolphinscheduler-1.3.9-bin.tar.gz  --no-check-certificate
tar -xvf apache-dolphinscheduler-1.3.9-bin.tar.gz -C /usr/local/apache-dolphinscheduler-1.3.9

# 创建用户需使用 root 登录
useradd dolphinscheduler
# 添加密码
echo "dolphinscheduler" | passwd --stdin dolphinscheduler
# 配置 sudo 免密
sed -i '$adolphinscheduler  ALL=(ALL)  NOPASSWD: NOPASSWD: ALL' /etc/sudoers
sed -i 's/Defaults    requirett/#Defaults    requirett/g' /etc/sudoers
# 修改目录权限，使得部署用户对 dolphinscheduler-bin 目录有操作权限
chown -R dolphinscheduler:dolphinscheduler /usr/local/apache-dolphinscheduler-1.3.9

vi /usr/local/apache-dolphinscheduler-1.3.9/conf/datasource.properties

spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
spring.datasource.url=jdbc:mysql://127.0.0.1:3306/dolphinscheduler_db?useUnicode=true&characterEncoding=UTF-8&useSSL=false
spring.datasource.username=root
spring.datasource.password=123456

sh /usr/local/apache-dolphinscheduler-1.3.9/script/create-dolphinscheduler.sh
# todo sh /usr/local/apache-dolphinscheduler-1.3.9/bin/create-dolphinscheduler.sh
#
#sh /usr/local/apache-dolphinscheduler-1.3.9/bin/dolphinscheduler-daemon.sh start standalone-server
