#!/usr/bin/env bash

# 添加开机自启
# 1. 启动脚本
echo "python3.7 /app/world/src/app.py &
" >  /etc/systemd/system/world_start.sh

# 2. 执行权限
chmod 777  /etc/systemd/system/world_start.sh

# 3. service服务脚本
echo "#  参考: https://www.cnblogs.com/q149072205/p/11541693.html
[Uint]
Description=world auto start

[Service]
ExecStart=/bin/sh /etc/systemd/system/world_start.sh

[Install]
WantedBy=multi-user.target
" > /etc/systemd/system/world_start.service

# 4. 开机自启服务
systemctl enable world_start.service
