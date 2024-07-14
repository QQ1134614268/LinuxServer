#  --------------------------windows kraft模式--------------------------------
cd D:\dev\kafka_2.13-3.6.2
# 1.1 修改 .\config\kraft\server.properties
log.dirs=D:/dev/kafka_2.13-3.6.2/logs/kraft-combined-logs
# 1.2 生成存储目录
#.\bin\windows\kafka-storage.bat random-uuid
# .\bin\windows\kafka-storage.bat format -t <uuid> -c .\config\kraft\server.properties
.\bin\windows\kafka-storage.bat format -t 3dTO5CPBTbO2EPqSqQR02g -c .\config\kraft\server.properties
# 1.3 启动
.\bin\windows\kafka-server-start.bat .\config\kraft\server.properties


#  --------------------------Linux kraft模式--------------------------------
wget https://downloads.apache.org/kafka/3.6.2/kafka_2.13-3.6.2.tgz

# ./bin/kafka-storage.sh random-uuid
# ./bin/kafka-storage.sh format -t <uuid> -c ./config/kraft/server.properties
./bin/kafka-storage.sh format -t 3dTO5CPBTbO2EPqSqQR02g -c ./config/kraft/server.properties
# 启动
./bin/kafka-server-start.sh ./config/kraft/server.properties
