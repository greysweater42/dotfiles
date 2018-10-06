# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# prompt colors
git_branch () { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'; }
HOST='\033[02;36m\h'; HOST=' '$HOST
TIME='\033[01;31m\t \033[01;32m'
LOCATION=' \033[01;34m`pwd | sed "s#\(/[^/]\{1,\}/[^/]\{1,\}/[^/]\{1,\}/\).*\(/[^/]\{1,\}/[^/]\{1,\}\)/\{0,1\}#\1_\2#g"`'
BRANCH=' \033[00;33m$(git_branch)\[\033[00m\]\n\$ '
PS1=$TIME$USER$HOST$LOCATION$BRANCH
PS2='\[\033[01;36m\]>'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias sudo='sudo '
fi

# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -l'

# tmux
alias t=tmux
alias tleft='tmux new-session -s left'
alias tright='tmux new-session -t left -s right'
# start tmux at startup
# tmux attach &> /dev/null
# if [[ ! $TERM =~ screen ]]; then
#     exec tmux
# fi

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# python
if [ "$(whoami)" == "tomek" ]; then
    alias python3.3=/opt/python3.3/bin/python3.3
    alias django-admin.py=/opt/python3.3/bin/django-admin.py
fi

# pyenv
if [ -d "$HOME/.pyenv" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    if command -v pyenv 1>/dev/null 2>&1; then
      eval "$(pyenv init -)"
    fi
    if [ -d "$HOME/.pyenv/plugins/pyenv-virtualenv" ]; then
        eval "$(pyenv virtualenv-init -)"
    fi
fi

# git
alias gitka='gitk --all'
alias gsta='git status'
alias glog='git log --oneline'

# R
alias rtest='Rscript -e "testthat::test_dir(\"tests\")"'
