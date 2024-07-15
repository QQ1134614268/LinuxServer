-- mysql index
DROP TABLE if EXISTS user_t;
CREATE TABLE user_t
(
    id       INT AUTO_INCREMENT PRIMARY KEY,
    name     VARCHAR(60),
    nickName VARCHAR(60),
    age      int,
    KEY idx_name (name) USING BTREE,
    KEY idx_birthday (age) USING BTREE
);
INSERT INTO user_t(name,nickName,age)VALUES('1','1',10),('2','2',11),('3','3',12),('4','4',13);

-- type:index; where字段走索引,select字段命中索引; 只需取索引上的数据
EXPLAIN SELECT id FROM user_t WHERE age >= 0 AND age <= 99;
-- type:range; where字段走索引; 遍历表部分数据
EXPLAIN SELECT nickName FROM user_t WHERE age>= 0 AND age <= 99;

### in 与 exist
# 在mysql中,in有限制,exist没有
# null值不参与in或not in,也就是说in and not in 并不是全量值,排除了null值

# 因为in是可以走索引的,但in中数据量过大索引就会失效;# 适合B表比A表数据小的情况;
explain select * from user_t where age in (1); # type: ref
explain select * from user_t where age in (1,2); # type:range
explain select * from user_t where age in (1,2,4,5,6,7,8,9); # type:ALL; in中数据量过大
explain select * from user_t where age not in (10,11); # type: range; 数据在索引中
-- 索引在乎where字段再索引范围内?? 走索引需要更详细的mysql优化逻辑;
explain select * from user_t where age not in (1,2); # type: ALL; 数据不在索引中
explain select id from user_t where age not in (1,2); # type: index; ??
explain select * from user_t where age not in (1,2,4,5,6,7,8,9); # type:ALL
explain select * from user_t where age in (select id from user_t);
explain select * from user_t where age not in (select id from user_t);

# exist 先执行外层,然后执行内层
-- type:ALL,type:index
explain select * from user_t where exists (select 1 from user_t where user_t.age = user_t.age);
-- type:ALL,type:ALL
explain select * from user_t where exists (select 1 from user_t where user_t.nickName = user_t.nickName);
-- type:ALL,type:const
explain select * from user_t where exists (select 1 from user_t where user_t.id = 1);
