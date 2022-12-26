git log -n 1 --date=format:'%Y-%m-%d %H:%M:%S' --pretty=format:%cd path/to/dir
#最后一次提交时间
git show --pretty=format:"%ci %cr" | head -1
#查看最后一次提交记录的修改文件信息
git show --raw

/usr/local/python3.7/bin/pyinstaller -p /root/PythonTemplate/src --noconfirm -F main.py

# mysql  查看mysql连接情况(进入mysql)
show processlist;

python3 -m venv fastapi_test
