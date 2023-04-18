# yum install -y xxx

# 制作离线安装镜像源
iso-DVD: 包含系统文件和部分RPM包
iso-everything: 包含系统文件和全部RPM包

# 上传iso文件
mkdir -p /var/iso
/var/iso/CentOS-7-x86_64-DVD-1804.iso

# 挂载-- iso是一个文件(类压缩文件), 通过挂载,识别内部文件(类似光盘)
mount -o loop /mount/centos7.iso /var/iso/var/iso/CentOS-7-x86_64-DVD-1804.iso

# 制作镜像源
/etc/yum.repos.d/local.repo
# 修改yum.repos.d
[local_server]
name=this is a local repo
baseurl=file:///var/iso/var/iso/CentOS-7-x86_64-DVD-1804.iso
gpgcheck=1
enable=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

# 生效
yum clean all
yum makecache
