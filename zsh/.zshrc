# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/.cargo/bin

# doesn't spam me with my own name
DEFAULT_USER="morgan"

# Other path stuff
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin:$HOME/go/bin"
# export PIP_REQUIRE_VIRTUALENV=true

plugins=(
    git
    fancy-ctrl-z
    gh
    aws
    poetry
)

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
. ~/z.sh

# Aliases
alias gpg2=gpg
alias cdp="cd ~/Documents/Projects"
alias acl="clear"
alias venvactivate="source .venv/bin/activate"

# Git aliases
alias gdl="git diff HEAD^ HEAD"
alias gitundo="git reset --soft HEAD~1"
alias greset="git fetch && git branch --show-current | xargs -I{} git reset --hard remotes/origin/{}"
alias emptycommit="git commit --allow-empty -m \"update pull request (empty commit)\""
gcleanup ()
{
    echo "size before: $(du -sh .)"
    echo "branches before: $(git branch | wc -l)"
    # delete local branches that have been merged in origin
    git fetch origin --prune
    # garbage collection
    git gc
    # hard reset to default branch, delete branches that have already been merged into it
    default_branch=$( git rev-parse --abbrev-ref origin/HEAD | cut -c8-)
    echo "resetting to $default_branch and deleting merged branches..."
    git checkout $default_branch
    git reset --hard origin/$default_branch
    git branch --merged | egrep -v '(^\*|'$default_branch')' | xargs git branch -d
    echo "size after: $(du -sh .)"
    echo "branches after: $(git branch | wc -l)"
}

# App aliases
alias tmux="tmux -2"
alias ta="tmux -u attach"
alias v="~/nixvim/result/bin/nvim"
alias lg="lazygit"
alias nvd="neovide"

alias ,todo="v ~/todo.txt"
alias ,codespell='codespell --interactive 3 --write $(git ls-files)'


## Terraform aliases
alias tf=terraform
alias ,tfclean="rm -rf .terraform;rm .terraform.lock.hcl"
alias ,tfunlock="terraform force-unlock"

# package management aliases
## nix
alias hms="home-manager switch"
alias ngc="nix-collect-garbage --delete-old"
alias nup="nix-channel --update"
## apt
alias apup="sudo apt update && sudo apt upgrade -y && sudo apt clean"
## flatpak
alias flup="flatpak update && flatpak uninstall --unused"
## all
alias up="nup && hms && apup && flup"

# Pip use virtualenv and install requirements
alias ,pipreq="virtualenv venv && source ./venv/bin/activate && pip3 install -r requirements.txt"
alias ,pipuse="virtualenv venv && source ./venv/bin/activate"
alias ,findFiles='v "$(rg --files --hidden ~ | fzf)"'


#determines search program for fzf
if type ag &> /dev/null; then
    export FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
fi
#refer rg over ag
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi

# Fancy prompt with starship
eval "$(starship init zsh)"

# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# nix home manager
source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh

export GPG_TTY=$(tty)

# Allow direnv to run
eval "$(direnv hook zsh)"

# Ripgrep config
export RIPGREP_CONFIG_PATH="$HOME/dotfiles/ripgrep/ripgreprc"

