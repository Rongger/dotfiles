#!/bin/zsh

createSession() {
    tmux has-session -t $1
    if [ "$?" != 0 ]; then
        tmux new-session -s $1 -n script -d
        tmux send-keys -t $1 "wd wsl-projects && cd $1" C-m
        tmux send-keys -t $1 "source ~/.sh/do-gl.sh " C-m

        # tmux split-window -v
        # tmux send-keys -t $SESSIONNAME_0 "mobilestart_" C-m
        # tmux split-window -h
        # tmux send-keys -t $SESSIONNAME_0 "nya_" C-m
        # tmux last-pane
    fi
}

createSession "mobile_frontend"
createSession "management_frontend"
createSession "mobile_bff"
createSession "management_information_frontend"
createSession "unplugin-auto-re-export"

tmux attach -t "management_information_frontend"
