# 免密登录(从A -> 到) scp A:/file B:/file
# 1. A机器 生成ssh密钥: ssh-keygen -t rsa ; 三次enter 生成 id_rsa id_rsa.pub
# 2. 追加 A机器 ~/.ssh/id_rsa.pub 内容 到 B机器 ~/.ssh/authorized_keys
# 3. 首次连接, 需要 识别 host
# 方案1: A机器手动执行: scp A:/file B:/file , 会提示 unknown host, 确认后 向 ~/.ssh/known_hosts 输入数据
# 方案2: 追加 B机器 id_rsa.pub 到 A机器的 known_hosts

# 验证1: ssh A机器 传输到 B机器
scp -P 22 -r /root/source/*   root@192.168.251.10:/root/dst # 确保目录存在,否则复制文件异常
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