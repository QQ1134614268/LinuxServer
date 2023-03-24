
/usr/java/jdk1.8.0_202/bin/java -Djava.ext.dirs=/usr/java/jdk1.8.0_202/jre/lib/ext:/usr/java/jdk1.8.0_202/lib/ext -server -Xms2g -Xmx2g -Xmn1g -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=320m -XX:-OmitStackTraceInFastThrow -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/data/nacos/logs/java_heapdump.hprof -XX:-UseLargePages -Dnacos.member.list= -Xloggc:/data/nacos/logs/nacos_gc.log -verbose:gc -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintGCTimeStamps -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=10 -XX:GCLogFileSize=100M -Dloader.path=/data/nacos/plugins/health,/data/nacos/plugins/cmdb -Dnacos.home=/data/nacos -jar /data/nacos/target/nacos-server.jar --spring.config.additional-location=file:/data/nacos/conf/ --logging.config=/data/nacos/conf/nacos-logback.xml --server.max-http-header-size=524288 nacos.nacos

#nacos： http://44.39.19.14:8878/nacos/index.html  nacos/nacos

ps -ef | grep nacos

netstat -tunlp|grep 7348