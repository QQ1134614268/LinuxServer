:@echo off

start  cmd /k "D:\dev\apache-zookeeper-3.8.0-bin\bin\zkServer.cmd"
timeout /nobreak /t 3
start  cmd /k "D: && cd D:\dev\kafka_2.12-3.1.0 && bin\windows\kafka-server-start.bat  config\server.properties"
