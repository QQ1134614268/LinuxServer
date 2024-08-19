# 测试 事务 锁
-- 1.1 准备数据
DROP TABLE if EXISTS test.test_trx;
CREATE TABLE test.test_trx
(
    id   INT PRIMARY KEY,
    name VARCHAR(60)
);
INSERT INTO test.test_trx (id, name) VALUES (1, 'tom'),(2, 'cat'),(3, 'cat2'),(4, 'cat4');

##
start transaction ;
update test.test_trx set name=1 where name = 'tom';
commit;

##
select * from performance_schema.data_locks;


##
数据库事务中的RR（Repeatable Read）和RC（Read Committed）是两种不同的事务隔离级别，它们定义了事务在并发环境中如何与其他事务交互，并影响数据的可见性和一致性。以下是关于RR和RC的详细解释：

1. 定义与概述
RR（可重复读）：在RR隔离级别下，事务在整个执行过程中，多次读取同一数据的结果是一致的。即，如果在事务开始时读取了一行数据，那么在该事务内后续对该数据的读取将看到相同的数据版本，即使其他事务已经对该数据进行了修改并提交。
RC（读已提交）：在RC隔离级别下，事务只能看到已经提交事务所做的更改。即，在一个事务中，如果某次读取操作看到了某个数据版本，那么该事务内的后续读取操作可能会看到该数据的其他版本（如果其他事务已经对该数据进行了修改并提交）。


ReadView：在MVCC（多版本并发控制）中，ReadView是一个关键概念，它决定了事务在读取数据时能看到哪些版本的数据。在RR隔离级别下，ReadView在事务开始时创建，并持续整个事务期间；而在RC隔离级别下，每次读取操作都会创建新的ReadView。
幻读：幻读是指当一个事务在读取某个范围内的记录时，另一个事务插入了新的记录并提交，导致第一个事务在后续读取中看到了原本不存在的记录。RR隔离级别通过特定的加锁机制（如GAP锁）来防止幻读的发生，而RC隔离级别则不保证这一点。
性能与开销：由于RC隔离级别在每次读取时都创建新的ReadView，因此其开销可能相对较大，尤其是在事务中包含多次读取操作时。而RR隔离级别虽然通过维护一个持久的ReadView来减少开销，但可能需要额外的加锁机制来防止幻读，这也可能对性能产生影响。


RR：适用于需要高度数据一致性和防止幻读的场景，如金融交易系统、库存管理系统等。
RC：适用于对数据一致性要求不是非常严格，但希望提高并发性能的场景。

