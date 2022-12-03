# 这个文件是全注释掉了的，所以直接在首行添加如下配置
  
# gitlab访问地址，可以写域名。如果端口不写的话默认为80端口 （图片上拼写错误，正确的是external_url）
external_url "http://192.168.52.128:9980"
# ssh主机ip
gitlab_rails["gitlab_ssh_host"] = "192.168.52.128"
# ssh连接端口
gitlab_rails["gitlab_shell_ssh_port"] = 9922