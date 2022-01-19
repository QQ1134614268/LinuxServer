#!/usr/bin/env bash
find / -name *.png
grep "123" info.log

ping 159.75.92.195
telnet 159.75.92.195 80

netstat -tunlp|grep 3306
netstat -nap|grep 3306
ps -ef
ps -ef | grep python3
ps -ef | grep 14045
ps aux --sort -rss

pstree -V
pgrep -f "python3.7"

# 重启
reboot
shutdown -r now

cat /proc/version
uname -a

# 资源使用--cpu
top

#内存
top -p id
free

# 磁盘
df -hl

# 带宽
iftop
# ps -ef | grep "python3" | grep -v grep | awk '{print $2}'
# process_name=$1
# eg: pid=$(ps -ef | grep $process_name | grep '/bin/java' | grep -v grep | awk '{print $2}')
kill -s 9 1827

pidof python3
