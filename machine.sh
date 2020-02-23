# 重启
reboot
shutdown -r now

查找
find
grep
ps -ef | grep python3

/etc/sysconfig/network-scripts

echo 1 > 1.txt
echo date >> 1.txt

# 查看磁盘
df -hl
# 查看cpu
top
ps -ef


# ps -ef | grep "python3" | grep -v grep | awk '{print $2}'
# process_name=$1
# eg: pid=$(ps -ef | grep $process_name | grep '/bin/java' | grep -v grep | awk '{print $2}')
# ps -ef | grep python3
# netstat -ntulp |grep 80
# kill -s 9 1827
# pgrep "python3 /app/world/src/main/python/app.py"
# pkill -f "python3"
# pkill -f "python3 /app/world/src/main/python/app.py"
# pidof python3