#!/bin/bash
export BUILD_ID=dontKillMe
common_dir='/root/.jenkins/workspace/xc-coastal-java/xc-common'
common_version_file='/root/.jenkins/workspace/xc-coastal-java/common_version_file.log'

cd $common_dir
common_new_version=$(git log  --oneline -n 1 $common_dir | awk '{print $1}')
common_old_version=$([ -e $common_version_file ] && cat $common_version_file)

echo debugger 当前版本: $common_new_version , 日志版本: $common_old_version , 模式: $build_mode ;

if [[ $common_new_version != $common_old_version || $build_mode == '手动' ]]
then
  mvn clean install
  echo $common_new_version > $common_version_file
fi
