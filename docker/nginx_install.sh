#!/usr/bin/env bash
docker run -d --name nginx \
  -p 80:80 \
  -p 443:443  \
  -v /var/log/nginx:/var/log/nginx \
  nginx
