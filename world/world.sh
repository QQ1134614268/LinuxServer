# docker环境
# git
# mysql 优化内存
# nginx代理转发
# redis
# nodejs编译

# 1. docker环境
# 方案1: 使用dockerfile,现场拉代码,打包, 使用手动命令
# 方案2: 使用sh, dockerfile, git; 自动化部署
# 方案3: 携带(下载),直接执行docker命令

# docker,git,网络
rm -rf world
git clone https://gitee.com/biaozhun/world.git

# 代码同级目录
cp world/world.dockerfile world.dockerfile

docker bulid world.dockerfile
docker build -t world:1.0.1 -f world.dockerfile .
docker run -it --name world \
  -v /opt/world/data/upload /home/world/data/upload \
  -v /opt/world/data/log /home/world/data/log \
  -d world:1.0.1

# 一键打包部署 https://blog.csdn.net/qq_29170455/article/details/125558065

#每次更新--重新build,install依赖 -- 使用挂载模式 ?? 细小的优化,定制化?
# 官方软件-- 稳定, 安装迅速, 意外情况少,可脱离docker
# sdk工具包,稳定,可脱离docker
# 代码不稳定,反复升级,bug修复, 依赖环境, 适合docker容器化

# docker 以镜像为主, 非临时build镜像

# 要不要nginx; nginx提供转发,代理文件服务器, 可删除
# 挂载资源目录 data
# 配置文件,环境变量读取功能
