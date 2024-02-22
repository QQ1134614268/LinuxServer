#参考: https://certbot.eff.org/instructions?ws=nginx&os=centosrhel7&tab=wildcard
yum install certbot -y

# yum install  python2-certbot-nginx -y
certbot certonly --nginx -d test.ggok.top --agree-tos  --email 1134614268@qq.com
certbot run      --nginx -d ggok.top      --agree-tos  --email 1134614268@qq.com
certbot run      --nginx -d test.ggok.top --agree-tos  --email 1134614268@qq.com --preferred-challenges dns-01
certbot run      --nginx -d ggok.top       --agree-tos  --email 1134614268@qq.com \
 -d renren.ggok.top  -d worker.ggok.top  -d test.ggok.top  -d root.ggok.top \
 -d tree.ggok.top -d file.ggok.top

# 自动续期证书
echo '0 0 1 * * certbot renew --renew-hook "systemctl reload nginx"'>>/var/spool/cron/root && systemctl reload crond

# 泛域名
# 自动化 需要安装certbot 支持的dns 服务商插件,# yum install certbot-dns-<PLUGIN>;  或者通过dns API,下载第三方脚本完成验证
certbot run      --nginx -d *.ggok.top --agree-tos --email 1134614268@qq.com
certbot run      --nginx -d *.ggok.top --agree-tos --email 1134614268@qq.com --preferred-challenges dns-01
certbot run      --nginx -d *.ggok.top --agree-tos --email 1134614268@qq.com --preferred-challenges http-01
# 手动: preferred-challenges= dsn: 设置dns; dsn(preferred-challenges): ??
certbot certonly --manual -d *.ggok.top --agree-tos --email 1134614268@qq.com --preferred-challenges http-01
# http 手动设置, 未验证
#server {
#    rewrite ^(/.well-known/acme-challenge/.*) $1 break; # managed by Certbot
#    listen   80;
#    server_name ggok.top;
#    location / {
#        root   /usr/share/nginx/html;
#        index  index.html index.htm;
#    }
#    location = /.well-known/acme-challenge/vlYh97uXgTsWuzwlSQ-V_g6Z7cjHzTkmfvl8vqSUW-c{
#      default_type text/plain;
#      return 200 vlYh97uXgTsWuzwlSQ-V_g6Z7cjHzTkmfvl8vqSUW-c.1E1aVlRfrEI8KuqhiIkt49CJI_mQnd1C-QCfd0Cl3vk;
#      }
#}
#

certbot [子命令] [选项] [-d 域名] [-d 域名] ...
# 子命令: certonly 获取证书; run 获取证书,安装到你的 web 服务器; renew 更新已经获取但快过期的所有证书
#1.3 manual方式       使用交互式或脚本钩子的方式获取证书
#1.1 standalone, 没有搭建服务器的情况，因为默认采用80端口，如果有其他程序占用了，如nginx，需要先关闭。
#1.2 nginx|apache|webroot

#其他示例:
certbot certonly --manual -d test.ggok.top
certbot certonly --manual -d test.ggok.top --agree-tos --email 1134614268@qq.com --preferred-challenges dns --server https://acme-v02.api.letsencrypt.org/directory
certbot certonly --standalone -d www.domain.com
# 泛域名
certbot certonly --manual -d *.ggok.top --agree-tos --email 1134614268@qq.com  --preferred-challenges dns
#-d:  为那些主机申请证书,如果是通配符,输入 *.xxxx.com
#--preferred-challenges:  使用 DNS 方式校验域名所有权
#--server: Let’s Encrypt ACME v2 版本使用的服务器不同于 v1 版本,需要显示指定
#--agree-tos: 默认同意 Let’s Encrypt 的一些 agreements,不加这个参数在命令执行过程中还是会问用户是否同意；
#--email: 用来获取一些 Let’s Encrypt 的通知,比如证书过期之类；

用法:
  certbot [子命令] [选项] [-d 域名] [-d 域名] ...

Certbot工具用于获取和安装 HTTPS/TLS/SSL 证书。默认情况下，Certbot会尝试为本地网页服务器
(如果不存在会默认安装一个到本地)获取并安装证书。最常用的子命令和选项如下:

