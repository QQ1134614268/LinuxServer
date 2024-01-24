git log -n 1 --date=format:'%Y-%m-%d %H:%M:%S' --pretty=format:%cd path/to/dir
#最后一次提交时间
git show --pretty=format:"%ci %cr" | head -1
#查看最后一次提交记录的修改文件信息
git show --raw

git submodule add http://xxx.com/xxx
git clone --recurse-submodules http://xxx
git submodule init
git submodule update
git submodule update --init
git submodule update --init --recurse

/usr/local/python3.7/bin/pyinstaller -p /root/PythonTemplate/src --noconfirm -F main.py

# mysql  查看mysql连接情况(进入mysql) show processlist
SELECT * from information_schema.processlist;

python3 -m venv fastapi_test

### 文件上传下载
ftpput -u root -p xxx -P 50221 44.39.19.14
scp
sshpass -p "password" scp -r -o StrictHostKeyChecking=no /root/.jenkins root@44.39.19.14:/root/.jenkins # 一键 , 无交互式
sftp
