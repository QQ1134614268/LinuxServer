# 免密登录
# 生成ssh密钥
ssh-keygen -t rsa
#三次enter 生成密钥 id_rsa id_rsa.pub

# 追加 A机器公钥(id_rsa.pub) 到 B机器上的authorized_keys文件( ~/.ssh/authorized_keys)
追加 A机器 ~/.ssh/id_rsa.pub 到 B机器 .ssh/authorized_keys

# 追加 B机器public key 到 A机器器的known_hosts
追加 44.39.17.51 ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKNNGfPFAdkrxxeF0UGonELVUYWULrDrfm2qg0FiuqXj 到 ~/.ssh/known_hosts

# 验证1: ssh A机器 传输到 B机器
scp scp -r /root/test.txt root@192.168.251.10:/root/test.txt

# 验证2: 登陆B机器, 无需密码 直接登录成功
ssh 192.168.251.10

## 多个
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