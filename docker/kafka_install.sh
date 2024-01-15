# 3 docker 部署
docker pull kubebiz/kafka:2.13-3.3.1

mkdir -p  /opt/kafka/config/kraft
mkdir -p  /opt/kafka/logs

docker stop kafka && docker rm kafka
docker run  --name kafka -p 9092:9092 \
  -e KAFKA_ENABLE_KRAFT=yes \
  -e KAFKA_CFG_PROCESS_ROLES=borker,controller \
  -e KAFKA_CFG_CONTROLLER_LISTENER_NAMES=CONTROLLER \
  -e KAFKA_CFG_LISTENERS=PLAINTEXT://0.0.0.0:9092,CONTROLLER://:9093 \
      -e KAFKA_CFG_LISTENER_SECURITY_PROTOCOL_MAP=CONTROLLER:PLAINTEXT,PLAINTEXT:PLAINTEXT \
  -e KAFKA_CFG_ADVERTISED_LISTENERS=PLAINTEXT://ggok.top:9092 \
  -e KAFKA_BROKER_ID=0 \
  -e KAFKA_HEAP_OPTS="-Xms512M -Xmx512M" \
  -d kafka
# -v /tmp/kraft-combined-logs:/tmp/kraft-combined-logs \
docker logs kafka

