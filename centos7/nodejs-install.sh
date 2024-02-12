#!/bin/bash

wget https://npm.taobao.org/mirrors/node/v12.13.0/node-v12.13.0-linux-x64.tar.xz
tar -xvf node-v12.13.0-linux-x64.tar.xz
mv node-v12.13.0-linux-x64 /usr/local

ln -s /usr/local/node-v12.13.0-linux-x64/bin/npm /usr/bin/
ln -s /usr/local/node-v12.13.0-linux-x64/bin/node /usr/bin/

# 切换源 默认 https://registry.npmjs.org/
# npm config get registry
npm config set registry https://mirrors.cloud.tencent.com/npm/
