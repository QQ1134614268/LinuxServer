# testMysql debug 调试
-- 测试上锁
# 查看行锁

# in 上锁
# 非索引建上锁
DELETE from device_channel WHERE deviceId = ?  AND channelId NOT IN  (   ? )

UPDATE device SET updateTime=? , manufacturer=? , model=? , transport=? , ip=? , localIp=? , port=? , hostAddress=? , online=? , registerTime=? , keepaliveTime=? , keepaliveIntervalTime=? , expires=? WHERE deviceId=?

UPDATE device_channel SET streamId=? WHERE deviceId=? AND channelId=?

--
select * from INFORMATION_SCHEMA.TABLES;
select * from INFORMATION_SCHEMA.COLUMNS;
--
show columns from user_t;
show full fields from user_t;
desc user_t;
show create table user_t;

SHOW VARIABLES LIKE 'sql_mode';

-- 命令来重建表,清理表空间, 大表删除数据后占用空间依然很大
alter table user_t engine=InnoDB;
OPTIMIZE table user_t;

-- mysql 数据问题定位
show full processlist;

SELECT * from information_schema.processlist;

select * from information_schema.innodb_trx;

select * from performance_schema.data_locks;

select * from performance_schema.data_lock_waits;

SHOW TABLE STATUS LIKE 'securities_score';

show open tables;

KILL 27;

# mysqladmin -uroot -p flush-logs # 删除日志
--
select @@global.long_query_time, @@global.log_output,@@session.long_query_time, @@session.log_output;
set @@global.time_zone = '+10:00';
