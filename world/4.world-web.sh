# web 独立nginx?
# 多个web 独立部署

# eg: java源码,打包部署, 所以使用镜像??

# node 环境编译, nginx代理 | 本地打包??( no )
npm run xxx

echo "# dockerfile
from  nginx:xxx
cp dist xxx
" > xx.dockerfile

echo "# nginx
listen 21001

" > xx.nginx.conf

docker build

docker run
