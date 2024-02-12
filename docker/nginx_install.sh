#!/usr/bin/env bash

# https证书自动续期, certbot需要本地安装nginx
docker run -d --name nginx \
  -p 80:80 \
  -p 443:443    \
  -v /etc/nginx/nginx.conf:/etc/nginx/nginx.conf    \
  -v /var/log/nginx:/var/log/nginx   \
  --privileged   \
  --restart=always nginx