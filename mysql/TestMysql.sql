-- TestMysql
select trx_id,trx_state, unix_timestamp(trx_started), trx_query, trx_rows_locked from information_schema.innodb_trx;
-- trx_id：InnoDB内部的唯一事务ID，不会为只读且非锁定事务创建ID。
-- trx_state: 事务状态
-- trx_started: 事务开始时间
-- trx_query: 事务的sql， 这个可以帮助我们查到是哪个sql被锁阻塞的时间比较长，进而找到被阻塞的原因
-- trx_rows_locked: 被事务锁定的近似行数。这个值可能包含被标记为删除的行，这些行物理上存在，但已经对事务不可见了。

-- 测试等待锁

# 查询当前会话的锁等待信息
# 查询当前会话的行锁信息
SHOW ENGINE INNODB STATUS;
SHOW ENGINE INNODB STATUS;

# 3. 查询系统中的行锁信息
SELECT *FROM information_schema.INNODB_LOCKS;
# 4. 查询系统中的锁等待信息
SELECT * FROM information_schema.INNODB_LOCK_WAITS;

# 测试
CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    quantity INT
);
-- 事务1
START TRANSACTION;
SELECT * FROM products WHERE id = 1 FOR UPDATE;

-- 事务2
START TRANSACTION;
SELECT * FROM products WHERE id = 1 FOR UPDATE;

-- 事务3
START TRANSACTION;
SELECT * FROM products WHERE id = 1 FOR UPDATE;

-- 事务1修改数据
UPDATE products SET quantity = 10 WHERE id = 1;
COMMIT;

-- 事务2修改数据
UPDATE products SET quantity = 20 WHERE id = 1;
COMMIT;

-- 事务3修改数据
UPDATE products SET quantity = 30 WHERE id = 1;
COMMIT;
