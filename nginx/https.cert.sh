https://blog.csdn.net/tianjiewang/article/details/106424699

#1.1 standalone
sudo certbot certonly --standalone -d www.domain.com

#1.2 webroot
sudo certbot certonly --webroot -w /var/www/live -d www.domain.com \
    --agree-tos \
    --email test@163.com

#1.3 manual方式
sudo certbot certonly --manual --preferred-challenges dns --server https://acme-v02.api.letsencrypt.org/directory --manual-public-ip-logging-ok  -d <www.your.domain> --agree-tos --email example@mail.com

#2.1 泛域名
sudo certbot certonly --manual --preferred-challenges dns --server https://acme-v02.api.letsencrypt.org/directory --manual-public-ip-logging-ok -d '*.<your.domain>' -d <your.domain> --agree-tos --email example@mail.com
`certonly` 表示安装模式,Certbot 有安装模式和验证模式两种类型的插件
--manual:  表示手动交互模式,Certbot 有很多插件,不同的插件都可以申请证书,用户可以根据需要自行选择
-d:  为那些主机申请证书,如果是通配符,输入 *.xxxx.com
--preferred-challenges:  使用 DNS 方式校验域名所有权
--server: Let's Encrypt ACME v2 版本使用的服务器不同于 v1 版本,需要显示指定
--agree-tos: 默认同意 Let’s Encrypt 的一些 agreements,不加这个参数在命令执行过程中还是会问用户是否同意；
--email: 用来获取一些 Let’s Encrypt 的通知,比如证书过期之类；

certonly:                       Obtain or renew a certificate, but do not install
–manual:                        Obtain certificates interactively
–preferred-challenges=dns:      Use dns to authenticate domain ownership
–server:                        Specify the endpoint to use to generate
–agree-tos:                     Agree to the ACME server’s subscriber terms
-d:                             Domain name to provide certificates for


Standalone 方式:  certbot 会自己运行一个 web server 来进行验证,暂时占用服务器的 80 或者 443 端口如果我们自己的服务器上已经有 web server 正在运行 (比如 Nginx 或 Apache ),用 standalone 方式的话需要先关掉它,以免冲突
Webroot 方式:  certbot 会利用既有的 web server,在其 web root目录下创建隐藏文件, Let’s Encrypt 服务端会通过域名来访问这些隐藏文件,以确认你的确拥有对应域名的控制权
Manual: 表示手动交互模式,Certbot 有很多插件,不同的插件都可以申请证书,用户可以根据需要自行选择
DNS Plugins: 使用各类型的DNS插件证明这个域名是属于你的,自动验证方式创建泛域名证书,不是所有的域名都能用自动验证方式创建证书,需要查看官方支持域名供应商,如阿里云是没有提供API来自动验证

yum install snapd
systemctl enable --now snapd.socket
ln -s /var/lib/snapd/snap /snap
snap install core;
snap refresh core
yum remove certbot -y
snap install --classic certbot
ln -s /snap/bin/certbot /usr/bin/certbot
touch  /var/log/nginx/error.log
#certbot --nginx
certbot certonly --nginx
#certbot renew --dry-run

#定时任务

echo '0 0 1 * * certbot renew --renew-hook "systemctl reload nginx"'>>/var/spool/cron/root
systemctl reload crond


#  certbot [SUBCOMMAND] [options] [-d DOMAIN] [-d DOMAIN] ...
#
#Certbot can obtain and install HTTPS/TLS/SSL certificates.  By default,
#it will attempt to use a webserver both for obtaining and installing the
#certificate. The most common SUBCOMMANDS and flags are:
#
#obtain, install, and renew certificates:
#    (default) run   Obtain & install a certificate in your current webserver
#    certonly        Obtain or renew a certificate, but do not install it
#    renew           Renew all previously obtained certificates that are near
#expiry
#    enhance         Add security enhancements to your existing configuration
#   -d DOMAINS       Comma-separated list of domains to obtain a certificate for
#
#  --apache          Use the Apache plugin for authentication & installation
#  --standalone      Run a standalone webserver for authentication
#  --nginx           Use the Nginx plugin for authentication & installation
#  --webroot         Place files in a server's webroot folder for authentication
#  --manual          Obtain certificates interactively, or using shell script
#hooks
#
#   -n               Run non-interactively
#  --test-cert       Obtain a test certificate from a staging server
#  --dry-run         Test "renew" or "certonly" without saving any certificates
#to disk
#
#manage certificates:
#    certificates    Display information about certificates you have from Certbot
#    revoke          Revoke a certificate (supply --cert-name or --cert-path)
#    delete          Delete a certificate (supply --cert-name)
#
#manage your account:
#    register        Create an ACME account
#    unregister      Deactivate an ACME account
#    update_account  Update an ACME account
#    show_account    Display account details
#  --agree-tos       Agree to the ACME server's Subscriber Agreement
#   -m EMAIL         Email address for important account notifications
#
#More detailed help:
#
#  -h, --help [TOPIC]    print this message, or detailed help on a topic;
#                        the available TOPICS are:
#
#   all, automation, commands, paths, security, testing, or any of the
#   subcommands or plugins (certonly, renew, install, register, nginx,
#   apache, standalone, webroot, etc.)
#  -h all                print a detailed help page including all topics
#  --version             print the version number