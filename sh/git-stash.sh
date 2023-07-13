#!/bin/zsh

cmd="$@"

git stash
eval "git $cmd" 
git stash pop stash@\{0\}