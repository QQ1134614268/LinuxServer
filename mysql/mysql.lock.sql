# todo
# in 上锁
# 非索引建上锁
DELETE from device_channel WHERE deviceId = ?  AND channelId NOT IN  (   ? )
UPDATE device_channel SET streamId=? WHERE deviceId=? AND channelId=?

-- mysql 数据问题定位
SELECT * from information_schema.processlist; # show full processlist;
SHOW TABLE STATUS LIKE 'securities_score';
show open tables;
KILL 27;
