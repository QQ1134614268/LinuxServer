# centos 安装iperf; 下载地址: https://iperf.fr/download/fedora/iperf3-3.1.3-1.fc24.x86_64.rpm
yum install -y iperf3

# windows 安装iperf3 https://iperf.fr/download/windows/iperf-3.1.3-win64.zip

# 开启服务端默认5001 -p 19001
iperf3 -s

# 运行iperf3在客户端
# 持续流模式, 测试带宽更准确
iperf3 -c ggok.top -t 30
# 测试高并发: 设置多个并行数据流-P
iperf3 -c ggok.top -P 3
# 测试最大带宽(使用UDP失败  -u)
iperf3 -c ggok.top -u

# 测试服务器接收带宽
iperf3 -c ggok.top -f M -t 10
# 测试服务器下载带宽
iperf3 -c ggok.top -f M -t 10 -R

#模式:
# 带宽测试模式：
#  使用UDP协议进行测试，可以测试极限带宽、时延抖动和丢包率等指标。
#  首先以链路理论带宽作为数据发送速率进行测试，
#  然后根据测试结果调整数据发送速率进行多次测试，
#  得出稳定的实际带宽。
# 持续流模式：
#  通过持续发送数据流来测试网络带宽的稳定性和可靠性。
#  在这种模式下，可以设置数据包的大小、发送速率和发送时间等参数，
#  以便更好地模拟实际应用场景。
# 并发模式：
#  通过同时发送多个数据流来测试网络带宽的并发处理能力。
#  在这种模式下，可以设置并发数、数据包大小和发送速率等参数，
#  以便更好地模拟高并发访问场景下的网络性能。

#-p, --port #，Server 端监听、Client 端连接的端口号；
#-f, --format [kmgKMG]，报告中所用的数据单位，Kbits, Mbits, KBytes, Mbytes；
#-i, --interval #，每次报告的间隔，单位为秒；
#-F, --file name，测试所用文件的文件名。如果使用在 Client 端，发送该文件用作测试；如果使用在 Server 端，则是将数据写入该文件，而不是丢弃；
#-A, --affinity n/n,m，设置 CPU 亲和力；
#-B, --bind ，绑定指定的网卡接口；
#-V, --verbose，运行时输出更多细节；
#-J, --json，运行时以 JSON 格式输出结果；
#--logfile f，输出到文件；
#-d, --debug，以 debug 模式输出结果；
#-v, --version，显示版本信息并退出；
#-h, --help，显示帮助信息并退出。
#Server 端参数：
#-s, --server，以 Server 模式运行；
#-D, --daemon，在后台以守护进程运行；
#-I, --pidfile file，指定 pid 文件；
#-1, --one-off，只接受 1 次来自 Client 端的测试，然后退出。
#Client 端参数
#-c, --client ，以 Client 模式运行，并指定 Server 端的地址；
#-u, --udp，以 UDP 协议进行测试；
#-b, --bandwidth #[KMG][/#]，限制测试带宽。UDP 默认为 1Mbit/秒，TCP 默认无限制；
#-t, --time #，以时间为测试结束条件进行测试，默认为 10 秒；
#-n, --bytes #[KMG]，以数据传输大小为测试结束条件进行测试；
#-k, --blockcount #[KMG]，以传输数据包数量为测试结束条件进行测试；
#-l, --len #[KMG]，读写缓冲区的长度，TCP 默认为 128K，UDP 默认为 8K；
#--cport ，指定 Client 端运行所使用的 TCP 或 UDP 端口，默认为临时端口；
#-P, --parallel #，测试数据流并发数量；
#-R, --reverse，反向模式运行（Server 端发送，Client 端接收）；
#-w, --window #[KMG]，设置套接字缓冲区大小，TCP 模式下为窗口大小；
#-C, --congestion ，设置 TCP 拥塞控制算法（仅支持 Linux 和 FreeBSD ）；
#-M, --set-mss #，设置 TCP/SCTP 最大分段长度（MSS，MTU 减 40 字节）；
#-N, --no-delay，设置 TCP/SCTP no delay，屏蔽 Nagle 算法；
#-4, --version4，仅使用 IPv4；
#-6, --version6，仅使用 IPv6；
#-S, --tos N，设置 IP 服务类型（TOS，Type Of Service）；
#-L, --flowlabel N，设置 IPv6 流标签（仅支持 Linux）；
#-Z, --zerocopy，使用 “zero copy”（零拷贝）方法发送数据；
#-O, --omit N，忽略前 n 秒的测试；
#-T, --title str，设置每行测试结果的前缀；
#--get-server-output，从 Server 端获取测试结果；
#--udp-counters-64bit，在 UDP 测试包中使用 64 位计数器（防止计数器溢出）。
