docker pull zookeeper
docker stop zookeeper && docker rm zookeeper
docker run --name zookeeper -p 2181:2181  --restart always -d zookeeper
