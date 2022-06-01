export ZSH="/home/johnny/.oh-my-zsh"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

ZSH_THEME="robbyrussell"

plugins=(
  git
  wd
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

host_ip=$(cat /etc/resolv.conf | grep "nameserver" | cut -f 2 -d " ")

alias work="source ~/.sh/tmux-work.sh"
alias mine="source ~/.sh/tmux.sh"
alias ssh528="ssh node@10.10.5.28"
alias proxy_on="export https_proxy=http://$host_ip:7890 http_proxy=http://$host_ip:7890 all_proxy=socks5://$host_ip:7890"
alias proxy_off="unset http_proxy;unset https_proxy;unset HTTP_PROXY;unset all_proxy;"
alias cfg='code . && fg'
alias ghc="source ~/.sh/ghc.sh"