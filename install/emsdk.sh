#!/bin/bash

pkg_check() {
  if [ $(dpkg -l | grep $1 | wc -l) -ne 0 ]; then
    echo "1"
  else
    echo "0"
  fi
}

install_if_pkg_no_exist() {
  pkg=$1
  has_pkg=$(pkg_check $pkg)
  if [ $has_pkg -eq 0 ]; then
    sudo apt-get install $pkg
  fi
}

mkdir_force() {
  if [ ! -d $1 ]; then
    mkdir $1
  fi
}

install_if_pkg_no_exist cmake
install_if_pkg_no_exist python3
install_if_pkg_no_exist git

mkdir_force ~/lib

if [ ! -d ~/lib/emsdk ]; then
  cd ~/lib
  # Get the emsdk repo
  git clone https://github.com/emscripten-core/emsdk.git

  # Enter that directory
  cd emsdk

  # Download and install the latest SDK tools.
  ./emsdk install latest

  # Make the "latest" SDK "active" for the current user. (writes .emscripten file)
  ./emsdk activate latest

  # Activate PATH and other environment variables in the current terminal
  source ./emsdk_env.sh

  echo '👌 Emsdk install done'
fi
