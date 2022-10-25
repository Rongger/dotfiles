#!/bin/zsh

if [ $(type -t pkg_check) == function ]; then
  return 0
fi

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
