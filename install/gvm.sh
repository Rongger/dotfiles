#!/bin/zsh

if [ ! -d ~/.gvm ]; then
  sudo apt-get install curl git mercurial make binutils bison gcc build-essential

  zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

  source ~/.gvm/scripts/gvm

  gvm install go1.4 -B
  gvm use go1.4
  export GOROOT_BOOTSTRAP=$GOROOT
  gvm install go1.19

  echo '👌 Gvm install done'
else
  source ~/.gvm/scripts/gvm
  echo '👽 Gvm has existed'
fi
