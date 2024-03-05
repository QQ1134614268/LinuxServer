# 官网: https://portal.portainer.io/knowledge/getting-started
# 安装参考: https://www.cnblogs.com/netcore3/p/17702979.html
docker pull portainer/portainer-ce

docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock  --restart=always --name portainer portainer/portainer-ce
#-v /dockerData/portainer:/data
# http://ggok.top:9000 admin/asdf12345678

