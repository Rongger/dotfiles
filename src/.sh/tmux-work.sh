#!/bin/zsh

SESSIONNAME_0="mobile"
SESSIONNAME_1="management"
SESSIONNAME_2="acn"
SESSIONNAME_3="bff"
SESSIONNAME_4="mobile2"

tmux has-session -t $SESSIONNAME_0
# if [ $? != 0 ]
if [ "$?" != 0 ]; then
    tmux new-session -s $SESSIONNAME_0 -n script -d
    tmux send-keys -t $SESSIONNAME_0 "wd wsl-projects && cd mobile_frontend" C-m
    tmux send-keys -t $SESSIONNAME_0 "source ~/.sh/do-gl.sh " C-m
    tmux send-keys -t $SESSIONNAME_0 "yarn start_" C-m
    # tmux split-window -v
    # tmux send-keys -t $SESSIONNAME_0 "mobilestart_" C-m
    # tmux split-window -h
    # tmux send-keys -t $SESSIONNAME_0 "nya_" C-m
    # tmux last-pane
fi

tmux has-session -t $SESSIONNAME_1
# if [ $? != 0 ]
if [ "$?" != 0 ]; then
    tmux new-session -s $SESSIONNAME_1 -n script -d
    tmux send-keys -t $SESSIONNAME_1 "wd wsl-projects && cd management_frontend" C-m
    tmux send-keys -t $SESSIONNAME_1 "source ~/.sh/do-gl.sh " C-m
    tmux send-keys -t $SESSIONNAME_1 "yarn start_" C-m
    # tmux split-window -v
    # tmux send-keys -t $SESSIONNAME_1 "managementstart_" C-m
    # tmux split-window -h
    # tmux send-keys -t $SESSIONNAME_1 "nya_" C-m
    # tmux last-pane
fi

# tmux has-session -t $SESSIONNAME_2
# # # if [ $? != 0 ]
# if [ "$?" != 0 ]
#  then
#     tmux new-session -s $SESSIONNAME_2 -n script -d
#     tmux send-keys -t $SESSIONNAME_2 "wd wsl-projects && cd acn" C-m
#     tmux send-keys -t $SESSIONNAME_2 "source ~/.sh/do-gl.sh " C-m
# fi

tmux has-session -t $SESSIONNAME_3
if [ "$?" != 0 ]; then
    tmux new-session -s $SESSIONNAME_3 -n script -d
    tmux send-keys -t $SESSIONNAME_3 "wd wsl-projects && cd mobile_bff" C-m
    tmux send-keys -t $SESSIONNAME_3 "source ~/.sh/do-gl.sh " C-m
    tmux send-keys -t $SESSIONNAME_3 "yarn dev" C-m
fi

# tmux has-session -t $SESSIONNAME_4
# if [ "$?" != 0 ]
#  then
#     tmux new-session -s $SESSIONNAME_4 -n script -d
#     tmux send-keys -t $SESSIONNAME_4 "wd wsl-projects && cd mobile2" C-m
#     tmux send-keys -t $SESSIONNAME_4 "source ~/.sh/do-gl.sh " C-m
#     tmux send-keys -t $SESSIONNAME_4 "yarn start_" C-m
# fi

tmux attach -t $SESSIONNAME_0
