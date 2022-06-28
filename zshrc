export ZSH="$HOME/.oh-my-zsh"
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

export HOST_IP=$(cat /etc/resolv.conf | grep "nameserver" | cut -f 2 -d " ")
export PROXY_PORT=7890

alias work="source ~/.sh/tmux-work.sh"
alias proxy_on="export https_proxy=http://$HOST_IP:$PROXY_PORT http_proxy=http://$HOST_IP:$PROXY_PORT all_proxy=socks5://$HOST_IP:$PROXY_PORT"
alias proxy_off="unset http_proxy;unset https_proxy;unset HTTP_PROXY;unset all_proxy;"
alias cfg='code . && fg'
alias ghc="source ~/.sh/ghc.sh"
alias zource="source ~/.zshrc"
# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
