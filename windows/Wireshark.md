## Wireshark
<pre>
wireshark:
  localhost: 捕获 loopback
  卡死:
    - 取消 编辑/首选项/Protocols/TLS 选项
    - 取消 接口混杂模式
</pre>

## 捕获过滤器(语法类似tcpdump)
1. host 127.0.0.1

## 显示过滤器
1. ip 过滤
   ip.src == 127.0.0.1
   ip.dst == 127.0.0.1

2. 协议过滤
   http
   sip
   udp

3. 端口过滤
   tcp.port == 80
   tcp.srcport == 127.0.0.1
   tcp.dstport == 80

4. 包长度过滤
   frame.len == 119 # 整个数据包长度，从ethernet层开始到最后
   ip.len == 100 # 除了以太网头固定长度14，从IP Header到IP payload的总长度
   udp.length == 26 # header + body
   tcp.len > 36

5. 支持的语法(类 Python?)
   == > >=  () ! not and or eq

6. 其他 过滤
   frame.time >= "2023-01-00 10:10:10"

   tcp.stream == 5
   tcp.options.sack
   tcp.analysis.out_of_order
   tcp.analysis.retransmission
   tcp.flags.reset == 1

   http.request.method == "GET"
   http.request.uri == "/api/hello"
   http contains "Host: "
   http.content_type
