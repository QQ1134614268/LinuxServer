# todo 结构, 关键点; GRANTED 持有锁, WAITING 等待锁;
# 查看锁:
#
# 查看事务:
#     锁id

-- 准备数据 # set @@innodb_lock_wait_timeout = 3600; # 关闭连接,重新打开 # SELECT @@innodb_lock_wait_timeout;
# 1.1 创建表
DROP TABLE if EXISTS  test.`user` ;
CREATE TABLE test.`user` (`id` BIGINT (20) NOT NULL AUTO_INCREMENT COMMENT '主键id',`name` VARCHAR (60) DEFAULT NULL COMMENT '名称',PRIMARY KEY (`id`)) ENGINE=INNODB DEFAULT CHARSET=utf8;
# 1.2 数据
INSERT INTO test.USER ( `id`, `name` ) VALUES ( 1, 'tom' ),( 2, 'cat' );
SELECT * FROM test.USER;

# 1.3 打开新窗口(第一个) SELECT @@innodb_lock_wait_timeout;
set @innodb_lock_wait_timeout = 3600;
SELECT @innodb_lock_wait_timeout;
BEGIN; # 开启事务 start TRANSACTION; set autocommit = 0;




# BEGIN; 结束事务: COMMIT; ROLLBACK;
UPDATE test.USER set name = 'aa' WHERE id = 1;
UPDATE test.USER set name = 'bb' WHERE id = 2;
# 1.4 打开新窗口(第二个)
set @innodb_lock_wait_timeout = 3600;
SELECT @innodb_lock_wait_timeout;
BEGIN;
UPDATE test.USER set name = 'cc' WHERE id = 1;

-- 2. 查询事务
SELECT * FROM information_schema.INNODB_TRX; # trx_id 事务id, trx_state: 事务状态; trx_started: 开始时间; trx_query: 执行的sql; trx_rows_locked: 大概锁定数据行数

-- 2.2 查看锁
SELECT * FROM `performance_schema`.data_locks;
-- 2.3 查看等待中的锁
SELECT * FROM `performance_schema`.data_lock_waits;

-- 3. 查看锁 与 事务对应关系
SELECT * FROM sys.innodb_lock_waits;

SELECT * FROM `performance_schema`.threads; # sql 线程 线程号 进程号

-- 3.2 查看event_id 与 thread_id关系, event_id 对应的 sql
SELECT * from `performance_schema`.events_statements_history;
