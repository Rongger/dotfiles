#!/bin/zsh
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

for name in zshrc gitconfig tmux.conf sh/do-gl.sh sh/ghc.sh sh/tmux-work.sh; do
  if [ ! -d "$name" ]; then
    target="$HOME/.$name"
    backup $target
    symlink $PWD/$name $target
  fi
done

echo "👌 Install done"
