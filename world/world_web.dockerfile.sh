# 如果没有安装docker, 安装docker

# 如果没有git 安装git

cd
# 如果没有克隆,就克隆

# 拉取最新代码
cd  world && git pull
cd world/web
npm build dev
copy /app/world_web /home/world_web
docker bulid world_web.dockerfile
docker build -t world_web:1.0.1 -f world_web.dockerfile .

docker run -it --name world_web \
  -v /opt/world_web/data/upload /home/world_web/data/upload \
  -v /opt/world_web/data/log /home/world_web/data/log \
  -d world_web:1.0.1
