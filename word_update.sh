cd /app/world
git pull
pkill -f "python3 /app/world/src/main/python/app.py"
nohup python3 /app/world/src/main/python/app.py &
