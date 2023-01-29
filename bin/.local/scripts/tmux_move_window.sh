if [[ $1 == "e" ]]; then
    tmux move-window -t 100
else
    tmux move-window -b -t "$1"
fi
