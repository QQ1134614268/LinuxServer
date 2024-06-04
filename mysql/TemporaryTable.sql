# 临时表 https://zhuanlan.zhihu.com/p/356718127
create temporary table table_name;
# 运行该代码建立临时表，才能使用该表
# 临时表和永久表类似，是需要插入到数据库储存在磁盘的临时区中，只有数据库连接断开MySQL自动删除临时表，或者drop 掉，才会消失。
# 汇总维度相同时，巧用union，不用join。取各个临时表所需的字段，收集齐全后，一次group by。
# 适用于：有很多复杂的关联子表查询。
