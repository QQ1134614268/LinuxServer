# ip
ip addr show: 显示所有网络接口信息
ip addr show eth0: 显示特定网络接口信息
ip route show: 显示路由表
ip link set eth0 up: 启用或禁用网络接口
ip addr add 192.168.1.101/24 dev eth0: 添加 IP 地址到网络接口
ip addr del 192.168.1.101/24 dev eth0: 删除 IP 地址从网络接口
ip link set eth0 type hybrid mode promisc: 配置网络接口为混杂模式
ip -s -h link show eth0: # 网卡的统计信息，包括接收和发送的数据包数量（RX packets和TX packets）; 替换ifconfig
nload|iftop|vnstat : 更详细的网络统计信息,网络流量监控和统计报告

#ifconfig: 网卡, 查看收发包 # 不再维护,使用ip指令
    #    Link encap:以太网  硬件地址 02:42:cd:21:5c:81
    #    inet 地址:172.17.0.1  广播:0.0.0.0  掩码:255.255.0.0
    #    inet6 地址: fe80::42:cdff:fe21:5c81/64 Scope:Link
    #    UP BROADCAST RUNNING MULTICAST  MTU:1500  跃点数:1
    #    接收数据包:2892 错误:0 丢弃:0 过载:0 帧数:0
    #    发送数据包:3517 错误:0 丢弃:0 过载:0 载波:0
    #    碰撞:0 发送队列长度:0
    #    接收字节:187022 (187.0 KB)  发送字节:4771886 (4.7 MB)

