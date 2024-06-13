# 添加yum源
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

yum install -y docker-ce

echo '{
  "registry-mirrors": [
    "https://mirror.ccs.tencentyun.com/",
    "https://docker.mirrors.ustc.edu.cn/",
    "https://docker.mirrors.sjtug.sjtu.edu.cn/"
  ]
}' >  /etc/docker/daemon.json # systemctl restart docker 重启生效
systemctl start docker
systemctl enable docker
