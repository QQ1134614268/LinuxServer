-- mysql index

# 索引 过滤后数据量大, 且查询字段不在索引上, 全表扫描;
# 即: 查询字段命中索引,走索引; 索引过滤后小数据量, 走索引;
DROP TABLE if EXISTS test.`user`;
CREATE TABLE test.`test_index`(id INT PRIMARY KEY, name1 VARCHAR(60), name2 VARCHAR(60), createTime VARCHAR(60));
-- range索引; 查询字段命中索引;
EXPLAIN SELECT id  FROM test.`test_index` WHERE createTime >='2020-10-10 10:00:00' AND createTime<='2020-10-10 11:00:00' ;
EXPLAIN SELECT name2  FROM test.`test_index` WHERE createTime>='2020-10-10 10:00:00' AND createTime<='2020-10-10 11:00:00' ;
-- range索引; 小数据量;
EXPLAIN SELECT *  FROM test.`test_index` WHERE createTime>='2023-08-23 15:58:04.0' AND createTime<='2020-10-10 11:00:00' ;

-- ALL类型; 数据量大, 且查询字段不在索引上;
EXPLAIN SELECT *  FROM test.`test_index` WHERE createTime>='2020-10-10 10:00:00' AND createTime<='2020-10-10 11:00:00' ;
EXPLAIN SELECT name2  FROM test.`test_index` WHERE createTime>='2020-10-10 10:00:00' AND createTime<='2020-10-10 11:00:00' ;

#
# 1. channelId deviceId 有组合索引
# 1.1 走索引
EXPLAIN SELECT * FROM test.`test_index` WHERE name2 = 'cat'; # 符合前缀索引
EXPLAIN SELECT * FROM test.`test_index` WHERE name1 = 'cat' AND name2 = 'cat'; # 符合前缀索引, 顺序不一样, update更新也走索引
# 1.2 全表扫描(rows=10), 结果只有一个, filter= 10%;
EXPLAIN SELECT * FROM test.`test_index` WHERE name1 = 'cat';
# 1.3 全表扫描, 结果全部, filter= 100%; 给表所有数据 加锁
EXPLAIN UPDATE test.`test_index` SET name2=null WHERE name2 = 'cat';