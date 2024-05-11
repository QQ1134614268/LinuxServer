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
