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

alias work="source ~/.sh/tmux-work.sh"
alias c='code .'
alias cfg='code . && fg'
alias ghc="source ~/.sh/ghc.sh"
alias zource="source ~/.zshrc"
alias npmr="npm config get registry"
alias yarnr="yarn config get registry"
alias fh="history | grep"
alias tag="source ~/dotfiles/sh/fast-tag.sh"
alias pwsh="powershell.exe"
alias port_set="pwsh wsl-netsh-set"
alias port_unset="pwsh wsl-netsh-unset"
alias exp="explorer.exe"
# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[[ ! -f ~/.sh/proxy.sh ]] || source ~/.sh/proxy.sh

[[ ! -f ~/.gvm/scripts/gvm ]] || (source ~/.gvm/scripts/gvm && gvm use go1.19)

export PATH=$PATH:/usr/local/go/bin
