# If interactive
if [[ $- == *i* ]] && [[ -z "$TMUX" ]]
then
    tmux -2u attach || tmux -2u
fi
