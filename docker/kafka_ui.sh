docker stop ui && docker rm ui && docker run -itd --net host --name ui cheon/kafka-eagle && docker logs -f ui
docker stop ui && docker rm ui && docker run -itd --net host --name ui paladintyrion/kafka-eagle && docker logs -f ui

docker exec -ti ui bash

mkdir -m 644 -p /root/efak/hadoop/db
mkdir -m 644 -p /root/efak/conf
mkdir -m 644 -p /root/efak/logs
mkdir -m 644 -p /root/efak/db

docker stop ui && docker rm ui
docker run -itd --net host --name ui nickzurich/kafka-eagle
docker logs -f ui

rm -rf /root/efak/*
docker cp ui:/opt/efak/conf /root/efak/
docker cp ui:/opt/efak/logs /root/efak/
docker cp ui:/opt/efak/db /root/efak/


docker stop ui && docker rm ui

docker run -itd --net host --name ui  \
-v /root/efak/hadoop/db:/hadoop/db \
-v /root/efak/conf/system-config.properties:/opt/efak/conf/system-config.properties \
-v /root/efak/logs:/opt/efak/logs \
-v /root/efak/db:/opt/efak/db \
nickzurich/kafka-eagle

docker logs -f ui

docker stop ui && docker start ui
docker logs -f ui
