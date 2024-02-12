#!/usr/bin/env bash
# 1. yum安装
yun install -y nginx
systemctl enable nginx
nginx -c /etc/nginx/nginx.conf

# 2. Nginx的源码 复杂安装
#下载 编译
cd /tmp
wget http://nginx.org/download/nginx-1.9.9.tar.gz
tar -zxvf nginx-1.9.9.tar.gz
cd nginx-1.9.9
./configure --prefix=/usr/local/nginx
make && make install

echo 'export PATH=/usr/local/nginx/sbin:$PATH'>> /etc/profile
source /etc/profile

sed -i 's/listen       80;/listen       8080;/g' /usr/local/nginx/conf/nginx.conf

# 设置nginx 启动的配置文件
/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf
nginx

# 开机自启
cd /lib/systemd/system/
echo "
[Unit]
Description=nginx
After=network.target

[Service]
Type=forking
ExecStart=/usr/local/nginx/sbin/nginx
ExecReload=/usr/local/nginx/sbin/nginx reload
ExecStop=/usr/local/nginx/sbin/nginx quit
PrivateTmp=true

[Install]
WantedBy=multi-user.target" > /lib/systemd/system/nginx.service
systemctl enable nginx.service
