# web 独立nginx?
# 多个web 独立部署

# eg: java源码,打包部署, 所以使用镜像??

# node 环境编译, nginx代理 | 本地打包??( no )
docker pull nginx

npm run xxx

echo "# dockerfile
FROM nginx
COPY dist/  /usr/share/nginx/html/
" > xx.dockerfile

docker build -t world-web:1.0 .
docker run --name world-web -d -p 9020:80 world-web:1.0

#
echo "# nginx
listen 21001
" > xx.nginx.conf

docker run --name nginx -d -p 9020:80 nginx
