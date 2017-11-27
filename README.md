# dotfiles
**my personal .dotfiles folder**

Includes all my files starting with "." from my home directory that are likely to be customised (.vimrc, .vim, .tmux.conf, .bashrc etc.).

## Installation

### prerequisites

* **R** 

- installation
(installation based on https://www.digitalocean.com/community/tutorials/how-to-install-r-on-ubuntu-16-04-2)

    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 
    sudo add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/' 
    sudo apt-get update
    sudo apt-get install r-base

- create libPath

    mkdir -p ~/.R/3.4.2

- install package colorout 
You may need these

    sudo apt-get install build-essential
    sudo apt-get install libcurl4-openssl-dev
    sudo apt-get install libssl-dev

and from R console:

    options(repos = "http://cran.us.r-project.org")
    .libPaths("~/.R/3.4.2")
    install.packages('devtools')
    library(devtools)
    install_github('jalvesaq/colorout')

* **git**

    sudo apt-get install git
    git config --global user.email "email@example.com"
    git config --global user.name "tomek"

* **tmux**

    sudo apt-get install tmux

* **powerline**

    sudo apt install python-pip
    sudo pip install setuptools
    sudo pip install powerline-status

* **vim**

(installation based on https://gist.github.com/odiumediae/3b22d09b62e9acb7788baf6fdbb77cf8)

    sudo apt-get remove --purge vim vim-runtime vim-gnome vim-tiny vim-gui-common
    sudo apt-get install liblua5.1-dev luajit libluajit-5.1 python-dev libperl-dev libncurses5-dev libatk1.0-dev libx11-dev libxpm-dev libxt-dev
    sudo rm -rf /usr/local/share/vim /usr/bin/vim
    cd
    git clone https://github.com/vim/vim
    cd vim
    git pull && git fetch
    ./configure \
    --enable-multibyte \
    --enable-perlinterp=dynamic \
    --enable-pythoninterp=dynamic \
    --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
    --enable-python3interp \
    --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
    --enable-luainterp \
    --with-luajit \
    --enable-cscope \
    --enable-gui=auto \
    --with-features=huge \
    --with-x \
    --enable-fontset \
    --enable-largefile \
    --disable-netbeans \
    --with-compiledby="yourname" \
    --enable-fail-if-missing
    make && sudo make install
    cd
    rm -r vim

### dotfiles installation

    git clone https://github.com/tomis9/dotfiles ~/.dotfiles
    cp .bashrc .bachrc_backup
    ln -sf ~/.dotfiles/bashrc ~/.bashrc
    ln -sf ~/.dotfiles/vimrc ~/.vimrc
    ln -sf ~/.dotfiles/Rprofile ~/.Rprofile
    ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
    ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
    ln -sf ~/.dotfiles/vim ~/.vim


_You may wish to update git configuration file with your own credentials:_
    git config --global user.email "email@example.com"
    git config --global user.name "me"

    cd ~/.dotfiles
    git submodule init
    git submodule update
    
    rm .bashrc_backup
