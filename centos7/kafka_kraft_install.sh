# 最新版本: 学习资料,bug资料,第三方库

# 1. windows
cd D:\dev\kafka_2.13-3.3.1
# 修改 .\config\kraft\server.properties
log.dirs=D:/dev/kafka_2.13-3.3.1/logs/kraft-combined-logs

# 生成存储目录唯一id 3dTO5CPBTbO2EPqSqQR02g
.\bin\windows\kafka-storage.bat random-uuid

# .\bin\windows\kafka-storage.bat format -t <uuid> -c .\config\kraft\server.properties
.\bin\windows\kafka-storage.bat format -t 3dTO5CPBTbO2EPqSqQR02g -c .\config\kraft\server.properties

# 启动
.\bin\windows\kafka-server-start.bat .\config\kraft\server.properties

# 1.2 windows
cd D:\dev\kafka_2.13-3.3.1

# 修改 .\config\server.properties
log.dirs=D:/dev/kafka_2.13-3.3.2/logs/kafka-logs
# .\config\zookeeper.properties
log.dirs=D:/dev/kafka_2.13-3.3.2/logs/zookeeper-logs

.\bin\windows\zookeeper-server-start.bat config\zookeeper.properties
.\bin\windows\kafka-server-start.bat .\config\server.properties

# 2. Linux
wget https://downloads.apache.org/kafka/3.3.1/kafka_2.13-3.3.1.tgz

./bin/kafka-storage.sh random-uuid

# ./bin/kafka-storage.sh format -t <uuid> -c ./config/kraft/server.properties
./bin/kafka-storage.sh format -t 3dTO5CPBTbO2EPqSqQR02g -c ./config/kraft/server.properties

./bin/kafka-server-start.sh ./config/kraft/server.properties
