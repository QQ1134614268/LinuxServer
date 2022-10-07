
mkdir -m 777 -p /opt/elasticsearch/config
mkdir -m 777 -p /opt/elasticsearch/data
mkdir -m 777 -p /opt/elasticsearch/plugins

echo 'http.host: 0.0.0.0

http.cors.enabled: true
http.cors.allow-origin: "*"
http.cors.allow-methods: OPTIONS,HEAD,GET,POST,PUT,DELETE
http.cors.allow-headers: Content-Type,Accept,Authorization,x-requested-with,token

xpack.security.enabled: true
xpack.security.transport.ssl.enabled: true

'> /opt/es_docker/config/elasticsearch.yml

docker pull elasticsearch:7.12.0


docker run --name elasticsearch -p 9200:9200  -p 9300:9300 \
 -e "discovery.type=single-node" \
 -e ELASTIC_PASSWORD="123456" \
 -e ES_JAVA_OPTS="-Xms256M -Xmx512m" \
 -v /opt/es_docker/config/elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml \
 -v /opt/es_docker/data:/usr/share/elasticsearch/data \
 -v /opt/es_docker/plugins:/usr/share/elasticsearch/plugins \
 -d elasticsearch:7.12.0
 
# -e ELASTIC_PASSWORD="123456"   # 账号密码默认是elastic  这里设置密码 123456


docker logs elasticsearch

docker rm elasticsearch

docker stop elasticsearch

docker ps -a
docker exec -it elasticsearch /bin/bash
ll /opt/es_docker/config

