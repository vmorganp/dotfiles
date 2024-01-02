#!/bin/bash
selected=$(find ~/Documents/Projects ~/Documents/tools ~ -mindepth 1 -maxdepth 1 -type d | rofi -dmenu -i -matching fuzzy -sorting-method fzf -sort )
if [[ -z $selected ]]; then
    exit 0
fi
neovide $selected
