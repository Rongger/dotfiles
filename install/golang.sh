#!/bin/zsh

if [ ! -d /usr/local/go ]; then
  cd ~

  wget -c https://go.dev/dl/go1.19.linux-amd64.tar.gz

  sudo tar -C /usr/local -xzf go1.19.linux-amd64.tar.gz

  rm ./go1.19.linux-amd64.tar.gz

  export PATH=$PATH:/usr/local/go/bin

  # for VS Code Go extension 
  go install -v github.com/ramya-rao-a/go-outline@latest
  go install -v golang.org/x/tools/gopls@latest
  go install -v golang.org/x/tools/cmd/goimports@latest

  echo '👌 Golang install done'
else
  export PATH=$PATH:/usr/local/go/bin
  echo '👽 Golang has existed'
fi
