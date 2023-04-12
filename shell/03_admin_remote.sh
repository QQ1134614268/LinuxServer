#!/bin/bash
export BUILD_ID=dontKillMe
project_name='xc-admin'
project_jar='xc-admin.jar'
project_dir='/home/ns-coastal/coastal_be/xc-admin'
log_file='/home/ns-coastal/coastal_be/logs/xc-admin/xc-admin.log'

common_dir='/root/.jenkins/workspace/xc-coastal-java/xc-common'
common_version_file='/root/.jenkins/workspace/xc-coastal-java/common_version_file.log'

api_dir='/root/.jenkins/workspace/xc-coastal-java/xc-api'
api_version_file='/root/.jenkins/workspace/xc-coastal-java/api_version_file.log'

admin_dir='/root/.jenkins/workspace/xc-coastal-java/xc-modules/xc-admin'
admin_version_file='/root/.jenkins/workspace/xc-coastal-java/admin_version_file.log'

cd $admin_dir

admin_new_version=$(git log  --oneline -n 1 $admin_dir | awk '{print $1}')
admin_old_version=$([ -e $admin_version_file ] && cat $admin_version_file)

echo debugger 当前版本: $admin_new_version , 日志版本: $admin_old_version , 模式: $build_mode ;

if [[ $admin_new_version != $admin_old_version || $build_mode != '手动' ]] # bug
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

scp -r $admin_dir/target/lib/ root@44.39.247.244:$project_dir
scp  $admin_dir/target/$project_jar root@44.39.247.244:$project_dir

#/root/.jenkins/workspace/xc-coastal-java/xc-modules/xc-admin/target/xc-admin.jar
#/home/ns-coastal/coastal_be/xc-admin
#
#/root/.jenkins/workspace/xc-coastal-java/xc-modules/xc-admin/target/lib/*
#/home/ns-coastal/coastal_be/xc-admin/lib/

# kill -9 $(ps -ef | grep xc-admin.jar | grep -v grep | awk '{print $2}') ; nohup /usr/local/jdk1.8.0_341/bin/java -jar -server -Xms1024m -Xmx1024m -Djava.security.egd=file:/dev/./urandom -DprojectName=xc-admin -Dname=xc-admin -Duser.timezone=Asia/Shanghai  /home/ns-coastal/coastal_be/xc-admin/xc-admin.jar > /home/ns-coastal/coastal_be/logs/xc-admin/xc-admin.log 2>&1 &
echo $admin_new_version > $admin_version_file
echo '开始传输到远程服务器'
