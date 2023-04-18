# 免密登录
# 生成ssh密钥
ssh-keygen -t rsa
#三次enter
复制 .ssh/id_rsa.pub 到 B机器 .ssh/id_rsa.pub
追加 B机器 .ssh/id_rsa.pub 到 B机器 .ssh/authorized_keys
#验证:
ssh B机器ip
#无需密码 直接登录成功

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