#!/bin/bash
#1.准备编译环境 centos7.5 时间: 2019.10.23
yum -y install gcc gcc-c++
yum -y install zlib zlib-devel
yum -y install libffi-devel
yum -y install bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel


#2. 下载python3.7包
wget https://www.python.org/ftp/python/3.7.5/Python-3.7.5.tgz
#3. 解压，编译
tar -zxvf  Python-3.7.5.tgz
cd Python-3.7.5
./configure --prefix=/usr/local/python3.7 --enable-optimizations
make
make install
#4. python2 与 python3 并存
ln -s /usr/local/python3.7/bin/python3.7 /usr/bin/python3
ln -s /usr/local/python3.7/bin/pip3 /usr/bin/pip3

