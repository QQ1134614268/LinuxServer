# 查找包 指定版本
yum search all nginx

# 安装
yum install -y xxx
# 卸载
yum list installed|grep docker # 查看安装相关包
yum remove -y xxx xx2 # 安装包

# 1.1 yum 镜像源
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
# 1.2 生效
yum clean all
yum makecache
