调研/产品/需求/代码/测试/CICD
# todo 测试k8s
# 测试k8s, docker-compose, Portainer,gitlab/CICD,Jenkins

CI/CD:
  工具:
    Jenkins
    gitlab/CICD
    k8s:
      rancher
      dashboard
      weave-scope
    Portainer
    #  Portainer
    #  shipyard
    #  DockerUI
  作用:
    自动化测试
    自动化部署
    可扩展,持续改进

需求指标:
  一键部署,自动更新,webHook
  易扩展,跨主机
  web可视化:
    监控功能
    收集日志
  容器化
  测试功能
实现方案:
  docker: 已经完成
  docker可视化管理平台??: k8s rancher gitlab/CICD
  es日志收集??
  日志可视化工具??
  日志大数据处理能力kafka

容器化技术:
  Docker:
  LXC是一种轻量级虚拟化技术,可以提供隔离和安全性
  Containerd
容器化平台:
  k8s: 容器编排系统, 非docker运行
  rancher: 搭建,管理k8s
  docker-compose: 容器编排 无UI;  场景: 少量容器;

docker:
  docker客户端->docker服务端(dockerd)->containerd
  Docker利用containerd作为其容器运行时的组件,来提供对容器生命周期的管理和操作功能
  containerd从Docker项目中分离出来
  containerd实现了CRI规范,可以被k8s集成
