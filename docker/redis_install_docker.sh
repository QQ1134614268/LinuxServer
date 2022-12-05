#!/usr/bin/env bash
# rm -rf /usr/local/redis
mkdir -m 777 -p /usr/local/redis/etc
mkdir -m 777 -p /usr/local/redis/data

echo '# daemonize yes docker中导致异常
daemonize no
dir /usr/local/redis/data
port 6379
appendonly yes
requirepass 1234567890
pidfile redis_6379.pid
loglevel debug
logfile log-redis.log
protected-mode no
stop-writes-on-bgsave-error no

tcp-backlog 511
timeout 0
tcp-keepalive 300
supervised no
databases 16
always-show-logo yes
save 900 1
save 300 10
save 60 10000
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
'>/usr/local/redis/etc/redis.conf

docker pull redis

docker run --name redis  -p 6379:6379 --privileged=true --restart always \
-v /usr/local/redis/etc/redis.conf:/etc/redis/redis.conf \
-v /usr/local/redis/data:/usr/local/redis/data \
-d redis redis-server /etc/redis/redis.conf

# docker stop redis && docker rm redis
# docker pull redis
