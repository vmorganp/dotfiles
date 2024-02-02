# If interactive
if [[ $- == *i* ]] && [[ -z "$TMUX" ]]
then
    tmux -2 attach || tmux -2
fi
