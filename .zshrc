# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

export PROJECT_CYCLE=dev
export PROJECT_DIR=/wmd/software/$PROJECT_CYCLE

umask 002

#Use vi mode
set -o vi
bindkey -v

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="bpotter"

export DISABLE_AUTO_UPDATE=true
source $ZSH/oh-my-zsh.sh
unsetopt correct_all
setopt INTERACTIVE_COMMENTS
setopt EXTENDED_GLOB
source ~/.git_completion.sh

# Customize to your needs...

# Aliases for commands
alias ssh="ssh -Y"
alias nano="nano -w"
alias ff="find . -type f -iname 2>/dev/null"
alias ls="ls -CF --color=auto"
alias lessc="/usr/share/vim/vim72/macros/less.sh"
alias lsl="ls -trlh"
alias psg="ps aux | grep"
alias hg="history | grep"
alias ansi="gcc -Wall -pedantic -ansi"
alias grep="egrep"
alias duh="du -h --max-depth=1"
alias ack="ack-grep"
alias rscp="rsync -aP"
alias less="less -FRSX"
alias cbcopy="xsel --clipboard --input"
alias cbpaste="xsel --clipboard --output"
alias o="gnome-open"
alias sit="$HOME/code/personal/bpotter/sit_stand_log.py -s"
alias stand="$HOME/code/personal/bpotter/sit_stand_log.py -t"
alias away="$HOME/code/personal/bpotter/sit_stand_log.py -a"


# Aliases for servers
alias waasccaix="ssh bpott@waasccaix"

# git aliases
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit --verbose'
alias gd='git diff --color'
alias go='git checkout '
alias gh='git hist'
alias grb='for remote in `git branch -r | grep -v master `; do git checkout --track $remote ; done'

alias got='git '
alias get='git '
alias hit='git '

PATH=$PATH:$HOME/bin/:$HOME/code/anomaly_tools/bin
export PYTHONPATH=$HOME/lib/python:$HOME/code/anomaly_tools/lib/python:$HOME/code/waas_processor/python/src
export PYTHONPATH=$PYTHONPATH:/usr/share/pycentral/lsr:/opt/modok_django:/opt/modok_django/wsmon:$PROJECT_DIR/python:/wmd/software/prod/tools/lib
export LD_LIBRARY_PATH=/lib

# Testing for cx_Oracle_with_ctypes
# export PYTHONPATH=/opt/cx_oracle_on_ctypes/
# export LD_LIBRARY_PATH=/usr/lib/oracle/11.2/client64/lib
# export NLS_LANG=.UTF8
# export CX_ORACLE_USERNAME=cx_Oracle
# export CX_ORACLE_PASSWORD=dev
# export CX_ORACLE_TNSENTRY=XE
# export CX_ORACLE_ARRAY_SIZE=1024

export VISUAL=vim
export EDITOR=vim
ulimit -c unlimited
export ORACLE_HOME=/usr/lib/oracle/11.2/client64/
PATH=$ORACLE_HOME/bin:$PATH

#added for home and end keys by bjp
bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line

# Terminal colors for the ctrl-alt-f1 type shells:
if [ "$TERM" = "linux" ]; then
    _SEDCMD='s/.*\*color\([0-9]\{1,\}\).*#\([0-9a-fA-F]\{6\}\).*/\1 \2/p'
    for i in $(sed -n "$_SEDCMD" $HOME/.Xdefaults | \
               awk '$1 < 16 {printf "\\e]P%X%s", $1, $2}'); do
        echo -en "$i"
    done
    clear
fi

#OSX specific
if [ "`uname`" = "Darwin" ];then
alias ls='ls -CFG'
alias gvim=mvim
PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages
export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/7.2/bin/
export PATH=/usr/local/bin:$PATH # brew on osx
fi
