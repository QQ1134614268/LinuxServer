#!/usr/bin/env bash
ping 159.75.92.195
telnet 159.75.92.195 80

# 重启
reboot
shutdown -r now

cat /proc/version
uname -a

查找
find
grep
netstat -tunlp|grep 3306

资源使用--cpu 内存 磁盘 带宽
top -p id
ps aux --sort -rss
ps -ef
ps -ef | grep python3
pgrep -f "python3.7"
netstat -nap|grep 3306
netstat -tunlp|grep 3306

df -hl
iftop 带宽
# ps -ef | grep "python3" | grep -v grep | awk '{print $2}'
# process_name=$1
# eg: pid=$(ps -ef | grep $process_name | grep '/bin/java' | grep -v grep | awk '{print $2}')
# kill -s 9 1827
# pgrep "python3 /app/world/src/main/python/app.py"
# pkill -f "python3 /app/world/src/main/python/app.py"
# pidof python3


