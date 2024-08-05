# 查找: find locate whereis which
# which: 查找可执行文件; $PATH路径; 返回第一个(-a 全部)
# whereis: 命令、源文件和man文件; $PATH路径,系统目录; (-b 选项，限定只搜索二进制文件)
# locate: 任意文件; 内置的索引数据库查找文件的路径; (新建的文件可能需要一定时间才能加入该索引数据库)(-r 选项通过正则表达式来精确匹配)
# find: 任意文件; 整个文件目录; (-name 选项指定要查找的文件名，支持通配符)
find /path -name "*.log" # 如果不加'', 先解析 *.png 为 a.png b.png ... , b.png识别为路径, 需在 -name前面
find /path -name "*.log" | grep content_xxx
find /path -name "*.log" -maxdepth 1 | wc -l
find /path -name "*.log" -exec grep -r "No" {} \;
find /path -name "*.h" | grep -in "hello"

# 查看: ls ll cat uname
# 编辑: sed vi vim
# 复制移动: cp mv

# 压缩: tar
tar -cvf archive.tar file1 dir1 # 打包为tar -z 压缩为gz
tar -xvf archive.tar -C outDir # 解压

zip -r out.zip file1 dir1 #
unzip -d outDir xxx.zip # -O GBK 指定编码,winRar打包,文件名会改为GBK编码; -o 覆盖; -n 不覆盖; -l 压缩文件内容列表; -q 安静,不输出信息

# tail head
history | tail -n 20 # head -n 20

# 写入: >,>>
# 系统: cd user su chown mkdir reboot
cat /proc/version
uname -a
reboot
shutdown -r now
source /etc/profile
echo $PATH

# 日志
/var/log/syslog
/var/log/messages

# 软件: yum wget curl ssh nginx mysql docker
yum install -y xxx
mysql -uroot -pxxx -e "source /root/xxx.sql"
