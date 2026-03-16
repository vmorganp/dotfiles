# doesn't spam me with my own name
DEFAULT_USER="morgan"

# Other path stuff
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin:$HOME/go/bin"
export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/.cargo/bin
# export PIP_REQUIRE_VIRTUALENV=true

###################################################### WE HAVE OH MY ZSH AT HOME
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

autoload -U compinit; compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

######################################################################## Aliases
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
alias v="nvim"
alias lg="lazygit"
alias nvd="neovide"

alias ,todo="v ~/todo.txt"
alias ,timesheet='python3 /Users/13582995/Documents/projects/timesheet/main.py'
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
alias ,pipreq="source ./venv/bin/activate && pip3 install -r requirements.txt"
alias ,pipuse="python3 -m virtualenv venv && source ./venv/bin/activate"
alias ,findFiles='v "$(rg --files --hidden ~ | fzf)"'

# Mac wm stuff
alias ,maci3="yabai --start-service && skhd --start-service && sudo yabai --load-sa"

# Fuzzy find browser marks
alias ,bookmarks="cat $HOME/Library/Application\ Support/BraveSoftware/Brave-Browser/Default/Bookmarks | jq '.roots.bookmark_bar.children.[].url' | fzf | xargs -I{} /Applications/Brave\ Browser.app/Contents/MacOS/Brave\ Browser {}"

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
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


###################################################################### Nix stuff
# nix home manager
# source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
# Allow direnv to run
# eval "$(direnv hook zsh)"

export GPG_TTY=$(tty)


# Ripgrep config
export RIPGREP_CONFIG_PATH="$HOME/dotfiles/ripgrep/.ripgreprc"

# Stop AWS from doing the annoying less thing
export AWS_PAGER=""

# pacman
alias ,pacInstall="sudo pacman -Sy"
alias ,pacSearch="pacman -Ss"
alias ,pacUpdate="pacman -Syu"

# bitwarden SSH keys
export SSH_AUTH_SOCK=/home/$(whoami)/.bitwarden-ssh-agent.sock
# # pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

cat ~/todo.txt
