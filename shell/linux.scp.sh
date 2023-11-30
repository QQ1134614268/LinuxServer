# 1 scp(类似cp)(弃用(命令注入), 推荐sftp rsync(相同文件不传输)等)
#远程到本地
scp -r root@192.168.255.16:/tmp/data/*    /tmp/dst    # 确保dst目录存在
#本地到远程
scp -r /tmp/data/*    root@192.168.255.16:/tmp/dst    # 确保dst目录存在

# scp 与 cp
usage: scp [-12346BCpqrv] [-c cipher] [-F ssh_config] [-i identity_file]
           [-l limit] [-o ssh_option] [-P port] [-S program]
           [[user@]host1:]file1 ... [[user@]host2:]file2
