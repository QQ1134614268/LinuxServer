# 启动容器 后台模式 -d 有时容器会直接退出 -itd不会, 进入start失败的容器?
docker run -itd alpine:3.14 /bin/sh -c "while true; do echo hello world; sleep 1; done"
# 端口映射; 0.0.0.0:3306:3306 只监听ipv4; :::3306:3306 只监听ipv6; 3306:3306/udp 只有udp端口
docker run -d -p port:port 镜像名
# 文件挂载 覆盖掉容器目录
docker run -d -v /宿主机/目录:/容器目录 镜像名
# -e 传参
docker run -d --name mysql -e MYSQL_ROOT_PASSWORD=123456 --restart=always mysql:8.0.19
# 注意事项: 挂载文件权限( 配置文件 日志 运行数据), 安全https(用户账号密码), 端口 网络, 重启策略

# 进入容器
docker exec -u root -it 容器id /bin/bash

# 镜像
docker images
docker search --limit 10 --no-trunc \
	-f stars=1 \
	-f is-official=true \
	"alpine maven" # 或者关系
docker pull provectuslabs/kafka-ui
docker pull mirror.ccs.tencentyun.com/provectuslabs/kafka-ui
docker rmi 镜像名|id
# 容器
docker stop|start|restart|rm 容器名|容器id

docker cp 容器名:文件完整路径 本地路径 # copy 容器 到 本地, 支持退出的容器
docker cp 本地路径 容器名:文件完整路径 # copy 本地 到 容器

# docker debug 查看镜像的
docker ps -a
docker ps -a --no-trunc | grep container_name   # 通过docker --no-trunc参数来详细展示容器运行命令
docker logs -f 镜像名|id # 查看镜像日志
docker port 镜像名|id # 查看镜像端口
docker top  镜像名|id # 查看系统信息
docker info # 查看docker信息, 镜像源...
docker history 镜像名|id # 查看每个层的大小
docker inspect 镜像名|id # 分析镜像 可以是container_name或者container_id
docker inspect --format='{{.NetworkSettings.Networks.bridge.IPAddress}}' <container_name>      # format是go语言的template，还有其他的用法

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

# dockerfile多阶段, 查看,运行第一阶段容器
#1. 将第一阶段作为一个单独的Dockerfile，并构建这个镜像。这样你就可以直接运行这个镜像来查看第一阶段的结果。
#2. 在Dockerfile中，虽然你不能直接运行一个阶段，但你可以为每个阶段指定一个标签，并使用这些标签来保存中间镜像。然后，你可以基于这些中间镜像来运行容器。
