docker pull emqx
# config data log 挂载目录

docker run -d --name mqtt \
  -p 1883:1883 \
  -p 8883:8883 \
  -p 8083:8083 \
  -p 8084:8084 \
  -p 18083:18083 \
  --privileged --restart=always emqx

# 默认账号 admin/public
# -m 2g 限制内存

# 1883：MQTT 协议端口
# 8883：MQTT/SSL 端口
# 8083：MQTT/Ws 端口
# 8084：MQTT/Wss l端口
# 18083：Dashboard 管理控制台端口
