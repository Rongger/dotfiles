#!/bin/zsh

if [ -n "$(git status -s)" ]; then
    echo "本地有更改"
else
    git pull
fi
