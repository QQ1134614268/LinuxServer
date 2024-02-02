### docker-compose
yum -y install docker-compose

docker-compose -f k8s.demo.redis_cluster.yml up
docker-compose -d -f k8s.demo.redis_cluster.yml up

### k8s
