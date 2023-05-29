#创建

bin/kafka-topics.sh --bootstrap-server localhost:9092 --create --partitions 1 --replication-factor 1 --topic test
bin/kafka-topics.sh --bootstrap-server localhost:9092 --delete --topic test
bin/kafka-topics.sh --bootstrap-server localhost:9092 -list

bin/kafka-console-producer.sh --bootstrap-server localhost:9092 --topic test

bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic USER_TOPIC_1 --from-beginning
