# win
netstat -ano | findstr 3366
tasklist | findstr "20988"
taskkill /f /t /im "进程id或者进程名称"  # 结束进程

# D:\dev\kafka_2.13-3.3.1\bin\windows\kafka-server-start.bat D:\dev\kafka_2.13-3.3.1\config\server.properties
