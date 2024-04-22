docker pull bitnami/kafka

docker run -d --name kafka -p 9092:9092 -p 9093:9093 \
  -e KAFKA_ENABLE_KRAFT=yes \
  -e KAFKA_CFG_PROCESS_ROLES=broker,controller \
  -e KAFKA_CFG_CONTROLLER_LISTENER_NAMES=CONTROLLER \
  -e KAFKA_CFG_LISTENERS=PLAINTEXT://0.0.0.0:9092,CONTROLLER://:9093 \
  -e KAFKA_CFG_LISTENER_SECURITY_PROTOCOL_MAP=CONTROLLER:PLAINTEXT,PLAINTEXT:PLAINTEXT \
  -e KAFKA_CFG_ADVERTISED_LISTENERS=PLAINTEXT://ggok.top:9092 \
  -e KAFKA_CFG_CONTROLLER_QUORUM_VOTERS=0@ggok.top:9093 \
  -e KAFKA_CFG_NODE_ID=0 \
  -e KAFKA_KRAFT_CLUSTER_ID=iZWRiSqjZAlYwlKEqHFQWI \
  -e ALLOW_PLAINTEXT_LISTENER=yes \
  -e KAFKA_HEAP_OPTS="-Xms512M -Xmx512M" \
  bitnami/kafka

#kafka-web可视化工具
docker stop kafka-ui && docker rm kafka-ui
docker run -d --name kafka-ui \
    -p 8080:8080 \
    -p 8092:8092 \
    -e KAFKA_CLUSTERS_0_NAME=kafka001 \
    -e KAFKA_CLUSTERS_0_BOOTSTRAPSERVERS=ggok.top:9092 \
    -e KAFKA_CLUSTERS_1_NAME=kafka002 \
    -e KAFKA_CLUSTERS_1_BOOTSTRAPSERVERS=ggok.top:9092 \
    -e TZ=Asia/Shanghai \
    -e LANG=C.UTF-8 \
    provectuslabs/kafka-ui:latest
docker logs -f kafka-ui

#账号
#-e SERVER_SERVLET_CONTEXT_PATH="/" \
#-e AUTH_TYPE="LOGIN_FORM" \
#-e SPRING_SECURITY_USER_NAME=admin \
#-e SPRING_SECURITY_USER_PASSWORD="admin" \
# 第二个账号
#-e KAFKA_CLUSTERS_1_NAME=kafka9093 \
#-e KAFKA_CLUSTERS_1_BOOTSTRAPSERVERS=ggok.top:9093 \
