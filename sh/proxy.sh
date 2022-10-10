#!/bin/zsh

export HOST_IP=$(cat /etc/resolv.conf | grep "nameserver" | cut -f 2 -d " ")
export PROXY_PORT=7890

alias proxy_on="export https_proxy=http://$HOST_IP:$PROXY_PORT http_proxy=http://$HOST_IP:$PROXY_PORT all_proxy=socks5://$HOST_IP:$PROXY_PORT"
alias proxy_off="unset http_proxy;unset https_proxy;unset HTTP_PROXY;unset all_proxy;"