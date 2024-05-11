# 日志类型: general_log slow_query_log log_err
# log_output: 日志输出位置

-- # general_log 通用日志查询
set global general_log = ON; # 开启通用日志查询
set global general_log_file = '/usr/local/mysql/data/general_log_file.log'; # 通用日志查询 文件路径

-- # 慢日志查询
set global slow_query_log = ON; # 慢查询 是否开启记录
set global long_query_time = 10;  # 慢查询 超时时间
set global slow_query_log_file = '/usr/local/mysql/data/slow_query_log_file.log'; # 慢查询日志的 文件路径

-- # error
SHOW VARIABLES LIKE '%log_error%';
select * from performance_schema.error_log;

# 日志保存位置
SHOW VARIABLES LIKE '%log_output%'; # 日志记录位置 select @@global.log_output;
set global log_output = 'FILE,TABLE';

# 1. 查看文件
# 2. 查询表
select * from mysql.slow_log;
select event_time, command_type, CAST(argument as char) from mysql.general_log ORDER BY EVENT_time DESC LIMIT 100;

# mysqladmin -uroot -p flush-logs # 删除日志
