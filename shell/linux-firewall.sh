#!/usr/bin/env bash
# 查看已经开放的端口：
firewall-cmd --list-ports
# systemctl stop firewalld
#开放 22,80,3306, 8000-10000端口 # mysql,redis,nginx,
firewall-cmd --permanent --zone=public --add-port=22/tcp
firewall-cmd --permanent --zone=public --add-port=80/tcp
firewall-cmd --permanent --zone=public --add-port=3306/tcp
firewall-cmd --permanent --zone=public --add-port=8000-10000/tcp
firewall-cmd --reload # 重启firewall
#移除
# firewall-cmd --zone=public --remove-port=80/tcp --permanent

# 	–zone #作用域
# 	–add-port=80/tcp #添加端口，格式为：端口/通讯协议
# 	–permanent #永久生效，没有此参数重启后失效
