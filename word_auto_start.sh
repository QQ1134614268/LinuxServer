#1. 自动提起world-web应用
cd /
mkdir app
cd /app
git clone  https://gitee.com/biaozhun/world.git
cd world
pip3 install -r requirements.txt
nohup python3 /app/world/src/main/python/app.py &

# git pull
# nohup python3 /app/world/src/main/python/app.py &
#
# ps -ef | grep "python3" | grep -v grep | awk '{print $2}'
# process_name=$1
# eg: pid=$(ps -ef | grep $process_name | grep '/bin/java' | grep -v grep | awk '{print $2}')
# ps -ef | grep python3
# netstat -ntulp |grep 80
# kill -s 9 1827
# pgrep "python3 /app/world/src/main/python/app.py"
# pkill -f "python3"
# pkill -f "python3 /app/world/src/main/python/app.py"
# pidof python3
