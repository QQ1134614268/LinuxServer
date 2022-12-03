#1. 常用命令:
#进程: ps pstree kill
ps -ef
ps -ef | grep python3
ps -ef | grep 14045
pstree -V
#网络: netstat ping, ip addr, telnet, firewall-cmd, wget curl iftop(带宽) ssh
netstat -tunlp|grep 3306
netstat -nap|grep 3306
telnet 159.75.92.195 3306

#磁盘: df du
#内存 cpu: top free
top -p pidxxx

#查找: find whereis grep awk
find / -name *.png
find / -name file_xxx | grep content_xxx

#软件: yum nginx mysql docker
yum install -y xxx
mysql -uroot -pxxx -e "source /root/xxx.sql"

#查看: ls ll cat uname
#编辑: sed
#复制移动: cv mv
#压缩: tar
#写入: >,>>
#系统: cd user su chown mkdir reboot
cat /proc/version
uname -a
reboot
shutdown -r now
source /etc/profile

