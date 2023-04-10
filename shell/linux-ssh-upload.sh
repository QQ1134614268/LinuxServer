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
###
######################### 生成ssh密钥
#方案1: ssh key
ssh-keygen -t rsa
#三次enter
复制 .ssh/id_rsa.pub 到 B机器 .ssh/id_rsa.pub
追加 B机器 .ssh/id_rsa.pub 到 B机器 .ssh/authorized_keys
#验证:
ssh B机器ip
#无需密码 直接登录成功

#方案二 sshpass
usage: ssh-keygen [-q] [-b bits] [-t dsa | ecdsa | ed25519 | rsa | rsa1]
                  [-N new_passphrase] [-C comment] [-f output_keyfile]
       ssh-keygen -p [-P old_passphrase] [-N new_passphrase] [-f keyfile]
       ssh-keygen -i [-m key_format] [-f input_keyfile]
       ssh-keygen -e [-m key_format] [-f input_keyfile]
       ssh-keygen -y [-f input_keyfile]
       ssh-keygen -c [-P passphrase] [-C comment] [-f keyfile]
       ssh-keygen -l [-v] [-E fingerprint_hash] [-f input_keyfile]
       ssh-keygen -B [-f input_keyfile]
       ssh-keygen -D pkcs11
       ssh-keygen -F hostname [-f known_hosts_file] [-l]
       ssh-keygen -H [-f known_hosts_file]
       ssh-keygen -R hostname [-f known_hosts_file]
       ssh-keygen -r hostname [-f input_keyfile] [-g]
       ssh-keygen -G output_file [-v] [-b bits] [-M memory] [-S start_point]
       ssh-keygen -T output_file -f input_file [-v] [-a rounds] [-J num_lines]
                  [-j start_line] [-K checkpt] [-W generator]
       ssh-keygen -s ca_key -I certificate_identity [-h] [-n principals]
                  [-O option] [-V validity_interval] [-z serial_number] file ...
       ssh-keygen -L [-f input_keyfile]
       ssh-keygen -A
       ssh-keygen -k -f krl_file [-u] [-s ca_public] [-z version_number]
                  file ...
       ssh-keygen -Q -f krl_file file ...

# 多个
##
ssh-keygen -t rsa -C "111.@qq.com" -f ~/.ssh/github.pub
ssh-keygen -t rsa -C "222.@qq.com" -f ~/.ssh/gitee.pub
ssh-keygen -t rsa -C "333.@qq.com" -f ~/.ssh/tenxun.pub

##config文件

###配置github.com
Host github.com
HostName github.com
IdentityFile -f ~/.ssh/github.pub

###配置gitee
Host gitee.com
HostName gitee.com
IdentityFile -f ~/.ssh/gitee.pub

###配置github.com
Host tenxun
HostName 192.168.100.100
User root
IdentityFile -f ~/.ssh/tenxun.pub
