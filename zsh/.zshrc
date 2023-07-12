# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

plugins=(
    git
    fancy-ctrl-z
    gh
    aws

)

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
HIST_STAMPS="mm/dd/yyyy"

# Aliases
. ~/z.sh
alias tf=terraform
export GPG_TTY=$(tty)
alias gpg2=gpg
alias cdp="cd ~/Documents/Projects"
alias cdd="cd ~/Documents"
alias vim="nvim"
alias nvd="neovide --multigrid"
alias gdl="git diff HEAD^ HEAD"
alias git diff="echo 'run gdl to see the diff between current and last commit'; git diff;"
alias gitundo="git reset --soft HEAD~1"
alias vimrc="vim ~/.nvimrc"
alias awscreds="code ~/.aws/credentials"
alias tfclean="rm -rf .terraform;rm .terraform.lock.hcl"
alias tfunlock="terraform force-unlock"
alias awsssoall="cat ~/.aws/config | grep profile | cut -d ' ' -f2 | cut -d ']' -f1 | xargs -n 1 aws sso login --profile"
alias emptycommit="git commit --allow-empty -m \"update pull request (empty commit)\""
alias greset="git reset --hard remotes/origin/main; git checkout main; git reset --hard remotes/origin/main; git pull"
alias acl="clear"
alias lg="lazygit"
alias venvactivate="source .venv/bin/activate"
alias tmux="tmux -2"
alias v="nvim"

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin:$HOME/go/bin"
source "$HOME/.cargo/env"
DEFAULT_USER="morgan"

#determines search program for fzf
if type ag &> /dev/null; then
    export FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
fi
#refer rg over ag
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi

eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
