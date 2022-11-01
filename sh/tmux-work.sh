#!/bin/zsh

createSession() {
  dir=$1
  session=$2
  tmux has-session -t $session
  if [ "$?" != 0 ]; then
    tmux new-session -s $session -n script -d
    tmux send-keys -t $session "wd $dir && cd $session" C-m
    tmux send-keys -t $session "source ~/.sh/do-gl.sh " C-m
  fi
}

main="wsl-projects"

createSession "yxb" "mobile_frontend"
# createSession "yxb" "management_frontend"

tmux attach -t "mobile_frontend"
