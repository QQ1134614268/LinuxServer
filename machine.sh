# shutdown - 建议使用的命令
# shutdown是最常用也是最安全的关机和重启命令，它会在关机之前调用fsck检查磁盘，其中-h和-r是最常用的参数：

# -h：停止系统服务并关机
# -r： 停止系统服务后重启
# -h：停止系统服务并关机
# -r： 停止系统服务后重启

# shutdown -h now --立即关机
# shutdown -h 10:53 --到10:53关机，如果该时间小于当前时间，则到隔天
# shutdown -h +10 --10分钟后自动关机
# shutdown -r now --立即重启
# shutdown -r +30 ‘The System Will Reboot in 30 Mins’ --30分钟后重启并并发送通知给其它在线用户
# shutdown -h now --立即关机
# shutdown -h 10:53 --到10:53关机，如果该时间小于当前时间，则到隔天
# shutdown -h +10 --10分钟后自动关机
# shutdown -r now --立即重启
# shutdown -r +30 ‘The System Will Reboot in 30 Mins’ --30分钟后重启并并发送通知给其它在线用户

shutdown -r now

# 查看磁盘
df -hl
# 查看cpu
top
ps -ef

#!/bin/bash

USER='your_user'
PASSWORD='your_password'
DATABASE='your_database'

echo logging into db ${DATABASE} as ${USER}

mysql -u $USER --password=$PASSWORD --database=$DATABASE

mysql -uxxx -pxxx db名 < xxx/xxx.sql
