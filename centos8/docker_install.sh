
# 安装需要的软件包 ,yum-util 提供yum-config-manager功能，另外两个是devicemapper驱动依赖的
yum install -y yum-utils device-mapper-persistent-data lvm2
# 添加yum源
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
# 可以查看所有仓库中所有docker版本，并选择特定版本安装
# yum list docker-ce --showduplicates | sort -r

systemctl start docker
systemctl enable docker
