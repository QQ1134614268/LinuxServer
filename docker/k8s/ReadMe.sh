容器化技术:
  docker:
  LXC是一种轻量级虚拟化技术，可以提供隔离和安全性
docker:
  docker客户端->docker服务端(dockerd)->containerd
  Docker利用containerd作为其容器运行时的组件，来提供对容器生命周期的管理和操作功能
  containerd从Docker项目中分离出来
  containerd实现了CRI规范,可以被k8s集成

容器化平台:
  k8s
  docker-compose
  rancher

CI/CD:
  Jenkins
  gitlab/CICD

需求指标:
  一键部署
  自动更新
  可视化
  容器化
  监控功能
  收集日志
  测试功能
实现方案:
  docker: 已经完成
  docker可视化管理平台??: k8s rancher gitlab/CICD
  es日志收集??
  日志可视化工具??
  日志大数据处理能力kafka
