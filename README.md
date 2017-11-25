# dotfiles
my .dotfiles folder

includes all my files starting with "." from my home directory that are likely to be customised (.vimrc, .vim, .tmux.conf, .bashrc etc.)

## Prerequisites

    sudo apt-get install git
    sudo apt-get install tmux
    sudo apt-get install vim
    sudo apt-get install r-base-core

## Installation

    git clone https://github.com/tomis9/dotfiles ~/.dotfiles
    ln -s ~/.dotfiles/bashrc ~/.bashrc
    ln -s ~/.dotfiles/vimrc ~/.vimrc
    ln -s ~/.dotfiles/Rprofile ~/.Rprofile
    ln -s ~/.dotfiles/gitconfig ~/.gitconfig
    ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf


