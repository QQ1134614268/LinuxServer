#kubernetes1.16.2版本，docker19.03版本
#在所有节点上安装Docker和kubeadm，kubenet
#部署Kubernetes Master
#部署容器网络插件
#部署 Kubernetes Node，将节点加入Kubernetes集群中

#安装kubeadm，kubelet和kubectl
yum install -y kubelet-1.16.2 kubeadm-1.16.2 kubectl-1.16.2
systemctl start kubelet
systemctl enable kubelet

# 部署k8s的master和node节点
kubeadm init   --apiserver-advertise-address=10.0.1.176 --image-repository registry.aliyuncs.com/google_containers   --kubernetes-version v1.16.0   --service-cidr=10.140.0.0/16 --pod-network-cidr=10.240.0.0/16
kubeadm join 10.0.1.176:6443 --token 1146ci.3elqkwg3b2sdqp6l --discovery-token-ca-cert-hash sha256:3562d07fbe47d39ddc04c9170464e2699f1328c08ded2bb0198bde9a55ce8e5e

kubectl apply -f xxx.yaml    # 例如kubectl apply -f nginx.yaml   这里是如果没有则创建，如果有则变更，比create好用
