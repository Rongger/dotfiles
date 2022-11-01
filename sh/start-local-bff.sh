#!/bin/zsh

sessionName="mobile_bff"

tmux has-session -t $sessionName

if [ "$?" != 0 ]; then
  tmux new-session -s $sessionName -n script -d

  tmux split-window -h
  tmux send-keys -t $sessionName "redis-server" C-m

  tmux select-pane -L
  tmux send-keys -t $sessionName "wd yxb mobile_bff" C-m
  tmux send-keys -t $sessionName "source ~/.sh/do-gl.sh" C-m
  tmux send-keys -t $sessionName "port_set 8001" C-m
  tmux send-keys -t $sessionName "yarn start" C-m
fi

tmux attach -t $sessionName
