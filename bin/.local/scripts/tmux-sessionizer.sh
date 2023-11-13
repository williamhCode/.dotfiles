#!/bin/bash

if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(
  { 
    echo ~/;
    echo ~/.dotfiles;
    echo ~/.config/nvim; 
    echo ~/Documents/Notes;
    echo ~/Documents/Work/Resume stuff;
    find ~/Documents/Coding -mindepth 2 -maxdepth 2 -type d; 
  } | fzf)
fi

if [[ -z $selected ]]; then
  exit 0
fi

# selected_name=$(basename "$selected" | tr . _)
# get last two directories in path
selected_name=$(basename "$(dirname "$selected")")/$(basename "$selected")

# if tmux is not attached, create session or attach to session
if [[ -z $TMUX ]]; then
  tmux new-session -A -s "$selected_name" -c "$selected"

# if tmux is attached and session doesn't exist, create session
elif ! tmux has-session -t=$selected_name 2> /dev/null; then
  tmux new-session -ds "$selected_name" -c "$selected"
fi

# replace . with _ in selected_name
selected_name=${selected_name//./_}

# if tmux is attached, switch to session
tmux switch-client -t "$selected_name"

