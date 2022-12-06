#!/bin/bash

export HOST_IP=$(cat /etc/resolv.conf | grep "nameserver" | cut -f 2 -d " ")
export PROXY_PORT=7890

export https_proxy=http://$HOST_IP:$PROXY_PORT http_proxy=http://$HOST_IP:$PROXY_PORT all_proxy=socks5://$HOST_IP:$PROXY_PORT

sudo apt update
sudo apt install zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub

read -p "复制 ssh 公钥到 github 认证密钥？[y]：" input
if [ $input = "y" ]; then
  echo "Host github.com
    Hostname ssh.github.com
    IdentityFile ~/.ssh/id_rsa
    Port 443 
    User git
    ProxyCommand nc -x $HOST_IP:$PROXY_PORT %h %p" > ~/.ssh/config

  git clone git@github.com:Rongger/dotfiles.git ~/dotfiles

  cd ~/dotfiles

  rm ~/.zshrc ~/.ssh/config

  bash ./init.sh
fi
