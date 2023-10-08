todo 书籍

    shell sh bash 执行
    
    source 和 . 执行  当前环境生效
    
    exec 执行 替换当前进程


ps命令——查看静态的进程统计信息(一般结合选项使用 ps aux 或 ps -elf 命令)

控制终端

前台进程
后台进程
孤儿进程
守护进程

当一个进程脱离了Shell环境后，它就可以被称为后台服务类进程，即Daemon类守护进程，显然Daemon类进程的PPID=1。当某进程脱离Shell的控制，也意味着它脱离了终端：当终端断开连接时，不会影响这些进程。
创建Daemon类进程的流程：先有一个父进程，父进程在某个时间点fork出一个子进程继续运行代码逻辑，父进程立即终止，该子进程成为孤儿进程，即Daemon类进程。当然，要创建一个完善的Daemon类进程还需考虑其它一些事情，比如要独立一个会话和进程组，要关闭stdin/stdout/stderr，要chdir到/下防止文件系统错误导致进程异常，等等。不过最关键的特性仍在于其脱离Shell、脱离终端。

进程组(process group)： 一个或多个进程的集合，每个进程都有一个进程组ID，这个ID就是进程组长的进程ID
会话期(session)： 一个或多个进程组的集合，每个会话有唯一一个会话首进程(session leader)，会话ID为会话首进程ID
控制终端(controlling terminal) ：每一个会话可以有一个单独的控制终端，与控制终端连接的会话首进程就是控制进程(controlling process)。 这时候，与当前终端交互的就是前台进程组，其他的都是后台进程组。

#
#1. 应用安装: 源码, yum, docker, zip
#
##
#1. 系统初始化脚本
#2. 脚本上传保存脚本
#3. 脚本交互问题
#
##
#1. 更新python 更换pip镜像源
#2. 安装nodejs
#3. 数据库 redis mysql mongo
#4. nginx
#5. docker

vm安装centos8 参考网址
    https://www.cnblogs.com/fanzhenyong/p/11616192.html