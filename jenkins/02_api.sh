#!/bin/bash
export BUILD_ID=dontKillMe
common_dir='/root/.jenkins/workspace/xc-coastal-java/xc-common'
common_version_file='/root/.jenkins/workspace/xc-coastal-java/common_version_file.log'

api_dir='/root/.jenkins/workspace/xc-coastal-java/xc-api'
api_version_file='/root/.jenkins/workspace/xc-coastal-java/api_version_file.log'

cd $api_dir
api_new_version=$(git log  --oneline -n 1 $api_dir | awk '{print $1}')
api_old_version=$([ -e $api_version_file ] && cat $api_version_file)

echo debugger 当前版本: $api_new_version , 日志版本: $api_old_version , 模式: $build_mode ;

if [[ $api_new_version != $api_old_version || $build_mode == '手动' ]]
then
  for i in {1..10} ;
  do
      if [[ $i == 10 ]];
      then
          echo 'xc-common模块版本已更新, 等待编译超时'
          exit 1
      fi

      common_new_version=$(git log  --oneline -n 1 $common_dir | awk '{print $1}')
      common_old_version=$([ -e $common_version_file ] && cat $common_version_file)

      if [[ $common_new_version == $common_old_version ]];
      then
        break
      else
        sleep 10
      fi

  done

  mvn clean install
  echo $api_new_version > $api_version_file
fi
