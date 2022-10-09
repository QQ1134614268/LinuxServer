# 如果没有安装docker, 安装docker

# 如果没有git 安装git

cd
# 如果没有克隆,就克隆

# 拉取最新代码
cd  world && git pull
docker bulid world.dockerfile
docker build -t world:1.0.1 -f world.dockerfile .

docker run -it --name world \
  -v /opt/world/data/upload /home/world/data/upload \
  -v /opt/world/data/log /home/world/data/log \
  -d world:1.0.1
