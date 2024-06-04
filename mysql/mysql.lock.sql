# todo
# in 上锁
# 非索引建上锁
DELETE from user WHERE name = 'tom'  AND age = 10;
UPDATE user SET name = 'cat' WHERE name = 'tom'  AND age = 10;

-- mysql 数据问题定位
SELECT * from information_schema.processlist; # show full processlist;
SHOW TABLE STATUS LIKE 'user';
show open tables;
KILL 27;
