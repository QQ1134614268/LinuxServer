#端口映射
docker run -itd -p port:port 镜像名
#文件挂载
docker run -itd -p port:port -v /宿主机/目录:/容器目录 镜像名
#容器互联--一个容器提供一个服务 -e 传参
docker run -itd --name mysql9 -p 43306:3306 -v /var/lib/mysql:/var/lib/mysql  -e MYSQL_ROOT_PASSWORD=123456 --restart=always mysql
docker run -itd --name mysql --link 名:名 mysql
#启动容器 后台模式 -d 有时容器会直接退出 -itd不会
docker run -itd ubuntu:15.10 /bin/sh -c "while true; do echo hello world; sleep 1; done"
docker run --rm -it --entrypoint=/bin/bash image-name # docker run --rm -it /bin/bash image-name
# 进入容器
docker exec -u root -it 容器id /bin/bash

# 常用命令
docker ps -a
docker ps -a --no-trunc | grep container_name   # 通过docker --no-trunc参数来详细展示容器运行命令
docker stop|start|restart|rm 容器名|容器id
docker images
docker search|pull|rmi 镜像名字

docker cp 容器名:文件完整路径 本地路径 #容器内文件copy到本地
docker cp 容器名:/容器目录/文件名 /宿主机目录/文件名
docker cp /宿主机目录/文件名 容器名:/容器目录/文件名

# docker debug 查看镜像的 dockerflie
docker logs -f  name| id # 查看镜像日志
docker port name| id # 查看镜像端口
docker top  name| id
docker inspect 镜像名 # 分析镜像
docker inspect <container_name>   # 可以是container_name或者container_id
docker inspect --format='{{.NetworkSettings.Networks.bridge.IPAddress}}' <container_name>      # format是go语言的template，还有其他的用法

docker history <镜像名> # 查看每个层的大小

#运行dockerfile,构建镜像
docker build -t 镜像名:tag -f dockerfile .
docker commit 容器id 镜像名称
docker commit -a 'wg' -m 'world_mysql' 名|id 新名:tag

#导入导出 本地多一个镜像
docker export 容器名|容器id > ubuntu.tar
docker import - test/ubuntu:v1