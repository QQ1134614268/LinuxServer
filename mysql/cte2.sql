# https://blog.csdn.net/WHYbeHERE/article/details/116591196。
# WITH AS短语，
#   也叫做子查询部分（subquery factoring）
#   这个语句算是公用表表达式（CTE: Common table expression）。
#   可以是自引用 (递归CTE)，也可以在同一查询中多次引用. (对于union all比较有用，它在union all的不同部分，作为提供数据的部分)
#   是用来定义一个SQL片断，该SQL片断会被整个SQL语句所用到。
#   存在内存中

# 公用表表达式是一个命名的临时结果集，仅在单个SQL语句 (例如 SELECT ， INSERT ， UPDATE 或 DELETE)的执行范围内存在。
# 与 派生表 类似， CTE 不作为对象存储，仅在查询执行期间持续。
