#!/bin/zsh

user_host=$1
pub_key_path=~/.ssh/id_rsa.pub

if [ "$user_host" = "" ]; then
  echo "缺少参数：user@host"
  return
fi

if [ ! -f $pub_key_path ]; then
  ssh-keygen -t rsa
fi

ssh-copy-id -i $pub_key_path $user_host
