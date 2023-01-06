# note: 命令被替换
# 开机启动项
# 定时任务
# 安全策略
# 进程
pstree
ps -ejH
ps -eLf
ps -ef # 分析进程
top # 分析系统资源, 木马高占用资源
top -b -n1 | mail -s '证书记录' 1134614268@qq.com
netstat -anltp

cat /etc/passwd # 查看用户
  #root:x:0:0:root:/root:/bin/bash
  # account:password:UID:GID:GECOS:directory:shell （帐号:密码:用户ID:组ID:一般的信息:目录:shell）
  #account   使用者在系统中的名字，它不能包含大写字母
  #password  加密的用户密码，或者星号
  #UID       用户 ID 数
  #GID       用户的主要组 ID 数
  #GECOS     这字段是可选的，通常为了存放信息目的而设的
  #directory 用户的 $HOME 目录.
  #shell     登录时运行的程序（如果空的，使用 /bin/sh).  如果设为不存在的执行（程序），用户不能通过 login(1) 登录.

cat /etc/passwd | grep -v /sbin/nologin | cut -d : -f 1 # 分析
passwd xx # 修改密码

crontab -l # crontab 创建的任务
# 所有用户定时任务
for i in `cat /etc/passwd|awk -F':' '{print $1}'`; do     crontab -u ${i} -l; done

#last：显示系统用户最近的登录信息
#lastb：显示错误的尝试登录信息
#lastlog：显示系统所有的用户最近的登录信息

#https://www.cnblogs.com/diantong/p/10706418.html
/var/log/wtmp	# 是一个二进制文件，记录每个用户的登录次数和持续时间等信息，可以用last命令查看其中内容
/var/log/secure # 一般信息和系统信息
# who /var/log/wtmp将报告自从wtmp文件创建或删改以来的每一次登录。
