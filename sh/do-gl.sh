#!/bin/zsh

if [ -n "$(git status -s)" ]; then
    echo "本地有更改"
    gs pull
else
    git pull
fi
