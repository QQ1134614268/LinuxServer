#!/bin/bash
export BUILD_ID=dontKillMe
project_dir='/home/ns-coastal/coastal_be/xc-ship'
project_name='xc-ship'
project_jar='xc-ship.jar'
log_file='/home/ns-coastal/coastal_be/logs/xc-ship/xc-ship.log'

common_dir='/root/.jenkins/workspace/xc-coastal-java/xc-common'
common_version_file='/root/.jenkins/workspace/xc-coastal-java/common_version_file.log'

api_dir='/root/.jenkins/workspace/xc-coastal-java/xc-api'
api_version_file='/root/.jenkins/workspace/xc-coastal-java/api_version_file.log'

ship_dir='/root/.jenkins/workspace/xc-coastal-java/xc-modules/xc-ship'
ship_version_file='/root/.jenkins/workspace/xc-coastal-java/ship_version_file.log'

cd $ship_dir

ship_new_version=$(git log  --oneline -n 1 $ship_dir | awk '{print $1}')
ship_old_version=$([ -e $ship_version_file ] && cat $ship_version_file)

echo debugger 当前版本: $ship_new_version , 日志版本: $ship_old_version , 模式: $build_mode ;

if [[ $ship_new_version != $ship_old_version || $build_mode == '手动' ]] # bug
then
  for i in {1..10} ;
  do
      if [[ $i == 10 ]];
      then
          echo 'xc-common,xc-api模块版本已更新, 等待编译超时'
          exit 1
      fi

      common_new_version=$(git log  --oneline -n 1 $common_dir | awk '{print $1}')
      common_old_version=$([ -e $common_version_file ] && cat $common_version_file)

      api_new_version=$(git log  --oneline -n 1 $api_dir | awk '{print $1}')
      api_old_version=$([ -e $api_version_file ] && cat $api_version_file)

      if [[ $common_new_version == $common_old_version && $api_new_version == $api_old_version ]];
      then
        break
      else
        sleep 10
      fi
  done

  mvn clean install
  scp -r $ship_dir/target/lib/ $project_dir
  scp  $ship_dir/target/$project_jar $project_dir

  pid1=`ps -ef | grep $project_jar | grep -v grep | awk '{print $2}'`


  if [ -n "$pid1" ]
  then
     echo "kill -9 的pid:" $pid1
     kill -9 $pid1
  fi
  cd  $project_dir
  java -jar -server -Xms2048m -Xmx2048m -Djava.security.egd=file:/dev/./urandom -DprojectName=$project_name -Dname=$project_name -Duser.timezone=Asia/Shanghai  $project_dir/$project_jar > $log_file 2>&1 &

  echo $ship_new_version > $ship_version_file
fi
