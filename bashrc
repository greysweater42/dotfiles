# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -l'

alias t=tmux
alias tll='tmux new-session -s left'
alias trr='tmux new-session -t left -s right'

# start tmux
# tmux attach &> /dev/null
# if [[ ! $TERM =~ screen ]]; then
#     exec tmux
# fi

# prompt colors
git_branch () { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'; }
HOST='\033[02;36m\h'; HOST=' '$HOST
TIME='\033[01;31m\t \033[01;32m'
LOCATION=' \033[01;34m`pwd | sed "s#\(/[^/]\{1,\}/[^/]\{1,\}/[^/]\{1,\}/\).*\(/[^/]\{1,\}/[^/]\{1,\}\)/\{0,1\}#\1_\2#g"`'
BRANCH=' \033[00;33m$(git_branch)\[\033[00m\]\n\$ '
PS1=$TIME$USER$HOST$LOCATION$BRANCH
PS2='\[\033[01;36m\]>'

# java settings for proper Hadoop running
if [ $USER == tomek ]; then
    export JAVA_HOME=/usr/local/java/
else
    export JAVA_HOME=/home/dyrkat/Programs/jdk1.8.0_181
fi
export PATH=$PATH:$JAVA_HOME/bin

# hadoop path
export HADOOP_HOME=/usr/local/hadoop
export PATH=$PATH:$HADOOP_HOME/bin

if [ "$(whoami)" == "tomek" ]; then
    alias python3.3=/opt/python3.3/bin/python3.3
    alias sudo='sudo '
    alias django-admin.py=/opt/python3.3/bin/django-admin.py
fi

export LD_LIBRARY_PATH=/usr/lib/jvm/jre/lib/amd64:/usr/lib/jvm/jre/lib/amd64/default

alias gitka='gitk --all'
alias gsta='git status'
alias glog='git log --oneline'

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
eval "$(pyenv virtualenv-init -)"

# prophet
export PROPHET_LOCAL_DIR="/home/dyrkat/prophet_all"
export C_INCLUDE_PATH=${PROPHET_LOCAL_DIR}/local-rdkafka/libs
export LIBRARY_PATH=${PROPHET_LOCAL_DIR}/local-rdkafka/libs/librdkafka

export LD_LIBRARY_PATH=${PROPHET_LOCAL_DIR}/local-rdkafka/libs/librdkafka
export LD_PRELOAD=${PROPHET_LOCAL_DIR}/local-rdkafka/libs/librdkafka/librdkafka.so

