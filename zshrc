export ZSH="$HOME/.oh-my-zsh"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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
alias npmg="npm list -g --depth=0 2>/dev/null"
alias yarng="yarn global list --depth=0 2>/dev/null"
alias fh="history | grep"
alias tag="source ~/dotfiles/sh/fast-tag.sh"
alias bff="source ~/dotfiles/sh/start-local-bff.sh"
alias pwsh="powershell.exe"
alias port_set="pwsh Set-Wsl-Netsh"
alias port_remove="pwsh Remove-Wsl-Netsh"
alias exp="explorer.exe"
alias count="ls -l | grep -c"
alias countf="count "^-""
alias countd="count "^d""
# docker
alias dl="docker ps -l -q"
alias dps="docker ps"
alias dpa="docker ps -a"
alias di="docker images"
alias dins="docker inspect"
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias dex="docker exec -i -t"
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/" | sed "s/['|\']//g" | sort; }

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[[ ! -f ~/.sh/proxy.sh ]] || source ~/.sh/proxy.sh

[[ ! -f ~/.gvm/scripts/gvm ]] || (source ~/.gvm/scripts/gvm && gvm use go1.19)

export PATH=$PATH:/usr/local/go/bin
