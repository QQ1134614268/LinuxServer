# todo
docker pull python:3.7.7-slim-buster
docker cp /app/world python3:/opt
docker exec -it python3 sh
pip install --no-cache-dir -r /opt/world/requirements.txt -i http://mirrors.aliyun.com/pypi/simple/  --trusted-host mirrors.aliyun.com

docker run -it --name python3 \
  -d python:3.7.7-slim-buster

# docker export elated_kare > world_export.tar
# docker stop python3 && docker rm python3
