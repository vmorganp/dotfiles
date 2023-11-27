if [[ "$TERM" == "xterm-kitty" ]]
then
    tmux -2 attach || tmux -2
fi
