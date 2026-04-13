export ZSH="$HOME/.oh-my-zsh"

# nvm lazy-load
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
nvm() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  nvm "$@"
}
node() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  node "$@"
}
npm() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  npm "$@"
}
npx() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  npx "$@"
}

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  wd
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# tmux
alias ta="tmux attach -t"
alias tl="tmux list-sessions"
alias tk="tmux kill-session -t"
alias tn="tmux new-session -s"
alias work="source ~/dotfiles/sh/tmux-work.sh"
alias c='code .'
alias cfg='code . && fg'
alias gs="source ~/dotfiles/sh/git-stash.sh"
alias zource="source ~/.zshrc"
alias yyarn="yarn && yarn"
alias npmr="npm config get registry"
alias yarnr="yarn config get registry"
alias npmg="npm list -g --depth=0 2>/dev/null"
alias yarng="yarn global list --depth=0 2>/dev/null"
alias fh="history | grep"
alias tag="source ~/dotfiles/sh/fast-tag.sh"
alias bff="source ~/dotfiles/sh/start-local-bff.sh"
alias localgit="source ~/dotfiles/sh/reset-local-git-config.sh"
alias pwsh="powershell.exe"
alias port_set="pwsh Set-Wsl-Netsh"
alias port_remove="pwsh Remove-Wsl-Netsh"
alias port_fw_set="pwsh Set-FW-Port"
alias port_fw_remove="pwsh Remove-FW-Port"
alias chrome_no_cors="pwsh Open-Chrome-No-Cors"
alias ipconfig="pwsh ipconfig"
alias exp="explorer.exe"
alias count="ls -l | grep -c"
# alias countf="count "^-""
# alias countd="count "^d""
alias cfloginrc="cat ~/workspace/yzj/cloudflow/.cfloginrc.js"
# file preview
alias fpreview="fdfind --type f | fzf --preview 'batcat --color=always --style=numbers --line-range=:500 {}' "
# docker
alias dl="docker ps -l -q"
alias dps="docker ps"
alias dpa="docker ps -a"
alias di="docker images"
alias dins="docker inspect"
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias dex="docker exec -i -t"
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/" | sed "s/['|\']//g" | sort; }

# PATH
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$HOME/.local/bin:$PNPM_HOME:$HOME/.opencode/bin:/usr/local/go/bin:$PATH"

export PYTHON=/usr/bin/python3

#cfgit
alias cb="cfgit branch"
alias ccz="cfgit cz"
alias cm="cfgit merge"
alias cco="cfgit co"
alias cc="claude"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[[ ! -f ~/.sh/proxy.sh ]] || source ~/.sh/proxy.sh

[[ ! -f ~/.gvm/scripts/gvm ]] || (source ~/.gvm/scripts/gvm && gvm use go1.19)

. "$HOME/.local/bin/env"
