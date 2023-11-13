#1. 常用命令:
#进程: ps pstree kill pkill pgrep
ps -ef
ps -ef | grep 14045 | grep -V grep | awk "{print $1}"
pstree -V
#查找: whereis grep awk ls ll cat uname

#复制移动: cp mv

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
du -sh
du -h --max-depth=1 /
du -sh ./* | sort -rn
du -sk ./* | sort -rn # -r 降序; -n选项，来告诉sort，“要以数值来排序”！

#内存 cpu: top free
top -p pidxxx

#查找: find whereis grep awk
find / -name *.png
find / -name file_xxx | grep content_xxx

#软件: yum nginx mysql docker
yum install -y xxx
mysql -uroot -pxxx -e "source /root/xxx.sql"

#查看: ls ll cat uname
#ls -a       //列出文件下所有的文件
#ls -l       //列出文件的详细信息，如创建者，创建时间，文件的读写权限列表等等
#ls -F       //在每一个文件的末尾加上一个字符说明该文件的类型
#ls -s       //在每个文件的后面打印出文件的大小
#ls -t       //按时间进行文件的排序
#ls -A       //列出除了”.”和”..”以外的文件
#ls -R       //将目录下所有的子目录的文件都列出来，相当于我们编程中的“递归”实现
#ls -L       //列出文件的链接名
#ls -S       //以文件的大小进行排序

#编辑: sed
#复制移动: cp mv
# /usr 与 /usr/ 没区别
# /usr/*  文件夹下文件
cp 目录不在时  cp -r /source    /dist
cp 目录存在时  cp -r /source/*  /dist

#压缩: tar
#写入: >,>>
#系统: cd user su chown mkdir reboot
cat /proc/version
uname -a
reboot
shutdown -r now
source /etc/profile

### 文件上传下载
ftpput -u root -p xxx -P 50221 44.39.19.14
scp
sshpass -p "password" scp -r -o StrictHostKeyChecking=no /root/.jenkins root@44.39.19.14:/root/.jenkins # 一键 , 无交互式
sftp
