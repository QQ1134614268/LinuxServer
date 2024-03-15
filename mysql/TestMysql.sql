-- TestMysql
CREATE TABLE IF NOT EXISTS `user_t`
(
    `id`         int       NOT NULL AUTO_INCREMENT,
    `date_time`  datetime  NOT NULL,
    `time_stamp` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
INSERT INTO user_t(date_time, time_stamp) VALUES (now(), now()), ('2020-01-01 10:00:00', '2020-01-01 10:00:00');
SELECT date_time, time_stamp FROM user_t;

--
-- 查看表数据
select * from INFORMATION_SCHEMA.TABLES;
select * from INFORMATION_SCHEMA.COLUMNS;

show columns from user_t;
show full fields from user_t;
desc user_t;
show create table user_t;

-- 命令来重建表,清理表空间, 大表删除数据后占用空间依然很大
alter table user_t engine=InnoDB;
OPTIMIZE table user_t;

-- 修改时区 now函数 根据时区变化
#  DateTime 类型没有时区信息的, Timestamp 和时区有关 https://blog.csdn.net/weixin_33677704/article/details/113252849
set time_zone = '+9:00'; # 修改时区,time_stamp 时间跟随变化
SELECT date_add(NOW(), interval 1 day);

select @@session.time_zone, @@global.time_zone;

set @@session.time_zone = '+9:00'; # 设置time_zone
set @@global.time_zone = '+10:00';
select @@session.time_zone, @@global.time_zone;
select now();
