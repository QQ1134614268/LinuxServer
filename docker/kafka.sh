# 参考网址 https://www.cnblogs.com/angelyan/p/14445710.html
docker pull bitnami/kafka
#docker build -t bitnami/kafka:latest 'https://github.com/bitnami/bitnami-docker-kafka.git#master:3.1/debian-10'

docker stop kafka && docker rm kafka

docker run -d --name kafka \
  -p 9092:9092 \
  -e KAFKA_BROKER_ID=0 \
  -e ALLOW_PLAINTEXT_LISTENER=yes \
  -e KAFKA_ZOOKEEPER_CONNECT=ggok.top:2181 \
  -e KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://ggok.top:9092 \
  -e KAFKA_LISTENERS=PLAINTEXT://0.0.0.0:9092 bitnami/kafka
