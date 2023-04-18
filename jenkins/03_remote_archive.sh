#!/bin/bash
export BUILD_ID=dontKillMe
project_name='xc-archive'
project_jar='xc-archive.jar'
project_dir='/home/ns-coastal/coastal_be/xc-archive'
log_file='/home/ns-coastal/coastal_be/logs/xc-archive/xc-archive.log'

common_dir='/root/.jenkins/workspace/xc-coastal-java/xc-common'
common_version_file='/root/.jenkins/workspace/xc-coastal-java/common_version_file.log'

api_dir='/root/.jenkins/workspace/xc-coastal-java/xc-api'
api_version_file='/root/.jenkins/workspace/xc-coastal-java/api_version_file.log'

archive_dir='/root/.jenkins/workspace/xc-coastal-java/xc-modules/xc-archive'
archive_version_file='/root/.jenkins/workspace/xc-coastal-java/archive_version_file.log'

cd $archive_dir

archive_new_version=$(git log  --oneline -n 1 $archive_dir | awk '{print $1}')
archive_old_version=$([ -e $archive_version_file ] && cat $archive_version_file)

echo debugger 当前版本: $archive_new_version , 日志版本: $archive_old_version , 模式: $build_mode ;

if [[ $archive_new_version == $archive_old_version && $build_mode == '自动' ]]
then
  echo "没有自动更新, 退出执行"
  exit 0
fi

common_new_version=$(git log  --oneline -n 1 $common_dir | awk '{print $1}')
common_old_version=$([ -e $common_version_file ] && cat $common_version_file)

api_new_version=$(git log  --oneline -n 1 $api_dir | awk '{print $1}')
api_old_version=$([ -e $api_version_file ] && cat $api_version_file)

if [[ $common_new_version != $common_old_version && $api_new_version != $api_old_version ]];
then
  echo "请先编译 common api 模块"
  exit 1
fi
mvn clean install

scp -r $archive_dir/target/lib/ root@44.39.251.15:$project_dir
scp  $archive_dir/target/$project_jar root@44.39.251.15:$project_dir

#/root/.jenkins/workspace/xc-coastal-java/xc-modules/xc-archive/target/xc-archive.jar
#/home/ns-coastal/coastal_be/xc-archive
#
#/root/.jenkins/workspace/xc-coastal-java/xc-modules/xc-archive/target/lib/*
#/home/ns-coastal/coastal_be/xc-archive/lib/

# [[ $(ls -lc --time-style=+'%Y%m%d%H%M%S' /home/ns-coastal/coastal_be/xc-archive/xc-archive.jar | awk '{print $6}') >  $(date -d'-5 min' +'%Y%m%d%H%M%S') ]] \
# && (kill -9 $(ps -ef | grep xc-archive.jar | grep -v grep | awk '{print $2}');\
# nohup /usr/local/jdk1.8.0_341/bin/java -jar -server -Xms1024m -Xmx1024m -Djava.security.egd=file:/dev/./urandom -DprojectName=xc-archive -Dname=xc-archive -Duser.timezone=Asia/Shanghai  /home/ns-coastal/coastal_be/xc-archive/xc-archive.jar > /home/ns-coastal/coastal_be/logs/xc-archive/xc-archive.log 2>&1 &)
echo $archive_new_version > $archive_version_file
echo '开始传输到远程服务器'
