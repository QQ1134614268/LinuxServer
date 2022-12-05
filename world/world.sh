# docker环境
# git
# mysql
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

#每次更新--重新build,install依赖 -- 使用挂载模式 ?? 细小的优化,定制化?