
# 1. channelId deviceId 有索引
# 1.1 全表扫描(rows=10), 结果只有一个, filter= 10%;
EXPLAIN SELECT * FROM device_channel WHERE deviceId = '44030500101325240067';
# 1.2 全表扫描, 结果全部, filter= 100%; 给表所有数据 加锁
EXPLAIN UPDATE device_channel SET updateTime=null WHERE channelId = '44030500101325640067';
# 1.3 走索引
EXPLAIN SELECT * FROM device_channel WHERE channelId = '44030500101325240067'; # 符合前缀索引
EXPLAIN SELECT * FROM device_channel WHERE deviceId = '44030500101325240067' AND channelId = '44030500101325240067'; # 符合前缀索引, 顺序不一样, update更新也走索引