获取, 安装, 更新证书:
    (默认) run       获取并安装证书到当前网页服务器
    certonly        获取或更新证书，但是不安装
    renew           更新已经获取但快过期的所有证书
   -d 域名列表        指定证书对应的域名列表，域名之间使用逗号分隔

  --apache          使用Apache插件进行身份认证和安装
  --standalone      运行一个独立的网页服务器用于身份认证
  --nginx           使用Nginx插件进行身份认证和安装
  --webroot         把身份认证文件放置在服务器的网页根目录下
  --manual          使用交互式或脚本钩子的方式获取证书

   -n               非交互式运行
  --test-cert       从预交付服务器上获取测试证书
  --dry-run         测试获取或更新证书，但是不存储到本地硬盘

证书管理:
    certificates    显示使用Certbot生成的所有证书的信息
    revoke          撤销证书(supply --cert-path)
    delete          删除证书

管理你的Let's Encrypt账户
    register        创建Let's Encrypt ACME账户
  --agree-tos       同意ACME服务器的订阅协议
   -m EMAIL         接收有关账户的重要通知的邮箱地址

可选参数:
  -h, --help            显示帮助信息，然后退出
  -c 配置文件, --config 配置文件
                        配置文件的路径 (默认: /etc/letsencrypt/cli.ini
                        或 ~/.config/letsencrypt/cli.ini)
  -v, --verbose         当前参数可以重复使用多次来增加输出信息的详细程度，例如 -vvv.
                        (默认: -2)
  -n, --non-interactive, --noninteractive
                        非交互式运行，即运行过程中不需要询问用户输入，但需要额外的命令行
                        参数。当客户端发现参数缺失时会给出相应的说明。(默认: False)
  --force-interactive   无论Certbot是否以命令行的方式运行，强制交互式运行。当前参数不能
                        用于renew子命令。(默认: False)
  -d 域名列表, --domains 域名列表, --domain 域名列表
                        指定域名列表。如果有多个域名，可以多次使用-d参数，也可以在-d参数后
                        使用逗号分隔的域名列表。(默认: 询问)
  --cert-name 证书名称   指定证书名称。每次Certbot运行只使用一个证书名称。可以使用命令
                        'certbot certificates'查看已生成的证书名称。当创建新的证书时，
                        此选项用于指定证书的名称。(默认: 无)
  --dry-run             使用客户端执行一次试运行，获取测试证书(无效的证书)但不保存到磁盘。
                        当前选项仅用于'certonly'和'renew'子命令。
                        注: 尽管 --dry-run 选项试图阻止任何对系统的修改，但并不能做到
                        完全避免: 如果使用类似apache或nginx网页服务器来认证插件，
                        程序运行过程中，会尝试修改或恢复配置文件来获取测试证书，
                        也会重启网页服务器来部署和回滚这些修改。如果定义了 --pre-hook 和
                        --post-hook 选项它们会被同时执行，这两个选项有助于更精确地模拟
                        更新证书。--renew-hook 选项在这里不会被执行。(默认: False)
  --preferred-challenges PREF_CHALLS
                        A sorted, comma delimited list of the preferred
                        challenge to use during authorization with the most
                        preferred challenge listed first (Eg, "dns" or "tls-
                        sni-01,http,dns"). Not all plugins support all
                        challenges. See
                        https://certbot.eff.org/docs/using.html#plugins for
                        details. ACME Challenges are versioned, but if you
                        pick "http" rather than "http-01", Certbot will select
                        the latest version automatically. (default: [])
  --user-agent 用户代理
                        设置本客户端的用户代理信息。用户代理信息用于CA机构收集关于操作系统
                        和插件的使用成功率。如果你希望隐藏此信息，设置此选项为""。
                        (默认: CertbotACMEClient/0.12.0 (Ubuntu 16.04.2 LTS)
                        Authenticator/XXX Installer/YYY)

自动化:
  用于自动运行或其他情况的参数

  --keep-until-expiring, --keep, --reinstall
                        如果被请求的证书已经存在，那么不执行更新操作直到证书将要过期
                        (如果使用了'run'子命令，无论是否过期证书都会被更新)。
                        (默认: 询问)
  --expand              如果请求的证书名字是已经存在的证书名字的子集，那么这个本地证书
                        会被重置并重命名。(默认: 询问)
  --version             显示程序和版本号，然后退出
  --force-renewal, --renew-by-default
                        如果请求的证书已经存在，无论是否快要到期，更新该证书。
                        (通常使用 --keep-until-expiring 选项)。
                        该选项默认包含了 --expand 选项的功能。(默认: False)
  --renew-with-new-domains
                        如果被请求的证书已经存在，但是域名变了，那么无论该证书是否将要过期
                        都会被更新。(默认: False)
  --allow-subset-of-names
                        When performing domain validation, do not consider it
                        a failure if authorizations can not be obtained for a
                        strict subset of the requested domains. This may be
                        useful for allowing renewals for multiple domains to
                        succeed even if some domains no longer point at this
                        system. This option cannot be used with --csr.
                        (default: False)
  --agree-tos           同意ACME订阅协议 (默认: 询问)
  --duplicate           Allow making a certificate lineage that duplicates an
                        existing one (both can be renewed in parallel)
                        (default: False)
  --os-packages-only    (仅用于 certbot-auto) 安装系统依赖包，然后停止 (默认: False)
  --no-self-upgrade     (仅用于 certbot-auto) 禁止 certbot-auto 脚本自动升级自己到
                        新的发布版本 (默认: 自动升级)
  -q, --quiet           程序运行只输出错误信息。这个选项对于 cron 等自动化工具很有用。
                        该选项默认包含了 --non-interactive 选项的功能。(默认: False)

安全:
  有关安全的参数和服务器设置

  --rsa-key-size N      RSA密钥的大小。 (默认: 2048)
  --must-staple         为证书添加 OCSP Must Staple 扩展。当Apache版本高于2.3.3时，
                        自动配置 OCSP Stapling 支持。 (默认: False)
  --redirect            对于新认证的虚拟主机，自动重定向HTTP到HTTPS。 (默认: 询问)
  --no-redirect         对于新认证的虚拟主机，不要重定向HTTP到HTTPS。 (默认: 询问)
  --hsts                Add the Strict-Transport-Security header to every HTTP
                        response. Forcing browser to always use SSL for the
                        domain. Defends against SSL Stripping. (default:
                        False)
  --uir                 Add the "Content-Security-Policy: upgrade-insecure-
                        requests" header to every HTTP response. Forcing the
                        browser to use https:// for every http:// resource.
                        (default: None)
  --staple-ocsp         Enables OCSP Stapling. A valid OCSP response is
                        stapled to the certificate that the server offers
                        during TLS. (default: None)
  --strict-permissions  Require that all configuration files are owned by the
                        current user; only needed if your config is somewhere
                        unsafe like /tmp/ (default: False)

测试:
  The following flags are meant for testing and integration purposes only.

  --test-cert, --staging
                        Use the staging server to obtain or revoke test
                        (invalid) certs; equivalent to --server https://acme-
                        staging.api.letsencrypt.org/directory (default: False)
  --debug               Show tracebacks in case of errors, and allow certbot-
                        auto execution on experimental platforms (default:
                        False)
  --no-verify-ssl       Disable verification of the ACME server's certificate.
                        (default: False)
  --tls-sni-01-port TLS_SNI_01_PORT
                        Port used during tls-sni-01 challenge. This only
                        affects the port Certbot listens on. A conforming ACME
                        server will still attempt to connect on port 443.
                        (default: 443)
  --http-01-port HTTP01_PORT
                        Port used in the http-01 challenge. This only affects
                        the port Certbot listens on. A conforming ACME server
                        will still attempt to connect on port 80. (default:
                        80)
  --break-my-certs      Be willing to replace or renew valid certs with
                        invalid (testing/staging) certs (default: False)

路径:
  修改有关执行路径和服务器的参数

  --cert-path 证书路径
                        Path to where cert is saved (with auth --csr),
                        installed from, or revoked. (default: None)
  --key-path 密钥路径    Path to private key for cert installation or
                        revocation (if account key is missing) (default: None)
  --chain-path 钥匙链路径
                        Accompanying path to a certificate chain. (default:
                        None)
  --config-dir 配置文件目录
                        Configuration directory. (default: /etc/letsencrypt)
  --work-dir 工作目录    Working directory. (default: /var/lib/letsencrypt)
  --logs-dir 日志目录    Logs directory. (default: /var/log/letsencrypt)
  --server 服务器        ACME Directory Resource URI. (default:
                        https://acme-v01.api.letsencrypt.org/directory)

管理:
  Various subcommands and flags are available for managing your
  certificates:

  certificates          List certificates managed by Certbot
  delete                Clean up all files related to a certificate
  renew                 Renew all certificates (or one specified with --cert-
                        name)
  revoke                Revoke a certificate specified with --cert-path
  update_symlinks       Recreate symlinks in your /etc/letsencrypt/live/
                        directory

run:
  获取和安装证书的选项

certonly:
  修改获取证书方式的选项

  --csr CSR             Path to a Certificate Signing Request (CSR) in DER or
                        PEM format. Currently --csr only works with the
                        'certonly' subcommand. (default: None)

renew:
  The 'renew' subcommand will attempt to renew all certificates (or more
  precisely, certificate lineages) you have previously obtained if they are
  close to expiry, and print a summary of the results. By default, 'renew'
  will reuse the options used to create obtain or most recently successfully
  renew each certificate lineage. You can try it with `--dry-run` first. For
  more fine-grained control, you can renew individual lineages with the
  `certonly` subcommand. Hooks are available to run commands before and
  after renewal; see https://certbot.eff.org/docs/using.html#renewal for
  more information on these.

  --pre-hook PRE_HOOK   Command to be run in a shell before obtaining any
                        certificates. Intended primarily for renewal, where it
                        can be used to temporarily shut down a webserver that
                        might conflict with the standalone plugin. This will
                        only be called if a certificate is actually to be
                        obtained/renewed. When renewing several certificates
                        that have identical pre-hooks, only the first will be
                        executed. (default: None)
  --post-hook POST_HOOK
                        Command to be run in a shell after attempting to
                        obtain/renew certificates. Can be used to deploy
                        renewed certificates, or to restart any servers that
                        were stopped by --pre-hook. This is only run if an
                        attempt was made to obtain/renew a certificate. If
                        multiple renewed certificates have identical post-
                        hooks, only one will be run. (default: None)
  --renew-hook RENEW_HOOK
                        Command to be run in a shell once for each
                        successfully renewed certificate. For this command,
                        the shell variable $RENEWED_LINEAGE will point to the
                        config live subdirectory containing the new certs and
                        keys; the shell variable $RENEWED_DOMAINS will contain
                        a space-delimited list of renewed cert domains
                        (default: None)
  --disable-hook-validation
                        Ordinarily the commands specified for --pre-hook
                        /--post-hook/--renew-hook will be checked for
                        validity, to see if the programs being run are in the
                        $PATH, so that mistakes can be caught early, even when
                        the hooks aren't being run just yet. The validation is
                        rather simplistic and fails if you use more advanced
                        shell constructs, so you can use this switch to
                        disable it. (default: False)

certificates:
  列出由Certbot管理的所有证书信息

delete:
  用于删除证书的选项

revoke:
  用于撤销证书的选项

  --reason {keycompromise,affiliationchanged,superseded,unspecified,cessationofoperation}
                        Specify reason for revoking certificate. (default: 0)

register:
  用于账户注册和更新的选项

  --register-unsafely-without-email
                        Specifying this flag enables registering an account
                        with no email address. This is strongly discouraged,
                        because in the event of key loss or account compromise
                        you will irrevocably lose access to your account. You
                        will also be unable to receive notice about impending
                        expiration or revocation of your certificates. Updates
                        to the Subscriber Agreement will still affect you, and
                        will be effective 14 days after posting an update to
                        the web site. (default: False)
  --update-registration
                        With the register verb, indicates that details
                        associated with an existing registration, such as the
                        e-mail address, should be updated, rather than
                        registering a new account. (default: False)
  -m EMAIL, --email EMAIL
                        Email used for registration and recovery contact.
                        (default: Ask)
  --eff-email           Share your e-mail address with EFF (default: None)
  --no-eff-email        Don't share your e-mail address with EFF (default:
                        None)

unregister:
  用于注销账户的选项

  --account 账户ID       需要注销的账户ID (默认: 无)

install:
  用于修改证书部署路径的选项

  --fullchain-path 完整钥匙链的路径
                        Accompanying path to a full certificate chain (cert
                        plus chain). (default: None)

config_changes:
  Options for controlling which changes are displayed

  --num NUM             How many past revisions you want to be displayed
                        (default: None)

rollback:
  Options for rolling back server configuration changes

  --checkpoints N       Revert configuration N number of checkpoints.
                        (default: 1)

plugins:
  Options for for the "plugins" subcommand

  --init                Initialize plugins. (default: False)
  --prepare             Initialize and prepare plugins. (default: False)
  --authenticators      Limit to authenticator plugins only. (default: None)
  --installers          Limit to installer plugins only. (default: None)

update_symlinks:
  Recreates cert and key symlinks in /etc/letsencrypt/live, if you changed
  them by hand or edited a renewal configuration file

plugins:
  Plugin Selection: Certbot client supports an extensible plugins
  architecture. See 'certbot plugins' for a list of all installed plugins
  and their names. You can force a particular plugin by setting options
  provided below. Running --help <plugin_name> will list flags specific to
  that plugin.

  --configurator CONFIGURATOR
                        Name of the plugin that is both an authenticator and
                        an installer. Should not be used together with
                        --authenticator or --installer. (default: Ask)
  -a AUTHENTICATOR, --authenticator AUTHENTICATOR
                        Authenticator plugin name. (default: None)
  -i INSTALLER, --installer INSTALLER
                        Installer plugin name (also used to find domains).
                        (default: None)
  --apache              Obtain and install certs using Apache (default: False)
  --nginx               Obtain and install certs using Nginx (default: False)
  --standalone          运行一个独立的网页服务器用于获取证书。(默认: False)
  --manual              Provide laborious manual instructions for obtaining a
                        cert (default: False)
  --webroot             把身份认证文件放置在服务器的网页根目录下用于获取证书。
                        (默认: False)

nginx:
  Nginx网页服务器插件 - Alpha版本

  --nginx-server-root NGINX_SERVER_ROOT
                        Nginx server root directory. (default: /etc/nginx)
  --nginx-ctl NGINX_CTL
                        Path to the 'nginx' binary, used for 'configtest' and
                        retrieving nginx version number. (default: nginx)

standalone:
  启动一个临时的网页服务器

manual:
  Authenticate through manual configuration or custom shell scripts. When
  using shell scripts, an authenticator script must be provided. The
  environment variables available to this script are $CERTBOT_DOMAIN which
  contains the domain being authenticated, $CERTBOT_VALIDATION which is the
  validation string, and $CERTBOT_TOKEN which is the filename of the
  resource requested when performing an HTTP-01 challenge. An additional
  cleanup script can also be provided and can use the additional variable
  $CERTBOT_AUTH_OUTPUT which contains the stdout output from the auth
  script.

  --manual-auth-hook MANUAL_AUTH_HOOK
                        Path or command to execute for the authentication
                        script (default: None)
  --manual-cleanup-hook MANUAL_CLEANUP_HOOK
                        Path or command to execute for the cleanup script
                        (default: None)
  --manual-public-ip-logging-ok
                        Automatically allows public IP logging (default: Ask)

webroot:
  Place files in webroot directory

  --webroot-path WEBROOT_PATH, -w WEBROOT_PATH
                        public_html / webroot path. This can be specified
                        multiple times to handle different domains; each
                        domain will have the webroot path that preceded it.
                        For instance: `-w /var/www/example -d example.com -d
                        www.example.com -w /var/www/thing -d thing.net -d
                        m.thing.net` (default: Ask)
  --webroot-map WEBROOT_MAP
                        JSON dictionary mapping domains to webroot paths; this
                        implies -d for each entry. You may need to escape this
                        from your shell. E.g.: --webroot-map
                        '{"eg1.is,m.eg1.is":"/www/eg1/", "eg2.is":"/www/eg2"}'
                        This option is merged with, but takes precedence over,
                        -w / -d entries. At present, if you put webroot-map in
                        a config file, it needs to be on a single line, like:
                        webroot-map = {"example.com":"/var/www"}. (default:
                        {})

apache:
  Apache网页服务器插件 - Beta版本

  --apache-enmod APACHE_ENMOD
                        Path to the Apache 'a2enmod' binary. (default:
                        a2enmod)
  --apache-dismod APACHE_DISMOD
                        Path to the Apache 'a2dismod' binary. (default:
                        a2dismod)
  --apache-le-vhost-ext APACHE_LE_VHOST_EXT
                        SSL vhost configuration extension. (default: -le-
                        ssl.conf)
  --apache-server-root APACHE_SERVER_ROOT
                        Apache server root directory. (default: /etc/apache2)
  --apache-vhost-root APACHE_VHOST_ROOT
                        Apache server VirtualHost configuration root (default:
                        /etc/apache2/sites-available)
  --apache-logs-root APACHE_LOGS_ROOT
                        Apache server logs directory (default:
                        /var/log/apache2)
  --apache-challenge-location APACHE_CHALLENGE_LOCATION
                        Directory path for challenge configuration. (default:
                        /etc/apache2)
  --apache-handle-modules APACHE_HANDLE_MODULES
                        Let installer handle enabling required modules for
                        you.(Only Ubuntu/Debian currently) (default: True)
  --apache-handle-sites APACHE_HANDLE_SITES
                        Let installer handle enabling sites for you.(Only
                        Ubuntu/Debian currently) (default: True)

null:
  Null Installer