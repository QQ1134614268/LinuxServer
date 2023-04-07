### 文件上传下载
# 1 sftp
sftp -P 28 root@127.0.0.1
put d:/file.txt
get /download/download.txt e:/
quit
# pwd lpwd ls lls cd lcd
usage: sftp [-1246aCfpqrv] [-B buffer_size] [-b batchfile] [-c cipher]
          [-D sftp_server_path] [-F ssh_config] [-i identity_file] [-l limit]
          [-o ssh_option] [-P port] [-R num_requests] [-S program]
          [-s subsystem | sftp_server] host
       sftp [user@]host[:file ...]
       sftp [user@]host[:dir[/]]
       sftp -b batchfile [user@]host

# 1 scp(弃用(命令注入), 推荐sftp 等)
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
###
生成ssh密钥
