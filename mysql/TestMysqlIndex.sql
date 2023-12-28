-- mysql 性能

# 索引 过滤后数据量大, 且查询字段不在索引上, 全表扫描;
# 即: 查询字段命中索引,走索引; 索引过滤后小数据量, 走索引;

-- range索引; 查询字段命中索引;
EXPLAIN SELECT id  FROM xc_warn_info WHERE warn_time>='2023-08-20 15:58:04.0' AND warn_time<='2023-08-23 16:58:04.0' ;
EXPLAIN SELECT warn_time  FROM xc_warn_info WHERE warn_time>='2023-08-20 15:58:04.0' AND warn_time<='2023-08-23 16:58:04.0' ;
-- range索引; 小数据量;
EXPLAIN SELECT *  FROM xc_warn_info WHERE warn_time>='2023-08-23 15:58:04.0' AND warn_time<='2023-08-23 16:58:04.0' ;

-- ALL类型; 数据量大, 且查询字段不在索引上;
EXPLAIN SELECT *  FROM xc_warn_info WHERE warn_time>='2023-08-20 15:58:04.0' AND warn_time<='2023-08-23 16:58:04.0' ;
EXPLAIN SELECT fusion_id  FROM xc_warn_info WHERE warn_time>='2023-08-20 15:58:04.0' AND warn_time<='2023-08-23 16:58:04.0' ;
