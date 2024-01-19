docker pull elasticsearch:8.12.0

# 开发模式,禁用https,身份验证
docker run --name elasticsearch -p 9200:9200 \
 -e "discovery.type=single-node" \
 -e ELASTIC_PASSWORD="123456" \
 -e ES_JAVA_OPTS="-Xms256M -Xmx256M" \
 -e xpack.security.enabled=false \
 -d elasticsearch:8.12.0
