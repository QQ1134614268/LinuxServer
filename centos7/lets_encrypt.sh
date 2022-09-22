# 申请证书 https://blog.csdn.net/v6543210/article/details/121487387
# acm.sh申请
# 自动续期
# 定时任务脚本

curl  https://get.acme.sh | sh
alias acme.sh=~/.acme.sh/acme.sh
echo 'alias acme.sh=~/.acme.sh/acme.sh' >>/etc/profile

./acme.sh  --set-default-ca --server zerossl
./acme.sh  --issue -d  goodboy.com   --standalone  -m  goodboy@gmail.com

00 00 * * * root /root/.acme.sh/acme.sh --cron --home /root/.acme.sh &>/var/log/acme.sh.logs

acme.sh  --issue  -d clsn.io -d *.clsn.io  --webroot  /www/wwwroot/clsn.io/


acme.sh --issue  -d clsn.io   --clsn.io
acme.sh --issue  -d clsn.io  --nginx



acme.sh  --installcert  -d  <domain>.com   \
        --key-file   /etc/nginx/ssl/<domain>.key \
        --fullchain-file /etc/nginx/ssl/fullchain.cer \
        --reloadcmd  "service nginx force-reload"