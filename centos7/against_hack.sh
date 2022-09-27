#进程
pstree
ps -ejH

top -b -n1 | mail -s '证书记录' 1134614268@qq.com

ps -eLf
ps axms

@daily xx

cat /etc/passwd # 查看用户
  #account:password:UID:GID:GECOS:directory:shell （帐号:密码:用户ID:组ID:一般的信息:目录:shell）
  #root:x:0:0:root:/root:/bin/bash
  #account   使用者在系统中的名字，它不能包含大写字母
  #password  加密的用户密码，或者星号
  #UID       用户 ID 数
  #GID       用户的主要组 ID 数
  #GECOS     这字段是可选的，通常为了存放信息目的而设的
  #directory 用户的 $HOME 目录.
  #shell     登录时运行的程序（如果空的，使用 /bin/sh).  如果设为不存在的执行（程序），用户不能通过 login(1) 登录.

# 所有用户定时任务
for i in `cat /etc/passwd|awk -F':' '{print $1}'`; do     crontab -u ${i} -l; done

cat /etc/passwd | grep -v /sbin/nologin | cut -d : -f 1 # 分析
crontab -l # crontab 创建的任务
cat /var/log/secure # 一般信息和系统信息
ps -ef # 分析进程
top # 分析系统资源, 木马高占用资源
who am i # 当前用户
last
#/var/log/其他日志说明：/var/log/message  一般信息和系统信息/var/log/secure  登陆信息/var/log/maillog  mail记录/var/log/utmp
#/var/log/wtmp登陆记录信息(last命令即读取此日志)

lastlog
lastb
#和last命令功能完全相同，只不过它默认读取的是/var/log/btmp文件的信息。当然也可以通过last -f参数指定读取文件，可以是/var/log/btmp、/var/run/utmp

#https://www.cnblogs.com/diantong/p/10706418.html

# ls -lrt /usr/bin/python3.7
passwd xx # 修改密码
netstat -ltnp
# 进阶
#SELinux

# who /var/log/wtmp将报告自从wtmp文件创建或删改以来的每一次登录。
# ls -Slh /app/world/data/upload_file
# tar -zcvf /root/upload_file.tar.gz /app/world/data/upload_file/
# note: 命令被替换
# 开机启动项
# 定时任务
# 安全策略