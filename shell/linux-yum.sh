
# 安装
yum install -y xxx
# 卸载
yum list installed|grep docker # 查看安装相关包
yum remove -y xxx xx2 # 安装包

# 查找包
yum search all nginx

# yum 镜像源
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

# 生效
yum clean all
yum makecache
