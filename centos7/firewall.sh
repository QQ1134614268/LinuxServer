#!/usr/bin/env bash
## 测试服务器联通
#ping 159.75.92.195
## 测试服务器端口
#telnet 159.75.92.195 3306

# 查看已经开放的端口：
firewall-cmd --list-ports
# 开启端口
#     firewall-cmd --zone=public --add-port=80/tcp --permanent
# 	–zone #作用域
# 	–add-port=80/tcp #添加端口，格式为：端口/通讯协议
# 	–permanent #永久生效，没有此参数重启后失效

# firewall-cmd --reload #重启firewall
# systemctl stop firewalld.service #停止firewall
# systemctl disable firewalld.service #禁止firewall开机启动
# systemctl enable firewalld.service
# firewall-cmd --state #查看默认防火墙状态（关闭后显示notrunning，开启后显示running）

systemctl start firewalld

firewall-cmd --zone=public --add-port=22/tcp --permanent
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=3306/tcp --permanent
firewall-cmd --zone=public --add-port=8080/tcp --permanent
firewall-cmd --reload

#删除

# firewall-cmd --zone=public --remove-port=80/tcp --permanent
