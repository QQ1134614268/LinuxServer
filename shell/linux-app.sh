# mysql  查看mysql连接情况(进入mysql) show processlist
mysql -uroot -pxxx -e "source /root/xxx.sql"

SELECT * from information_schema.processlist;

# Python
python3 -m venv fastapi_test
/usr/local/python3.7/bin/pyinstaller -p /root/PythonTemplate/src --noconfirm -F main.py

# kafka
bin/kafka-topics.sh --bootstrap-server localhost:9092 --create --partitions 1 --replication-factor 1 --topic test
bin/kafka-topics.sh --bootstrap-server localhost:9092 --delete --topic test
bin/kafka-topics.sh --bootstrap-server localhost:9092 -list

bin/kafka-console-producer.sh --bootstrap-server localhost:9092 --topic test

bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic USER_TOPIC_1 --from-beginning

# git
git log -n 1 --date=format:'%Y-%m-%d %H:%M:%S' --pretty=format:%cd path/to/dir
#最后一次提交时间
git show --pretty=format:"%ci %cr" | head -1
#查看最后一次提交记录的修改文件信息
git show --raw
