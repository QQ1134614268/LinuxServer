yum install snapd
systemctl enable --now snapd.socket
ln -s /var/lib/snapd/snap /snap
snap install core;
snap refresh core
#yum remove certbot -y
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