# 1 scp(弃用(命令注入), 推荐sftp rsync(相同文件不传输)等)
#远程到本地
scp -r root@192.168.255.16:/tmp/data /tmp/data
#本地到远程
scp -r /tmp/data root@192.168.255.16:/tmp/data

# 一键 , 无交互式
sshpass -p "password" scp -r -o StrictHostKeyChecking=no /root/.jenkins root@44.39.19.14:/root/.jenkins

# scp 与 cp
usage: scp [-12346BCpqrv] [-c cipher] [-F ssh_config] [-i identity_file]
           [-l limit] [-o ssh_option] [-P port] [-S program]
           [[user@]host1:]file1 ... [[user@]host2:]file2
