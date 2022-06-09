#!/usr/bin/env bash
# 使用源码编译, 或者yum 安装
#下载 编译
wget -P /tmp http://download.redis.io/releases/redis-5.0.7.tar.gz
tar -zxvf /tmp/redis-5.0.7.tar.gz -C /usr/local
cd /usr/local/redis-5.0.7
make MALLOC=libc
cd src && make install

# 后台运行 将redis设为守护进程  = 把/usr/local/redis-5.0.7/redis.conf文件中 "daemonize no"  改为 "daemonize yes"
sed -i 's/daemonize no/daemonize yes/g' /usr/local/redis-5.0.7/redis.conf

# 开机启动
mkdir /etc/redis
cp /usr/local/redis-5.0.7/redis.conf /etc/redis/6379.conf
cp /usr/local/redis-5.0.7/utils/redis_init_script /etc/init.d/redisd
systemctl start redis

# 关闭redis服务
# systemctl stop redis
