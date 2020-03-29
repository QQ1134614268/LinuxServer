#!/usr/bin/env bash
docker stop redis && docker rm redis
rm -rf /opt/docker/redis
mkdir -p /opt/docker/redis/conf  /opt/docker/redis/data

docker pull redis:rc-alpine3.11
echo '# daemonize yes 会导致容器启动失败
daemonize no
dir /data
port 6379
appendonly yes
requirepass 1234567890
pidfile redis_6379.pid
loglevel debug
logfile log-redis.log
protected-mode no

tcp-backlog 511
timeout 0
tcp-keepalive 300
supervised no
databases 16
always-show-logo yes
save 900 1
save 300 10
save 60 10000
stop-writes-on-bgsave-error yes
rdbcompression yes
rdbchecksum yes
dbfilename dump.rdb
replica-serve-stale-data yes
replica-read-only yes
repl-diskless-sync no
repl-diskless-sync-delay 5
repl-disable-tcp-nodelay no
replica-priority 100
lazyfree-lazy-eviction no
lazyfree-lazy-expire no
lazyfree-lazy-server-del no
replica-lazy-flush no
appendfilename "appendonly.aof"
appendfsync everysec
no-appendfsync-on-rewrite no
auto-aof-rewrite-percentage 100
auto-aof-rewrite-min-size 64mb
aof-load-truncated yes
aof-use-rdb-preamble yes
lua-time-limit 5000
slowlog-log-slower-than 10000
slowlog-max-len 128
latency-monitor-threshold 0
notify-keyspace-events ""
hash-max-ziplist-entries 512
hash-max-ziplist-value 64
list-max-ziplist-size -2
list-compress-depth 0
set-max-intset-entries 512
zset-max-ziplist-entries 128
zset-max-ziplist-value 64
hll-sparse-max-bytes 3000
stream-node-max-bytes 4096
stream-node-max-entries 100
activerehashing yes
client-output-buffer-limit normal 0 0 0
client-output-buffer-limit replica 256mb 64mb 60
client-output-buffer-limit pubsub 32mb 8mb 60
hz 10
dynamic-hz yes
aof-rewrite-incremental-fsync yes
rdb-save-incremental-fsync yes
'>/opt/docker/redis/conf/redis.conf
docker run -d --privileged=true -p 6379:6379 --restart always -v /opt/docker/redis/conf/redis.conf:/etc/redis/redis.conf -v /opt/docker/redis/data:/data --name redis redis:rc-alpine3.11 redis-server /etc/redis/redis.conf  --appendonly yes
