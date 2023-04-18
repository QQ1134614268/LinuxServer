#!/bin/bash
export BUILD_ID=dontKillMe
project_name='xc-job'
project_jar='xc-job.jar'
project_dir='/home/ns-coastal/coastal_be/xc-job'
log_file='/home/ns-coastal/coastal_be/logs/xc-job/xc-job.log'

common_dir='/root/.jenkins/workspace/xc-coastal-java/xc-common'
common_version_file='/root/.jenkins/workspace/xc-coastal-java/common_version_file.log'

api_dir='/root/.jenkins/workspace/xc-coastal-java/xc-api'
api_version_file='/root/.jenkins/workspace/xc-coastal-java/api_version_file.log'

job_dir='/root/.jenkins/workspace/xc-coastal-java/xc-modules/xc-job'
job_version_file='/root/.jenkins/workspace/xc-coastal-java/job_version_file.log'

cd $job_dir

job_new_version=$(git log  --oneline -n 1 $job_dir | awk '{print $1}')
job_old_version=$([ -e $job_version_file ] && cat $job_version_file)

echo debugger 当前版本: $job_new_version , 日志版本: $job_old_version , 模式: $build_mode ;

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
scp -r $job_dir/target/lib/ root@44.39.247.244:$project_dir
scp  $job_dir/target/$project_jar root@44.39.247.244:$project_dir

#/root/.jenkins/workspace/xc-coastal-java/xc-modules/xc-job/target/xc-job.jar
#/home/ns-coastal/coastal_be/xc-job
#
#/root/.jenkins/workspace/xc-coastal-java/xc-modules/xc-job/target/lib/*
#/home/ns-coastal/coastal_be/xc-job/lib/

# kill -9 $(ps -ef | grep xc-job.jar | grep -v grep | awk '{print $2}'); nohup /usr/local/jdk1.8.0_341/bin/java -jar -server -Xms1024m -Xmx1024m -Djava.security.egd=file:/dev/./urandom -DprojectName=xc-job -Dname=xc-job -Duser.timezone=Asia/Shanghai  /home/ns-coastal/coastal_be/xc-job/xc-job.jar > /home/ns-coastal/coastal_be/logs/xc-job/xc-job.log 2>&1 &
echo $job_new_version > $job_version_file
echo '开始传输到远程服务器'
