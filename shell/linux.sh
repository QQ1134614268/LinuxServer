# 进程: ps pstree kill pkill pgrep
ps -ef | grep 14045 | grep -V grep | awk "{print $1}"
pstree -V
# 网络: netstat ping, ip addr, telnet, firewall-cmd, wget curl iftop(带宽) ssh
netstat -antpl | grep 3306
telnet 159.75.92.195 3306
# 磁盘: df du
du -sh
du -h --max-depth=1 /
du -sh ./* | sort -rn
du -sk ./* | sort -rn # -r 降序; -n选项，来告诉sort，“要以数值来排序”！
# 内存: top free
top -p pidxxx
cat /proc/meminfo
# cpu: lscpu top vmstat sar
cat /proc/cpuinfo

#查找: find whereis grep awk
find / -name '*.png' # 如果不加'', 先解析 *.png 为 a.png b.png ... , b.png识别为路径, 需在 -name前面
find / -name file_xxx | grep content_xxx

# 查看: ls ll cat uname
# 编辑: sed vi vim
# 复制移动: cp mv

# 压缩: tar
# 写入: >,>>
# 系统: cd user su chown mkdir reboot
cat /proc/version
uname -a
reboot
shutdown -r now
source /etc/profile
echo $PATH

# 软件: yum nginx mysql docker
yum install -y xxx
mysql -uroot -pxxx -e "source /root/xxx.sql"
