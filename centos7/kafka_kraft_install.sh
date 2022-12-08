# 最新版本: 学习资料,bug资料,第三方库

# 1. windows
#修改D:\dev\kafka_2.13-3.3.1\config\kraft\server.properties文件
log.dirs=D:/dev/kafka_2.13-3.3.1/logs/kraft-combined-logs

cd D:\dev\kafka_2.13-3.3.1
#生成存储目录唯一id 3dTO5CPBTbO2EPqSqQR02g
.\bin\windows\kafka-storage.bat random-uuid

#.\bin\windows\kafka-storage.bat format -t <uuid> -c .\config\kraft\server.properties
.\bin\windows\kafka-storage.bat format -t 3dTO5CPBTbO2EPqSqQR02g -c .\config\kraft\server.properties

# 启动
.\bin\windows\kafka-server-start.bat .\config\kraft\server.properties

# 2. Linux
wget https://downloads.apache.org/kafka/3.3.1/kafka_2.13-3.3.1.tgz

./bin/kafka-storage.sh random-uuid

#./bin/kafka-storage.sh format -t <uuid> -c ./config/kraft/server.properties
./bin/kafka-storage.sh format -t 3dTO5CPBTbO2EPqSqQR02g -c ./config/kraft/server.properties

./bin/kafka-server-start.sh ./config/kraft/server.properties

# 3 docker 部署
docker pull kubebiz/kafka:2.13-3.3.1

mkdir -p  /opt/kafka/config/kraft
mkdir -p  /opt/kafka/logs

echo "process.roles=broker,controller
node.id=1
controller.quorum.voters=1@localhost:9093
listeners=PLAINTEXT://:9092,CONTROLLER://:9093
inter.broker.listener.name=PLAINTEXT
advertised.listeners=PLAINTEXT://ggok.top:9092
controller.listener.names=CONTROLLER
listener.security.protocol.map=CONTROLLER:PLAINTEXT,PLAINTEXT:PLAINTEXT,SSL:SSL,SASL_PLAINTEXT:SASL_PLAINTEXT,SASL_SSL:SASL_SSL
num.network.threads=3
num.io.threads=8
socket.send.buffer.bytes=102400
socket.receive.buffer.bytes=102400
socket.request.max.bytes=104857600
log.dirs=/tmp/logs
num.partitions=1
num.recovery.threads.per.data.dir=1
offsets.topic.replication.factor=1
transaction.state.log.replication.factor=1
transaction.state.log.min.isr=1
log.retention.hours=168
log.segment.bytes=1073741824
log.retention.check.interval.ms=300000" > /opt/kafka/config/kraft/server.properties

docker run --name kafka -p 9092:9092 \
  -e KAFKA_BROKER_ID=0 \
  -e KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://ggok.top:9092 \
  -e KAFKA_LISTENERS=PLAINTEXT://0.0.0.0:9092 \
  -e KAFKA_HEAP_OPTS="-Xms512M -Xmx512M" \
  -v /opt/kafka/config/kraft/server.properties:/opt/kafka/config/kraft/server.properties \
  -v /opt/kafka/logs:/tmp/logs \
  -d kubebiz/kafka:2.13-3.3.1  /bin/bash -c "kafka-storage.sh format -t 3dTO5CPBTbO2EPqSqQR02g -c /opt/kafka/config/kraft/server.properties && kafka-server-start.sh /opt/kafka/config/kraft/server.properties"

# -v /tmp/kraft-combined-logs:/tmp/kraft-combined-logs \

# --ignore-formatted

docker stop kafka && docker rm kafka


#$ ./bin\windows/kafka-dump-log.bat  --cluster-metadata-decoder --skip-record-metadata --files /tmp/kraft-combined-logs/__cluster_metadata-0/*.log
#$ ./bin\windows/kafka-metadata-shell.bat  --snapshot /tmp/kraft-combined-logs/__cluster_metadata-0/00000000000000000000.log
#>> ls /topics
#>> cat /topics/foo/0/data

