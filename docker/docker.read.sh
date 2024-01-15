#启动容器 后台模式 -d 有时容器会直接退出 -itd不会
docker run -itd ubuntu:15.10 /bin/sh -c "while true; do echo hello world; sleep 1; done"
#端口映射
docker run -d -p port:port 镜像名
#文件挂载 覆盖掉容器目录
docker run -d -v /宿主机/目录:/容器目录 镜像名
# -e 传参
docker run -d --name mysql9 -e MYSQL_ROOT_PASSWORD=123456 --restart=always mysql
# 进入容器
docker exec -u root -it 容器id /bin/bash

# 常用命令
docker ps -a
docker ps -a --no-trunc | grep container_name   # 通过docker --no-trunc参数来详细展示容器运行命令
docker stop|start|restart|rm 容器名|容器id
docker images
docker search|pull|rmi 镜像名

docker cp 容器名:文件完整路径 本地路径 # copy 容器 到 本地
docker cp 本地路径 容器名:文件完整路径 # copy 本地 到 容器

# docker debug 查看镜像的
docker logs -f 镜像名|id # 查看镜像日志
docker port 镜像名|id # 查看镜像端口
docker top  镜像名|id # 查看系统信息
docker inspect 镜像名|id # 分析镜像 可以是container_name或者container_id
docker inspect --format='{{.NetworkSettings.Networks.bridge.IPAddress}}' <container_name>      # format是go语言的template，还有其他的用法

docker history <镜像名> # 查看每个层的大小

#运行dockerfile,构建镜像
docker build -t 镜像名:tag -f dockerfile .
docker commit 容器id 镜像名
docker commit -a 'wg' -m 'world_mysql' 镜像名|id 新名:tag

#导入导出 本地多一个镜像
docker export 容器名|容器id > ubuntu.tar
docker import - test/ubuntu:v1

# network
docker network create -d bridge test-net
docker run -d --name test1 --network test-net ubuntu /bin/bash
