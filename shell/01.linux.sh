#1. 常用命令:
#进程: ps pstree kill pkill pgrep
ps -ef
ps -ef | grep 14045 | grep -V grep | awk "{print $1}"
pstree -V
#查找: find whereis grep awk ls ll cat uname
find / -name *.png | grep content_xxx

#复制移动: cp mv
# /usr 与 /usr/ 没区别
# /usr/*  文件夹下文件
cp -r /source    /dist # cp 目录不在时
cp -r /source/*  /dist # cp 目录存在时

#系统: cd user su chown mkdir reboot tar >,>>
cat /proc/version
uname -a
reboot
shutdown -r now
source /etc/profile

#网络: netstat ping, ip addr, telnet, firewall-cmd, wget curl iftop(带宽) ssh
netstat -tunlp|grep 3306
netstat -anp|grep 3306

telnet 159.75.92.195 3306

#磁盘: df du
du -h --max-depth=1 /

#内存 cpu: top free
top -p pidxxx

#软件: yum nginx mysql docker

### 文件上传下载
ftpput -u root -p xxx -P 50221 44.39.19.14
scp
sshpass
sftp
