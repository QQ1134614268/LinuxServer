1. server
    server_name与host匹配优先级如下:
    1,完全匹配 =
    2,通配符在前的,如*.test.com
    3,在后的,如www.test.*
    4,正则匹配,如~^\.www\.test\.com$
    如果都不匹配
        1,优先选择listen配置项后有default或default_server的
        2,找到匹配listen端口的第一个server块
2. listen
    nginx里面的server模块可以配置相同的端口,然后这里会根据不同的域名,跳转到不同的server模块中
    server name 为虚拟服务器的识别路径;因此不同的域名会通过请求头中的HOST字段,匹配到特定的server块,转发到对应的应用服务器中去

3. location:
    以 = 开头,表示精确匹配;如只匹配根目录结尾的请求,后面不能带任何字符串;
    以 ^~ 开头,表示uri以某个常规字符串开头,不是正则匹配
    以 ~ 开头,表示区分大小写的正则匹配;
    以 ~* 开头,表示不区分大小写的正则匹配
    以 / 开头,通用匹配, 如果没有其它匹配,任何请求都会匹配到

    (location =) > (location 完整路径) > (location ^~ 路径) > (location ~ ,~* 正则顺序) > (location 部分起始路径) > (/)

4. proxy_pass :
     参考: https://www.jb51.net/article/227243.htm

     http://localhost/proxy/abc.html:
          /proxy    http://127.0.0.1:8080        ->  http://localhost/proxy/abc.html
          /proxy/   http://127.0.0.1:8080        ->  http://localhost/proxy/abc.html
          /proxy/   http://127.0.0.1:8080/       ->  http://127.0.0.1:8080/abc.html
          /proxy/   http://127.0.0.1:8080/api/   ->  http://localhost/api/abc.html
          /proxy/   http://127.0.0.1:8080/api    ->  http://localhost/apiabc.html
          /proxy    http://127.0.0.1:8080/api    ->  http://localhost/api/abc.html
          /proxy    http://127.0.0.1:8080/       ->  http://localhost//abc.html

     相对路径与绝对路径拼接, 类似 os.path.join("/api", "/proxy/", "abc.html")  ??

5. rewrite :
    rewrite: rewrite跳转实现
    rewrite 执行顺序
    执行 server 块里面的 rewrite 指令;
    执行 location 匹配;
    执行选定的 location 中的 rewrite 指令;

    Nginx rewrite 的last,break,redirect,permanent有四种模式:
        last和break 都会跳转的rewrite的地址,区别是:
        last跳转后,会重新发起请求再匹配一次location,而break则只进行跳转,不再重新请求;
        当rewrite后的地址是一个直接可访问的地址时候,二者无区别
        当rewrite后地址是本地地址,需要匹配location再次进行路由的时候,last会进行匹配,break则直接返回404

        redirect和permanent都是重定向,区别是:
            redirect是302,临时重定向,浏览器每次请求都请求原网址,搜索引擎不会记住新网址,而且还可能认为是作弊
            permanent是301,永久重定向,浏览器缓存会记住新网址,当请求原网址,会直接向新网址请求,搜索引擎也会记住新网址;这样就可以减少中间过程,目的只是保留之前被大家熟知的域名

6. upstream :
   server {
       server_name gitee.com;
       location / {
           proxy_pass   http://myipconfig1;
       }
   }
   upstream myipconfig1{
       server gitee.com;
   }
7. return
    location | if 中: return 301 https://$host\$request_uri;

8. root alias
    root,会把请求url的 ip/域名+port替换为root指定的目录,访问资源
    alias,会把请求url的ip/域名+port+匹配到的路径替换为alias指定的目录,访问资源
    
    index的作用是,当实际访问的是一个目录时,会返回该目录中index指定的文件,如果该目录中不存在index指定的文件,则会返回403
    
    末尾 '/'
    /bar 表示我们把bar当成一个文件,想要访问bar文件
    bar/ 表示我们把bar当成一个目录,想要访问bar目录下index指定的文件

   9. nginx静态资源优化:
   使用 gzip 压缩
   合并文件
   redis缓存,浏览器缓存
   nginx参数:worker_processes worker_connections,send_file模式 tcp_nopush tcp_nodelay

   cdn,硬件,带宽

# host文件
# 159.75.92.195 gitee.com

