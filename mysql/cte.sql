# RECURSIVE cte
create table Area(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    parentId INT
);
insert into Area(id, parentId, name)values (1, null, 'level_1_1'),(2, 1, 'level_2_1'),(3, 1, 'level_3_1');

# demo1 父级查找 子级
WITH RECURSIVE cte AS (SELECT t1.id, t1.parentId, t1.name FROM Area t1 WHERE t1.id = 1
                       UNION ALL
                       SELECT t2.id, t2.parentId, t2.name FROM Area t2 inner join cte as t3 on t2.parentId = t3.id)
SELECT * FROM cte;

# demo2 子级查找 父级
WITH RECURSIVE cte AS (SELECT t1.id, t1.parentId, t1.name FROM Area t1 WHERE t1.id = 3
                       UNION ALL
                       SELECT t2.id, t2.parentId, t2.name FROM Area t2 inner join cte as t3 on t2.id = t3.parentId)
SELECT * FROM cte;

# group_concat 获取子级 全路径 名称; eg: level_1_1/level_2_1/level_3_1
WITH RECURSIVE cte AS (SELECT t1.id, t1.parentId, t1.name, t1.id as groupId FROM Area t1 WHERE t1.id = 1
                       UNION ALL
                       SELECT t1.id, t1.parentId, t1.name, t2.groupId as parentId FROM Area t1 inner join cte as t2 on t1.parentId = t2.id)
SELECT group_concat(name ORDER BY id ASC SEPARATOR '/') FROM cte;

# https://blog.csdn.net/WHYbeHERE/article/details/116591196。

# WITH AS短语，
#   也叫做子查询部分（subquery factoring）
#   这个语句算是公用表表达式(CTE: Common table expression)。
#   可以是自引用 (递归CTE)，也可以在同一查询中多次引用. (对于union all比较有用，它在union all的不同部分，作为提供数据的部分)。
#   是用来定义一个SQL片断，该SQL片断会被整个SQL语句所用到。
#   存在内存中, 仅在查询执行期间持续。
#   仅在单个SQL语句 (例如 SELECT,INSERT,UPDATE 或 DELETE)的执行范围内存在。

# WITH ... SELECT ...
# WITH ... UPDATE ...
# SELECT * FROM (WITH ... SELECT ...) AS derived_table;
# SELECT ... WHERE id IN (WITH ... SELECT ...);
# INSERT ... WITH ... SELECT ...
