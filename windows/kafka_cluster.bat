:@echo off
start  cmd /k "D:\dev\apache-zookeeper-3.8.0-bin\bin\zkServer.cmd"

start  cmd /k "D:\dev\kafka_2.12-3.1.0\bin\windows\kafka-server-start.bat  D:\dev\kafka_2.12-3.1.0\config\cluster_conf\server.properties"
start  cmd /k "D:\dev\kafka_2.12-3.1.0\bin\windows\kafka-server-start.bat  D:\dev\kafka_2.12-3.1.0\config\cluster_conf\server1.properties"
start  cmd /k "D:\dev\kafka_2.12-3.1.0\bin\windows\kafka-server-start.bat  D:\dev\kafka_2.12-3.1.0\config\cluster_conf\server2.properties"
