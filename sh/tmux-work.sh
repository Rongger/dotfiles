#!/bin/zsh

SESSION="dev"

tmux has-session -t $SESSION 2>/dev/null
if [ "$?" != 0 ]; then
  tmux new-session -s $SESSION -n main -d
  tmux send-keys -t $SESSION "wd yzj" C-m

  # 水平分割：左(0) | 右(1)
  tmux split-window -h -t $SESSION
  tmux send-keys -t $SESSION:0.1 "wd yzj" C-m

  # 左 pane 垂直分割：左上(0) / 左下(1)
  tmux split-window -v -t $SESSION:0.0
  tmux send-keys -t $SESSION:0.0 "wd yzj" C-m

  # 右 pane 垂直分割：右上(2) / 右下(3)
  tmux split-window -v -t $SESSION:0.2
  tmux send-keys -t $SESSION:0.3 "wd yzj" C-m

  # 聚焦到第一个 pane
  tmux select-pane -t $SESSION:0.0
fi

tmux attach -t $SESSION
