# systemctl 兼容 service
systemctl start 服务名
systemctl stop 服务名
systemctl restart 服务名

#设置服务开机自启
systemctl enable 服务名
#禁止服务开机自启
systemctl disable 服务名
#重新加载服务配置文件
systemctl reload 服务名
#是否正在运行
systemctl is-active 服务名
#是否为开机自启
systemctl is-enabled 服务名
#查看所有服务的状态
systemctl list-units --type=service
#查看服务的日志
systemctl status 服务名 -l
journalctl -u 服务名
#显示服务的依赖关系
systemctl list-dependencies 服务名


