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
