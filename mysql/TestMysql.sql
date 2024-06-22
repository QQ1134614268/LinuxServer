-- TestMysql
CREATE TABLE IF NOT EXISTS `user_t`
(
    id          int NOT NULL AUTO_INCREMENT,
    name        varchar(20),
    age         int,
    create_time datetime DEFAULT CURRENT_TIMESTAMP,
    update_time datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
INSERT INTO user_t(create_time, update_time) VALUES (now(), now()), ('2020-01-01 10:00:00', '2020-01-01 10:00:00');
SELECT create_time, update_time FROM user_t;

--
-- 查看表数据
select * from INFORMATION_SCHEMA.TABLES;
select * from INFORMATION_SCHEMA.COLUMNS;

show columns from user_t;
show full fields from user_t;
desc user_t;
show create table user_t;

-- 命令来重建表,清理表空间, 大表删除数据后占用空间依然很大
alter table user_t engine =InnoDB;
OPTIMIZE table user_t;

-- mysql 数据问题定位
SELECT * from information_schema.processlist; # show full processlist;
KILL 27;
SHOW TABLE STATUS LIKE 'user';
show open tables;
