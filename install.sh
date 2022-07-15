#!/bin/bash --login
backup() {
  target=$1
  if [ -e "$target" ]; then
    if [ ! -L "$target" ]; then
      mv "$target" "$target.backup"
      echo "🎁 Moved your old $target config file to $target.backup"
    fi
  fi
}

symlink() {
  file=$1
  link=$2
  if [ ! -e "$link" ]; then
    echo "🔗 Symlinking your new $link"
    ln -s $file $link
  fi
}

for name in zshrc gitconfig tmux.conf p10k.zsh sh/do-gl.sh sh/ghc.sh sh/proxy.sh sh/tmux-work.sh ssh/config; do
  if [ ! -d "$name" ]; then
    target="$HOME/.$name"
    backup $target
    symlink $PWD/$name $target
  fi
done

source ~/.sh/proxy.sh
shopt -s expand_aliases
proxy_on

zsh_theme=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
if [ ! -d "$zsh_theme" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $zsh_theme
  echo "✅ powerlevel10k"
fi

zsh_syntax_highlighting=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
if [ ! -d "$zsh_syntax_highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $zsh_syntax_highlighting
  echo "✅ zsh-syntax-highlighting"
fi

zsh_autosuggestions=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
if [ ! -d "$zsh_autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions $zsh_autosuggestions
  echo "✅ zsh-autosuggestions"
fi

echo "👌 Install done"
