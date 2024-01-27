# 查找: find whereis grep awk
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

# 软件: yum wget curl ssh nginx mysql docker
yum install -y xxx
mysql -uroot -pxxx -e "source /root/xxx.sql"
