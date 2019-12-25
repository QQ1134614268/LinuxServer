cd /app/world
pip3 install -r requirements.txt
git pull
pkill -f "python3 /app/world/src/main/python/app.py"
nohup python3 /app/world/src/main/python/app.py &
