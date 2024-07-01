#!/usr/bin/env bash
systemctl start firewalld
systemctl stop firewalld
systemctl disable firewalld
systemctl enable firewalld
systemctl state firewalld

firewall-cmd --list-all # 查看全部
firewall-cmd --list-ports  # 查看开放的端口
 # 重启生效
firewall-cmd --reload
#开放端口
firewall-cmd --permanent --zone=public --add-port=3306/tcp
firewall-cmd --permanent --zone=public --add-port=20-20000/tcp
#移除端口
firewall-cmd --permanent --zone=public --remove-port=80/tcp
# 	–zone #作用域
# 	–add-port=80/tcp #添加端口，格式为：端口/通讯协议
# 	–permanent #永久生效，没有此参数重启后失效

# rich-rule
firewall-cmd --permanent    --add-rich-rule='rule family="ipv4" source address="44.39.17.0/8" port port="1-65535" protocol="tcp" accept'
firewall-cmd --permanent --remove-rich-rule='rule family="ipv4" source address="44.39.17.0/8" port port="1-65535" protocol="tcp" accept'
