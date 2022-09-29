#!/bin/bash

sudo apt-get update

sudo apt-get install \
  ca-certificates \
  curl \
  gnupg \
  lsb-release

# Add Docker’s official GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Use the following command to set up the repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

sudo apt-get update

read -p "是否安装指定 Docker 版本？[y/n]：" input
if [ $input = "y" ]; then
  apt-cache madison docker-ce
  read -p "请输入指定版本 [e.g., 5:20.10.16~3-0~ubuntu-jammy]：" VERSION_STRING

  echo $VERSION_STRING
  # sudo apt-get install docker-ce=$VERSION_STRING docker-ce-cli=$VERSION_STRING containerd.io docker-compose-plugin
else
  # Install the latest version of Docker Engine, containerd, and Docker Compose
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
fi

sudo apt-get install docker-compose

sudo service docker start

echo '👌 Docker install done'
