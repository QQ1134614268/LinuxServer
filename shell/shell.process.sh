# 进程 todo
cat /proc/950285/status

ps -p 950285
# 进程下线程数量
ps -l 950285
ps -eLF
# 进程使用内存
ps -m 950285
# 进程使用cpu
ps -T 950285

# 进程执行代码

# 线程
strace -p 950285