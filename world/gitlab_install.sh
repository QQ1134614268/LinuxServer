# 权限
mkdir -p /usr/local/gitlab/etc
mkdir -p /usr/local/gitlab/log
mkdir -p /usr/local/gitlab/opt

# 配置文件
echo '
external_url "http://ggok.top:9980"
# ssh主机ip
gitlab_rails["gitlab_ssh_host"] = "ggok.top"
# ssh连接端口
gitlab_rails["gitlab_shell_ssh_port"] = 9922
'> gitlab.rb


docker pull gitlab/gitlab-ce:latest

docker run \
 -it  \
 -p 9980:80 \
 -p 9922:22 \
 -v /usr/local/gitlab/etc:/etc/gitlab  \
 -v /usr/local/gitlab/log:/var/log/gitlab \
 -v /usr/local/gitlab/opt:/var/opt/gitlab \
 --restart always \
 --privileged=true \
 --name gitlab \
 -d gitlab/gitlab-ce