# todo 寻找工具,监控,日志记录

# 内存: top free
top -p pidxxx
cat /proc/meminfo
# cpu : lscpu top vmstat sar
cat /proc/cpuinfo
# 进程: ps pstree kill pkill pgrep
ps -ef | grep 14045 | grep -V grep | awk "{print $1}"
pstree -V
# 网络: netstat ping, ip addr, telnet, firewall-cmd, iftop(带宽)、nload
netstat -antpl | grep 3306
telnet 159.75.92.195 3306
# 磁盘: df du
du -sh
du -h --max-depth=1 /
du -sh ./* | sort -rn
du -sk ./* | sort -rn # -r 降序; -n选项，来告诉sort，“要以数值来排序”！
