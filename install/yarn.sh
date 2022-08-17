#!/bin/zsh

if command -v yarn >/dev/null 2>&1; then
  echo '👽 yarn has existed'
else
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -

  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

  sudo apt update && sudo apt install --no-install-recommends yarn

  echo '👌 yarn install done'
fi
