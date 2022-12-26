echo "# 先编译
FROM node:14.15.0-slim AS myBuildImg
# 添加源码
# RUN echo '开始添加源码'
COPY . /root/web
# RUN cd /root/web
WORKDIR /root/web
# RUN npm -g install npm@7.19.1
RUN npm install --force
RUN npm run build

# 部署
FROM nginx:1.23.3
#copy jar from the first stage
COPY --from=myBuildImg /root/web/dist /usr/share/nginx/html/
CMD nginx -g 'daemon off;'" > web.dockerfile

docker build -t web:1.0 -f web.dockerfile world/web/dist

# 配置文件
docker run -itd --name web-world -p 9020:80 web:1.0
