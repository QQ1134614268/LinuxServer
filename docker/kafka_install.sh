docker pull wurstmeister/kafka:2.12-2.3.1

docker run --name kafka -p 9092:9092 \
	-e KAFKA_BROKER_ID=0 \
	-e KAFKA_ZOOKEEPER_CONNECT=ggok.top:2181/kafka \
	-e KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://ggok.top:9092 \
	-e KAFKA_LISTENERS=PLAINTEXT://0.0.0.0:9092 \
	-e KAFKA_HEAP_OPTS="-Xms256M -Xmx512m" \
	-v /etc/localtime:/etc/localtime \
	-d wurstmeister/kafka:2.12-2.3.1