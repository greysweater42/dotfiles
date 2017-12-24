# dotfiles
**my personal .dotfiles folder**

Includes all my files starting with "." from my home directory that are likely to be customised (.vimrc, .vim, .tmux.conf, .bashrc etc.).

## Installation

### Installation with sudo privileges

1. **R** 

- installation
(installation based on https://www.digitalocean.com/community/tutorials/how-to-install-r-on-ubuntu-16-04-2)

```
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 
    sudo add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/' 

    sudo apt-get update
    sudo apt-get install r-base
```

- create libPath

```
    mkdir -p ~/.R/3.4.2
```

- install package colorout 

You may need these libraries:

```
    sudo apt-get install build-essential
    sudo apt-get install libcurl4-openssl-dev
    sudo apt-get install libssl-dev
```

and from R console:

```
    options(repos = "http://cran.us.r-project.org")
    .libPaths("~/.R/3.4.2")
    install.packages('devtools')
    library(devtools)
    install_github('jalvesaq/colorout')
```

2. **git**

```
    sudo apt-get install git
```

3. **tmux**

```
    sudo apt-get install tmux
```

4. **powerline**

```
    sudo apt-get install python-pip
    sudo pip install --upgrade pip
    sudo pip install setuptools
    sudo pip install powerline-status
```

or

```
    sudo apt-get install python3-pip
    sudo pip3 install --upgrade pip
    sudo pip install setuptools
    sudo pip install powerline-status
```
installing fonts (based on http://powerline.readthedocs.io/en/master/installation/linux.html#fonts-installation)

```
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir ~/.fonts
mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts/
mkdir -p ~/.config/fontconfig/conf.d
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
```

customizing

```
cd /usr/local/lib/python2.7/dist-packages/powerline/config_files/themes/tmux
sudo cp default.json default.json.bak
```

or

```
cd /usr/local/lib/python3.5/dist-packages/powerline/config_files/themes/tmux
sudo cp default.json default.json.bak
```

replace contents of default.json with (sudo vim)
```
{
    "segments": {                                                     
        "right": [
            {
                "function": "powerline.segments.common.bat.battery",  
                "name": "battery", 
                "args": {
                    "full_heart": "♥",
                    "empty_heart": "♥",
                    "online": "⚡︎ ",
                    "offline": " "
                }
            },
            {
                "function": "powerline.segments.common.time.date"
            },                      
            {
                "function": "powerline.segments.common.time.date",
                "name": "time",                      
                "args": {                                      
                    "format": "%H:%M",
                    "istime": true
                }
            }
        ]
    } 
}

```

5. **vim**

(installation based on https://gist.github.com/odiumediae/3b22d09b62e9acb7788baf6fdbb77cf8)

_Before you start, you probably need to install a few dependencies:_

```
sudo apt-get install python-dev
sudo apt-get install python3-setuptools
```

_and thn run_

```
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
```

### dotfiles installation

```
    git clone https://github.com/tomis9/dotfiles ~/.dotfiles
    cp .bashrc .bachrc_backup
    ln -sf ~/.dotfiles/bashrc ~/.bashrc
    ln -sf ~/.dotfiles/vimrc ~/.vimrc
    ln -sf ~/.dotfiles/Rprofile ~/.Rprofile
    ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
    ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
    ln -sf ~/.dotfiles/vim ~/.vim
```


_You may wish to update git configuration file with your own credentials:_

```
    git config --global user.email "email@example.com"
    git config --global user.name "me"

    cd ~/.dotfiles
    git submodule init
    git submodule update
    
    rm .bashrc_backup
```

Last but not least, you should update two vim plugins:

- neocomplete.vim

Unfortunately `min_pattern_length` is not supported as a global variable yet. You should update it manually by setting `min_pattern_length = 3` in `s:source` dictionary:

~/.dotfiles/vim/bundle/neocomplete.vim/autoload/neocomplete/sources/omni.vim

(~41st line)

~/.dotfiles/vim/bundle/neocomplete.vim/autoload/neocomplete/sources/member.vim

(~46th line).

- vim-colors-solarized

Vim needs slightly darker colors than the default version suggests. Change `s:base03` and `s:base02` to 233 and 234, respectively, in section `g:solarized_termcolors == 256` in 

`~/.dotfiles/vim/bundle/vim-colors-solarized/colors/solarized.vim`

file.


_Both changes will be ignored by git thanks to `ignore=dirty` option in .gitmodules._


### Installation without sudo privileges
*fingers crossed, you'll need it*

I highly recommend using Linuxbrew for local installations of your favourite software. More info at http://linuxbrew.sh/.

*not tested yet, may be not working*

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
test -d ~/.linuxbrew && PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
test -d /home/linuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
test -r ~/.bash_profile && echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.bash_profile
echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.profile

brew unlink openssl && brew link openssl --force
brew install vim --with-cscope --with-python --with-lua --override-system-vim


## Adding a submodule to a git repository

(example)
```
git submodule add https://github.com/vim-scripts/dbext.vim ./vim/bundle/dbext.vim
```

Don't forget to add `ignore = dirty` flag to .gitmodules file.


## Remove a submodule from a git repository

1. git submodule deinit -f -- a/submodule    
2. rm -rf .git/modules/a/submodule
3. git rm -f a/submodule

(based on https://stackoverflow.com/questions/1260748/how-do-i-remove-a-submodule)

