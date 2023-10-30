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

-- # 通用日志查询
SHOW VARIABLES LIKE '%general_log%'; # 通用日志查询
SHOW VARIABLES LIKE '%general_log_file%'; # 通用日志查询 文件路径
set global general_log = ON;
set global general_log_file = '/usr/local/mysql/data/general_log_file.log';

-- # 慢日志查询
SHOW VARIABLES LIKE '%long_query_time%'; # 慢查询 超时时间
SHOW VARIABLES LIKE '%slow_query_log%'; # 慢查询 是否开启记录
SHOW VARIABLES LIKE '%slow_query_log_file%'; # 慢查询日志的 文件路径
set global long_query_time = 10;
set global slow_query_log = ON;
set global slow_query_log_file = '/usr/local/mysql/data/slow_query_log_file.log';

SHOW VARIABLES LIKE '%log_output%'; # 日志记录位置
set global log_output = 'FILE,TABLE';

SHOW VARIABLES LIKE '%long_queries_not_using_indexes%'; # 是否开启记录 没用索引的查询

# 1. 查看文件
# 2. 查询表
select * from mysql.slow_log;

# mysqladmin -uroot -p flush-logs # 删除日志
--
select @@global.long_query_time, @@global.log_output,@@session.long_query_time, @@session.log_output;
set @@global.time_zone = '+10:00';
