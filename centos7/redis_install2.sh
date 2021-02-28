#!/usr/bin/env bash
# 使用yum 安装,或者源码编译

# 最新版本 centos7
#yum install -y http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
#yum -y --enablerepo=remi install redis
yum -y install redis
#redis-cli --version

#启动
service redis start

# service redis restart
#开机启动
systemctl start redis
# /etc/redis.conf
# bind 127.0.0.1
# requirepass 123456
