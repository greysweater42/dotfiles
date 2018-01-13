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

Last but not least, you should update three vim plugins:

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

- vim-gitgutter

When you start using buffers (as a more convenient method for using multiple files than tabs) you quickly find out there's a missing shortcut for switching between buffers, an equivalent to gt and gT. <leader>h and <leader>l seem to be the best candidates, however vim-gitgutter has already used <leader>hp (etc.) for it's own purposes and while using <leader>h you have to wait for unpleasantly long until vim realizes you don't want to strike any more keys. 

Here's what you should to to avoid this sort of behaviour: go to ~/.dotfiles/vim/bundle/vim-gitgutter/plugin/, ```vim gitgutter.vim``` and search for <Leader>h. Comment out all teh lines where this phrase appears.



_These changes will be ignored by git thanks to `ignore=dirty` option in .gitmodules._

### R tags

Some information about tags you may find on

https://developer.r-project.org/rtags.html

https://stat.ethz.ch/R-manual/R-devel/library/utils/html/rtags.html

and obviously in :h Nvim-R.

Here's what you have to do in order to make tags for R programming language work in vim:

mkdir -p ~/.R/source
cd ~/.R/source

wget https://cran.r-project.org/src/base/R-3/R-3.4.3.tar.gz
\# or a newer version that you find on https://cran.r-project.org/sources.html

tar -xvzf R-3.4.3.tar.gz 
rm R-3.4.3.tar.gz 

cd ~/.cache/Nvim-R/

in R console:

rtags(path = "~/.R/source", recursive = TRUE, ofile = "RTAGS")
nvimcom::etags2ctags("RTAGS", "Rtags")

and back in bash:
sudo apt install ctags
ctags --languages=C,Fortran,Java,Tcl -R -f RsrcTags ~/.R/source/

So far so good. Now you should be able to <C-]> functions like mapply or do_mapply.

And now the second part:

l <- rownames(installed.packages())
x <- c()
for (i in l) {
  tryCatch({
      download.packages(i, destdir = '~/.R/source')
    },
    warning = function(w) x <<- c(.GlobalEnv$x, w$message)
  )
}
x

which downloads all your installed packages into ~/.R/source. 

x contains names of the packages that were not downloaded because they are not from cran, but probably from github. You can clone them individually. 


cd ~/.R/source
cat \*.tar.gz | tar -xzvf - -i
rm \*.tar.gz 
find . -name tests -type d -exec rm -r {} +

cd ~/.cache/Nvim-R
R
rtags(path = "~/.R/source", recursive = TRUE, ofile = "RTAGS")
nvimcom::etags2ctags("RTAGS", "Rtags")
q()
ctags --languages=C,Fortran,Java,Tcl -R -f RsrcTags ~/.R/source/

There are still some hm "problems":

- only files from R/ directories should be loaded (removing tests folders is not that elegant)
- only functions from currently loaded libraries should be available

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

