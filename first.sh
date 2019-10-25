#!/bin/bash
# 时间: 2019.10.23 centos7.5

# 一. 安装python3

yum -y install gcc gcc-c++
yum -y install zlib-devel
yum -y install libffi-devel

#2. 下载python3.7包
wget https://www.python.org/ftp/python/3.7.5/Python-3.7.5.tgz
#3. 解压，编译
tar -xvf Python-3.7.5.tgz
cd Python-3.7.5
./configure --prefix=/usr/local/python3.7 --enable-optimizations
make && make install
#4. 删除老的链接
rm -rf /usr/bin/python
ln -s /usr/local/python3.7/bin/python3.7 /usr/bin/python
ln -s /usr/local/python3.7/bin/pip3 /usr/bin/pip

#5. 更新yum相关设置 /usr/bin/yum : /usr/libexec/urlgrabber-ext-down 第一行改为  #!/usr/bin/python2
sed -i '1c #!/usr/bin/python2' /usr/bin/yum
sed -i '1c #!/usr/bin/python2' /usr/libexec/urlgrabber-ext-down

#6. 更换镜像源
#  index-url = https://pypi.tuna.tsinghua.edu.cn/simple

# 二. 安装mysql

yum -y localinstall https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
yum -y install mysql-community-server

systemctl start  mysqld.service
systemctl status mysqld.service

systemctl enable mysqld
systemctl daemon-reload

# 三. 安装git
yum -y install git

# 四. 启动web
cd /
mkdir app
cd /app
git clone  https://gitee.com/biaozhun/world.git
cd world
pip install -r requirements.txt
python /app/world/src/main/python/app.py

# 五. 防火墙配置
systemctl start firewalld

firewall-cmd --zone=public --add-port=22/tcp --permanent
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=3306/tcp --permanent
firewall-cmd --reload