# 查找: find locate whereis which
# which: 查找可执行文件; $PATH路径; 返回第一个(-a 全部)
# whereis: 命令、源文件和man文件; $PATH路径,系统目录; (-b 选项，限定只搜索二进制文件)
# locate: 任意文件; 内置的索引数据库查找文件的路径; (新建的文件可能需要一定时间才能加入该索引数据库)(-r 选项通过正则表达式来精确匹配)
# find: 任意文件; 整个文件目录; (-name 选项指定要查找的文件名，支持通配符)
find / -name '*.png' # 如果不加'', 先解析 *.png 为 a.png b.png ... , b.png识别为路径, 需在 -name前面
find / -name file_xxx | grep content_xxx

# 管道 连用
cp $(find / -type f -name '*.err.log') /outDir
find /var/log/redis/ -name '*' -exec grep -r "No" {} \;
find /PATH -name "*.h" | xargs grep -in "helloworld"

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
