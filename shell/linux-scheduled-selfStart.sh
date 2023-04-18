# 1. 配置定时任务: (root用户)
# vim /var/spool/cron/root
#
# 2. 写入执行时间和执行脚本
# * * * * * /root/scheduled_task_test.sh

time3=$(date "+%Y-%m-%d %H:%M:%S")
echo "时间:" $time3 >> /root/scheduled_data.txt


# 开机自启

# /etc/rc.d/rc.local
/xxx/xxx.sh

## linux 开机自启命令
1. /etc/rc.d/rc.local
2. /etc/rc.d/init.d
3. 制作service服务 , systemctl enable xxx.service
