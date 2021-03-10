FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive
ENV SHELL=/bin/zsh
RUN apt-get update && apt-get upgrade -y
# more common utilities that are less likely to change
RUN apt-get install curl wget zip unzip git python3 python3-pip zsh neofetch htop -y

# zsh stuff
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN git clone https://github.com/vmorganp/dotfiles ~/dotfiles

# make neovim plug work
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
#More specific stuff that is more prone to changing
RUN apt-get install neovim tmux stow docker-compose -y
RUN rm ~/.zshrc ~/.gitconfig ~/.gitignore_global ~/.nvimrc ~/.config/nvim/init.vim ~/.tmux.conf ~/.aws/config; exit 0
RUN stow -d ~/dotfiles -t ~ git neovim tmux zsh
# RUN
CMD zsh
