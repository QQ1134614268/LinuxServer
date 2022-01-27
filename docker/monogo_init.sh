#!/usr/bin/env bash
#rm -rf /var/mongo/data
mkdir -p  /var/mongo/data

docker stop mongo && docker rm mongo
docker pull mongo:4.2.5
docker run --name mongo --restart=always -p 27017:27017  -v /var/mongo/data:/data -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=root1234567890 -d mongo:4.2.5
#-v /etc/localtime:/etc/localtime:ro -v /etc/timezone:/etc/timezone
sleep 10
docker exec -it mongo mongo admin -u root -p root1234567890  --authenticationDatabase admin --eval '
db.createUser({ user: "world", pwd: "world1234567890", roles: [{ role: "dbAdmin", db: "world" }] });
'
