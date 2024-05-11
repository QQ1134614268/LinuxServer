#!/usr/bin/env bash
firewall-cmd --list-all # 查看全部
firewall-cmd --list-ports  # 查看开放的端口
firewall-cmd --reload # 重启生效
# systemctl start|stop|disable|enable|state firewalld
#开放 3306, 8000-10000端口
firewall-cmd --permanent --zone=public --add-port=3306/tcp
firewall-cmd --permanent --zone=public --add-port=8000-10000/tcp
#移除
firewall-cmd --permanent --zone=public --remove-port=80/tcp
# 	–zone #作用域
# 	–add-port=80/tcp #添加端口，格式为：端口/通讯协议
# 	–permanent #永久生效，没有此参数重启后失效

# rich-rule
firewall-cmd --permanent    --add-rich-rule='rule family="ipv4" source address="44.39.17.0/8" port port="1-65535" protocol="tcp" accept'
firewall-cmd --permanent --remove-rich-rule='rule family="ipv4" source address="44.39.17.0/8" port port="1-65535" protocol="tcp" accept'
