#!/bin/bash
#LOG_PATH="/home/ns-coastal/coastal_be/log4j2.xml"

# pkill -f "/bin/bash ./autostart.sh"
# nohup /bin/bash autostart.sh &

#JVM_OPTS="-Duser.timezone=Asia/Shanghai -Xms256m -Xmx800m -Djava.security.egd=file:/dev/./urandom"

#加载环境
source /etc/profile

#是否开启远程调试  生产环境不要开启
ISDEBUG=0

#项目根目录
projects_home=/home/ns-coastal/coastal_be
#各项目目录
projects=(xc-gateway xc-auth xc-logs xc-system xc-admin xc-file xc-archive xc-alarm xc-analyze xc-search xc-etl xc-ship xc-websocket xc-job xc-gb28181 xc-graph xc-face-recognition xc-monitor xc-gen xc-test)
#调试端口
projectsIp=(14109 14110 14111 14112 14113 14114 14115 14116 14117 14118 14119 14120 14122 14123 14124 14125 14126 14127 14128 14129)
#内存倍数
times=(1 1 1 1 1 1 1 1 1 1 1 1 8 1 1 1 1 1 1 1)
#项目数量
num=20

#检测服务，不存在的，则重启
function main()
{
    #检测脚本启动时，先休眠1分钟，等待其他组件启动
    echo "检测脚本启动时，先休眠1分钟，等待其他组件启动"
    sleep 60    

    while [ 1 ]
    do
		for i in $(seq 1 $num)
		do
			#统计该程序的启动的进程数量
			count=`ps -ef |grep java|grep ${projects[$i-1]}|grep -v grep|wc -l`
			if [ $count == 0 ];then
				echo -ne ${projects[$i-1]} "服务没有启动，准备自启动...$(date +%F%n%T)\n"
					 
				#停止
				stopOne ${projects[$i-1]}

				#启动
				startOne ${projects[$i-1]} ${projectsIp[$i-1]} ${times[$i-1]}
			fi
		done
       
        #休眠2分钟
        echo "完成服务检测，休眠2分钟"
        sleep 120
    done
}

#停止单个服务操作
function stopOne()
{
    #检查是否有进程存在
    #count=`ps -ef |grep java|grep $projects_home/$1|grep -v grep|wc -l`
    count=`ps -ef |grep java|grep $1|grep -v grep|wc -l`    

    #如果有进程，则删掉
    while [ $count != 0 ]
    do
        #获取该程序的进程id
        #boot_id=`ps -ef |grep java|grep $projects_home/$1|grep -v grep|awk '{print $2}'`
        boot_id=`ps -ef |grep java|grep $1|grep -v grep|awk '{print $2}'`

        #杀掉该程序的进程
        kill -9 $boot_id
        
        #再次检查是否还有进程存在
        #count=`ps -ef |grep java|grep $projects_home/$1|grep -v grep|wc -l`
        count=`ps -ef |grep java|grep $1|grep -v grep|wc -l`
        
        echo "关闭$1成功"
        sleep 3
    done
}

#启动单个服务操作
function startOne()
{
    DEBUG_OPTS=""
    if [ $ISDEBUG == 1 ];
    then
		echo "启动$1,远程调试端口号:$2"
		DEBUG_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=$2"
    fi
		
	#判断日志目录是否存在，不存在则创建
    logdir=$projects_home/logs/$1
    if [ ! -d $logdir ];
    then
		mkdir -p $logdir
    fi
		
    #启动
    java -jar -server  -Dname=$1 -Duser.timezone=Asia/Shanghai -Xms$[$3*1024]m -Xmx$[$3*1024]m -Djava.security.egd=file:/dev/./urandom $DEBUG_OPTS -DprojectName=$1 $projects_home/$1/$1.jar  > $projects_home/logs/$1/$1.log 2>&1 &
    echo "启动$1成功1--$(date +%F%n%T)"
}

#启动检测
main
