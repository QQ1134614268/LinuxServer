docker pull zookeeper
docker stop zookeeper && docker rm zookeeper
# todo 端口 防火墙 配置 数据挂载 网络通信 账号认证
docker run --name zookeeper -p 2181:2181  --restart always -d zookeeper
