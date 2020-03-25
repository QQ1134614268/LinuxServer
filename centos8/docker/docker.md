# 目录挂载 -- 配置文件 数据目录 日志目录

docker search|pull|rmi 镜像名字
docker images
#启动容器 后台模式
docker run -d ubuntu:15.10 /bin/sh -c "while true; do echo hello world; sleep 1; done"

docker ps -a
docker stop|start|restart|rm 容器名|容器id

docker port name| id
docker logs -f  name| id
docker top  name| id
#进入容器
docker exec -it 名 /bin/bash
#导入导出
docker export 容器名|容器id > ubuntu.tar
#本地多一个镜像
cat docker/ubuntu.tar | docker import - test/ubuntu:v1
docker commit -a 'wg' -m 'world_mysql' 名|id 新名:tag
#端口映射
docker run -itd -p port:port 镜像名
#文件挂载
docker run -itd -p port:port -v /宿主机/目录:/容器目录 镜像名
docker cp 容器名:/容器目录/文件名 /宿主机目录/文件名
docker cp /宿主机目录/文件名 容器名:/容器目录/文件名
#容器互联--一个容器提供一个服务 -e 传参
docker run -itd --name mysql9 -p 43306:3306 -v /root/docker/mysql:/var/lib/mysql/  -e MYSQL_ROOT_PASSWORD=123456 --restart=always mysql
docker run -itd --name mysql --link 名:名 mysql

#运行dockerfile,构建镜像
docker build -t 镜像名:tag -f dockerfile .
#查看镜像的 dockerflie
docker inspect 镜像名
