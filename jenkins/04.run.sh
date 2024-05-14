#!/bin/bash
#LOG_PATH="/home/ns-coastal/coastal_be/log4j2.xml"

#JVM_OPTS="-Duser.timezone=Asia/Shanghai -Xms512m -Xmx1000m -Djava.security.egd=file:/dev/./urandom"

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

function menu() {
	clear
	echo "=============================="
	if [ $ISDEBUG == 1 ]; then
		echo "======调试模式已经打开========"
	fi
	echo -ne "1:\t全部重启$date\n"
	echo -ne "2:\t全部关闭\n"
	echo -ne "3:\t启动单个程序\n"
	echo -ne "4:\t关闭单个程序\n"
	echo -ne "5:\t查看远程调试端口\n"
	echo -ne "q:\texit\n"
	echo "=============================="
	echo -en "请输入操作命令:\n"
	read option
}

function menu3() {
	clear
	echo "=============================="
	for i in $(seq 1 $num); do
		echo -ne "$i:\t${projects[$i - 1]}\n"
	done
	echo -ne "q:\texit\n"
	echo "=============================="
	echo -en "input any key to continue:\n"
	read option
}

function main() {
	while [ 1 ]; do

		case $option in
		1)
			echo '启动所有程序'
			startAll
			echo '启动所有程序成功'
			echo '按任意键返回主菜单'
			read -n 1 fff
			menu
			;;

		2)
			echo '关闭所有程序'
			stopAll
			echo '关闭所有程序成功'
			echo '按任意键返回主菜单'
			read 1 fff
			menu
			;;
		3)
			menu3
			main2
			break
			;;
		4)
			menu3
			main3
			break
			;;
		5)
			main4
			break
			;;
		'q')
			exit 0
			;;
		*)
			echo "输入错误"
			exit 0
			;;
		esac
	done
}

function returnToMenu() {
	echo '按任意键返回主菜单'
	read 1 fff
	menu
	main
}

#启动或重新
function main2() {
	if [[ $option -ge 1 && $option -le $num ]]; then #数字
		#停止
		stopOne ${projects[$option - 1]}

		#启动
		startOne ${projects[$option - 1]} ${projectsIp[$option - 1]} ${times[$i - 1]}

		#返回菜单
		returnToMenu
	elif [ $option == 'q' ]; then #退出
		exit 0
	else #其他重新输入
		echo "输入错误，重新输入:"
		read option
		main2
	fi
}

#停止
function main3() {
	if [[ $option -ge 1 && $option -le $num ]]; then #停止指定服务
		#停止
		stopOne ${projects[$option - 1]}

		#返回
		returnToMenu
	elif [ $option == 'q' ]; then #退出
		exit 0
	else #其他重新输入
		echo "输入错误，重新输入:"
		read option
		main2
	fi
}

#列出服务
function main4() {
	for i in $(seq 1 $num); do
		echo -ne ${projects[$i - 1]} "\t" ${projectsIp[$i - 1]} "\n"
	done
	echo '按任意键返回主菜单'
	read 1 fff
	menu
}

#停止所有服务
function stopAll() {
	for i in $(seq 1 $num); do
		#停止
		stopOne ${projects[$i - 1]}
	done
	returnToMenu
}

#停止单个服务操作
function stopOne() {
	#检查是否有进程存在
	#count=`ps -ef |grep java|grep $projects_home/$1|grep -v grep|wc -l`
	count=$(ps -ef | grep java | grep $1 | grep -v grep | wc -l)

	#如果有进程，则删掉
	while [ $count != 0 ]; do
		#获取该程序的进程id
		#boot_id=`ps -ef |grep java|grep $projects_home/$1|grep -v grep|awk '{print $2}'`
		boot_id=$(ps -ef | grep java | grep $1 | grep -v grep | awk '{print $2}')

		#杀掉该程序的进程
		kill -9 $boot_id

		#再次检查是否还有进程存在
		#count=`ps -ef |grep java|grep $projects_home/$1|grep -v grep|wc -l`
		count=$(ps -ef | grep java | grep $1 | grep -v grep | wc -l)

		echo "关闭$1成功"
		sleep 3
	done
}

#启动或重启所有服务
function startAll() {
	for i in $(seq 1 $num); do
		#停止
		stopOne ${projects[$i - 1]}

		#启动
		startOne ${projects[$i - 1]} ${projectsIp[$i - 1]} ${times[$i - 1]}
	done
	returnToMenu
}

#启动单个服务操作
function startOne() {
	echo "正在启动 $1 ......"
	#调试
	DEBUG_OPTS=""
	if [ $ISDEBUG == 1 ]; then
		echo "启动$1,远程调试端口号:$2"
		DEBUG_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=$2"
	fi

	#判断日志目录是否存在，不存在则创建
	logdir=$projects_home/logs/$1
	if [ ! -d $logdir ]; then
		mkdir -p $logdir
	fi

	#启动
	java -jar -server -Dname=$1 -Duser.timezone=Asia/Shanghai -Xms$(($3 * 1024))m -Xmx$(($3 * 1024))m -Djava.security.egd=file:/dev/./urandom $DEBUG_OPTS -DprojectName=$1 $projects_home/$1/$1.jar >$projects_home/logs/$1/$1.log 2>&1 &
	echo "启动$1成功1---$(date +%F%n%T)"
}

#显示菜单
menu

#等待输入操作
main
