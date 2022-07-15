# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

ZSH_THEME="powerlevel10k/powerlevel10k"

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
alias c='code .'
alias cfg='code . && fg'
alias ghc="source ~/.sh/ghc.sh"
alias zource="source ~/.zshrc"
# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh