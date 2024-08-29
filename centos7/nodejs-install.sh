#!/bin/bash

wget https://npmmirror.com/mirrors/node/v20.17.0/node-v20.17.0-linux-x64.tar.xz
tar -xvf node-v20.17.0-linux-x64.tar.xz
mv node-v20.17.0-linux-x64 /usr/local
rm -rf  /usr/bin/npm /usr/bin/node

ln -fs /usr/local/node-v20.17.0-linux-x64/bin/npm /usr/bin/npm
ln -fs /usr/local/node-v20.17.0-linux-x64/bin/node /usr/bin/node
# centos7 安装node16以后的高版本,需要升级库

# 切换源 默认 https://registry.npmjs.org/
# npm config get registry
npm config set registry https://mirrors.cloud.tencent.com/npm/
