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
# ps -ef | grep python3
# netstat -ntulp |grep 80
# kill -s 9 1827
# pgrep python3
