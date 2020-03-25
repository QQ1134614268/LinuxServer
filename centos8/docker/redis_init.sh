docker pull redis:rc-alpine3.11
docker run -itd --name redis -p 6379:6379 --restart=always  redis:rc-alpine3.11
