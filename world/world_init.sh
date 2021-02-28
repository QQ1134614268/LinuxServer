#!/usr/bin/env bash
# 下载代码
mkdir -p /app/world_web
git clone  https://gitee.com/biaozhun/world_web.git /app/world_web

pip3.7 install -r /app/world/requirements.txt

cd /app/world/src/
python3.7 /app/world/src/manage.py db upgrade
cd

# 启动服务
nohup python3.7 /app/world/src/app.py &
