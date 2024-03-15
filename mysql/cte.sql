# RECURSIVE cte
create table Area(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    parentId INT
);
insert into Area(id, parentId, name)values (1, null, 'level_1_1'),(2, 1, 'level_2_1'),(3, 2, 'level_3_1');

# demo1 父级查找 子级
WITH RECURSIVE cte AS (SELECT t1.id, t1.parentId, t1.name FROM Area t1 WHERE t1.id = 1
                       UNION ALL
                       SELECT t2.id, t2.parentId, t2.name FROM Area t2 inner join cte on t2.parentId = cte.id)
SELECT * FROM cte;

# demo2 子级查找 父级
WITH RECURSIVE cte AS (SELECT t1.id, t1.parentId, t1.name FROM Area t1 WHERE t1.id = 3
                       UNION ALL
                       SELECT t2.id, t2.parentId, t2.name FROM Area t2 inner join cte on t2.id = cte.parentId)
SELECT * FROM cte;
