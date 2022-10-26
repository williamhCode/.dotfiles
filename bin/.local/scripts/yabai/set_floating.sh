id=$(yabai -m query --windows --window \
    | jq -r '.space')

if [[ $id == $1 ]]; then
    yabai -m window "$YABAI_WINDOW_ID" --toggle float
fi

