# 测试 事务 锁
-- 1.1 准备数据
DROP TABLE if EXISTS test.test_trx;
CREATE TABLE test.test_trx(id INT PRIMARY KEY, name VARCHAR(60));
INSERT INTO test.test_trx (id, name) VALUES (1, 'tom'),(2, 'cat');
SELECT * FROM test.test_trx;
set @@innodb_lock_wait_timeout = 600; # 默认50,  关闭连接,重新打开 # SELECT @@innodb_lock_wait_timeout;

# 1.2 打开新窗口(第一个) SELECT @@innodb_lock_wait_timeout;
set @@innodb_lock_wait_timeout = 600;
BEGIN;
UPDATE test.test_trx set name = 'aa' WHERE id = 1;
# 1.3 打开新窗口(第二个)
set @@innodb_lock_wait_timeout = 600;
BEGIN;
UPDATE test.test_trx set name = 'cc' WHERE id = 1;

-- 2 查询事务
SELECT * FROM information_schema.INNODB_TRX;
# trx_id 事务id;
# trx_requested_lock_id: 事务锁id
# trx_mysql_thread_id: 事务线程id
# trx_state: 事务状态; RUNNING, LOCK WAIT
# trx_started: 开始时间;
# trx_query: 当前事务在执行的sql
# trx_rows_locked: 大概锁定数据行数
# trx_weight: 事务权重
# trx_operation_state: 事务操作权重
# trx_table_in_use: 事务正在使用的表 数量
# trx_tables_locked: 锁住表数量
# trx_isolation_level: 级别; eg: REPEATABLE READ
# trx_lock_structs, trx_lock_memory_bytes, trx_rows_locked, trx_foreign_key_checks, trx_unique_checks
-- 查看锁
SELECT * FROM `performance_schema`.data_locks;
# ENGINE_LOCK_ID: 锁id
# ENGINE_TRANSACTION_ID: 事务id
# THREAD_ID: 线程id
# EVENT_ID: 事件id
# OBJECT_SCHEMA: 数据库名
# OBJECT_NAME: 表名
# LOCK_TYPE: 锁类型; TABLE, RECORD
# LOCK_MODE: 锁模式; IX, X,REC_NOT_GAP
# LOCK_STATUS: 锁状态; GRANTED 持有锁, WAITING 等待锁;
# INDEX_NAME: 索引名称; PRIMARY
# LOCK_DATA: 锁住的数据
-- 查看等待中的锁
SELECT * FROM `performance_schema`.data_lock_waits;
-- 查看锁 与 事务对应关系
SELECT * FROM `performance_schema`.threads; # sql 线程 线程号 进程号
-- 查看event_id 与 thread_id关系, event_id 对应的 sql
SELECT * from `performance_schema`.events_statements_history;
--
SELECT * FROM sys.innodb_lock_waits;