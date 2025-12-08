#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    if command -v "fd" >/dev/null 2>&1; then
        selected=$(fd -H -I --max-depth 5 --prune --type d "^.git$" ~ | rev | cut -c 7- | rev | fzf)
    else
        selected=$(find ~ -maxdepth 5 -type f -path '*/.git/HEAD' | rev | cut -c 11- | rev | fzf)
    fi
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name
