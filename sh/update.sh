#!/bin/zsh

# copy 指定路径
cp src/rc/.zshrc ~/.zshrc
cp src/.sh/do-gl.sh ~/.sh/do-gl.sh
cp src/.sh/ghc.sh ~/.sh/ghc.sh
cp src/.sh/tmux-work.sh ~/.sh/tmux-work.sh

source ~/.zshrc
echo "update done"
