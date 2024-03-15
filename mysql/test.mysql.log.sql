# 日志:
#     general_log
#     slow_query_log
#     log_err
#     log_output

-- # 通用日志查询
SHOW VARIABLES LIKE '%general_log%'; # 通用日志查询
SHOW VARIABLES LIKE '%general_log_file%'; # 通用日志查询 文件路径
set global general_log = ON;
set global general_log_file = '/usr/local/mysql/data/general_log_file.log';

-- # 慢日志查询
select @@global.long_query_time, @@global.log_output, @@session.long_query_time, @@session.log_output;
SHOW VARIABLES LIKE '%long_query_time%'; # 慢查询 超时时间
SHOW VARIABLES LIKE '%slow_query_log%'; # 慢查询 是否开启记录
SHOW VARIABLES LIKE '%slow_query_log_file%'; # 慢查询日志的 文件路径
set global long_query_time = 10;
set global slow_query_log = ON;
set global slow_query_log_file = '/usr/local/mysql/data/slow_query_log_file.log';

-- # error
select *from performance_schema.error_log;

# 日志保存位置
SHOW VARIABLES LIKE '%log_output%'; # 日志记录位置
set global log_output = 'FILE,TABLE';

# 是否开启记录 没用索引的查询
SHOW VARIABLES LIKE '%log_filter_internal%';

# 1. 查看文件
# 2. 查询表
select * from mysql.slow_log;
select event_time, command_type, CAST(argument as char) from mysql.general_log ORDER BY EVENT_time DESC LIMIT 100;

SHOW VARIABLES LIKE '%log_error%';

# mysqladmin -uroot -p flush-logs # 删除日志

