docker pull elasticsearch:8.12.0

echo 'cluster.name: "docker-cluster"
network.host: 0.0.0.0
# 开启跨域
http.cors.enabled: true
# 所有人访问
http.cors.allow-origin: "*"

xpack.security.enabled: false
xpack.security.http.ssl.enabled: false
'> /usr/share/elasticsearch/config/elasticsearch.yml

# 开发模式,禁用https,身份验证
docker run --name elasticsearch -p 9200:9200 \
 -e "discovery.type=single-node" \
 -e ES_JAVA_OPTS="-Xms256M -Xmx256M" \
 -e xpack.security.enabled=false \
 -d elasticsearch:8.12.0
