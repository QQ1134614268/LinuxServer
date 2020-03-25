mkdir -p  /opt/docker/mongo/db

docker pull mongo:4.0.17-xenial
docker run -p 27017:27017  --auth --restart=always -v /opt/docker/mongo/db:/data/db --name docker_mongodb -d mongo:4.0.17-xenial

#admin进入
docker exec -it 10b15378e5ae  mongo admin
#创建用户和密码
db.createUser({ user: 'admin', pwd: '123', roles: [ { role: "userAdminAnyDatabase", db: "admin" } ] });
#验证一下对不对
db.auth("admin","123");
#退出
exit
