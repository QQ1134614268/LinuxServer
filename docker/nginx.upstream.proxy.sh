server {
	server_name  gitee.com;
	location / {
		proxy_pass   http://myipconfig1; 
	}
}
upstream myipconfig1{
	server gitee.com;
}
# host文件
# 159.75.92.195 gitee.com