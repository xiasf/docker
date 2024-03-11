#!/bin/sh

set -ex

# CentOS7 下 Docker 安装
# https://vuepress.mirror.docker-practice.com/install/centos/

# 卸载旧版本
# sudo yum remove docker \
#                   docker-client \
#                   docker-client-latest \
#                   docker-common \
#                   docker-latest \
#                   docker-latest-logrotate \
#                   docker-logrotate \
#                   docker-selinux \
#                   docker-engine-selinux \
#                   docker-engine

# 安装依赖包
sudo yum install -y yum-utils

# 官方源
# $ sudo yum-config-manager \
#     --add-repo \
#     https://download.docker.com/linux/centos/docker-ce.repo

# 使用 国内源
sudo yum-config-manager \
    --add-repo \
    https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

sudo sed -i 's/download.docker.com/mirrors.aliyun.com\/docker-ce/g' /etc/yum.repos.d/docker-ce.repo

# 安装 Docker
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# 启用 Docker 服务
sudo systemctl enable docker
sudo systemctl start docker

# 建立 docker 用户组 (可选)
# sudo groupadd docker
# sudo usermod -aG docker $USER

# 镜像加速
cat > /etc/docker/daemon.json << EOF
{
  "registry-mirrors": [
    "https://docker.mirrors.sjtug.sjtu.edu.cn",
    "https://dockerproxy.com",
    "https://h5m24cso.mirror.aliyuncs.com",
    "https://hub-mirror.c.163.com",
    "https://mirror.baidubce.com",
    "https://docker.mirrors.ustc.edu.cn"
  ],
  "exec-opts": [
    "native.cgroupdriver=systemd"
  ],
  "log-driver": "json-file",
  "log-opts": {
    "cache-disabled": "false",
    "cache-max-file": "5",
    "cache-max-size": "20m",
    "cache-compress": "true",
    "max-size": "256m",
    "max-file": "12",
    "compress": "true"
  }
}
EOF
sudo systemctl restart docker

# 如果遇到停止后无法启动请执行
# systemctl stop containerd && systemctl start containerd && systemctl start docker.service

# 测试 Docker 是否安装正确
docker run --rm hello-world
