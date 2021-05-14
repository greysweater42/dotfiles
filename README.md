# dotfiles
**my personal .dotfiles folder**

Includes all my files starting with "." from my home directory that are likely to be customised (.vimrc, .vim, .tmux.conf, .bashrc etc.).

## Installation

```
git clone https://github.com/greysweater42/dotfiles .dotfiles
```

```

ln -sf ~/.dotfiles/bashrc ~/.bashrc
ln -s ~/.dotfiles/bash_aliases ~/.bash_aliases

mkdir .config/nvim
ln -s ~/.dotfiles/init.vim ~/.config/nvim/
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# https://powerline.readthedocs.io/en/master/installation/linux.html#fontconfig
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mv PowerlineSymbols.otf ~/.local/share/fonts/
fc-cache -vf ~/.local/share/fonts/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

ln -sf ~/.dotfiles/i3/config ~/.config/i3/

ln -s ~/.dotfiles/settings.json ~/.config/Code/User/

```

### Installation

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
    mkdir -p ~/.R/3.4.4
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

4. **powerline**

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
