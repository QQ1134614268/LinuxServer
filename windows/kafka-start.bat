:@echo off

start cmd /k "D:\dev\kafka_2.13-3.3.1\bin\windows\zookeeper-server-start.bat D:\dev\kafka_2.13-3.3.1\config\zookeeper.properties"

TIMEOUT /T 10
start cmd /k "D:\dev\kafka_2.13-3.3.1\bin\windows\kafka-server-start.bat D:\dev\kafka_2.13-3.3.1\config\server.properties"
