#!/usr/bin/env bash

docker stop nginx &&  docker rm nginx

docker run --name nginx -p 80:80 -p 443:443  \
  -v /etc/nginx/nginx.conf:/etc/nginx/nginx.conf  \
  -v /app:/app  \
  -v /etc/letsencrypt:/etc/letsencrypt  \
  -v /var/log/nginx:/var/log/nginx \
  --privileged \
  --restart=always \
  -d nginx

docker logs -f nginx
