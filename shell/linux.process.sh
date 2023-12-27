pid:     每个进程有一个,唯一标识
ppid:    父进程id 子进程的创建进程的id, 若父id死亡??
pgid:    进程组id, 简化组内发送信号, 组长的pid, 通过调用 setpgrp 归为一组
sid:     通过setsid, 进程归为一个会话, 终端中会自动调用, 组内进程有相同sid

tid:     线程id, 唯一标识, 轻量级进程(LWP:Light weight process)
tgid:    线程组id, 当前进程的id
#
同一个连接:
    pid:        唯一
    sid:        相同
    ppid:    父进程id, 父进程死亡,设为系统pid
    pgid:   首个进程pid, 没有设置进程组, 就是自己的pid
    nohup:  产生子进程, 替换nohup进程
#
shell: 一个程序,接收键盘命令,返回结果, 翻译成内核语言,传给内核执行, 操作系统会把terminal与shell结合,shell负责解释语言; 有自带命令cd
bash:    名为bash的shell程序(shell的一种,sh csh), 与shell为父子关系
terminal: 图形化界面,和shell交互
cli:     命令行交互
#
进程调试:
    1.通过ps命令查看进程信号信息
        ps ajx # 查看 sid,pgid,pid
        ps -p pid -o pid,comm,sig,sigcatch,sigign
    2.通过kill命令查看进程信号信息,
        kill -l
        kill -9 pidxxx # 发送信号
    3.通过strace命令查看进程信号信息, 进程堆栈
        strace -p pid -e signal
        strace -e trace=signal -p 1359
    4.通过signal命令查看进程信号信息
        signal -l
    # 查看进程
    5. cat /proc/950285/status

执行脚本方式:
    shell, sh, bash 执行
    source 和 . 执行  当前环境生效
    exec 执行 替换当前进程
# 打开xshell, ssh连接, 会话, 进程组, 命令
类别:
    前台进程
    后台进程
    孤儿进程
    守护进程

Usage:
 ps [options]

Basic options:
 -A, -e               all processes
 -a                   all with tty, except session leaders
  a                   all with tty, including other users
 -d                   all except session leaders
 -N, --deselect       negate selection
  r                   only running processes
  T                   all processes on this terminal
  x                   processes without controlling ttys

Selection by list:
 -C <command>         command name
 -G, --Group <GID>    real group id or name
 -g, --group <group>  session or effective group name
 -p, p, --pid <PID>   process id
        --ppid <PID>  parent process id
 -q, q, --quick-pid <PID>
                      process id (quick mode)
 -s, --sid <session>  session id
 -t, t, --tty <tty>   terminal
 -u, U, --user <UID>  effective user id or name
 -U, --User <UID>     real user id or name

  The selection options take as their argument either:
    a comma-separated list e.g. '-u root,nobody' or
    a blank-separated list e.g. '-p 123 4567'

Output formats:
 -F                   extra full
 -f                   full-format, including command lines
  f, --forest         ascii art process tree
 -H                   show process hierarchy
 -j                   jobs format
  j                   BSD job control format
 -l                   long format
  l                   BSD long format
 -M, Z                add security data (for SELinux)
 -O <format>          preloaded with default columns
  O <format>          as -O, with BSD personality
 -o, o, --format <format>
                      user-defined format
  s                   signal format
  u                   user-oriented format
  v                   virtual memory format
  X                   register format
 -y                   do not show flags, show rss vs. addr (used with -l)
     --context        display security context (for SELinux)
     --headers        repeat header lines, one per page
     --no-headers     do not print header at all
     --cols, --columns, --width <num>
                      set screen width
     --rows, --lines <num>
                      set screen height

Show threads:
  H                   as if they were processes
 -L                   possibly with LWP and NLWP columns
 -m, m                after processes
 -T                   possibly with SPID column

Miscellaneous options:
 -c                   show scheduling class with -l option
  c                   show true command name
  e                   show the environment after command
  k,    --sort        specify sort order as: [+|-]key[,[+|-]key[,...]]
  L                   show format specifiers
  n                   display numeric uid and wchan
  S,    --cumulative  include some dead child process data
 -y                   do not show flags, show rss (only with -l)
 -V, V, --version     display version information and exit
 -w, w                unlimited output width

        --help <simple|list|output|threads|misc|all>
                      display help and exit
