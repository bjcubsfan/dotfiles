# Path to your oh-my-zsh configuration.
source ~/.local_secrets.sh
export ZSH=$HOME/.oh-my-zsh
export GOPATH=/home/bpotter/code/go
umask 002
# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME=$MY_ZSH_THEME
#export DISABLE_AUTO_UPDATE=true
source $ZSH/oh-my-zsh.sh
export  HISTSIZE=100000
unsetopt correct_all
setopt INTERACTIVE_COMMENTS
setopt EXTENDED_GLOB
setopt NULL_GLOB
source ~/.git_completion.sh
source ~/.pycompletion.sh

# Customize to your needs...

# Aliases for commands
alias vi="vim"
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
alias rscp="rsync -aP"
alias less="less -FRSX"
alias cbcopy="xsel --clipboard --input"
alias cbpaste="xsel --clipboard --output"
alias sit="$HOME/code/waas/personal/bpotter/sit_stand_log.py -s"
alias stand="$HOME/code/waas/personal/bpotter/sit_stand_log.py -t"
alias away="$HOME/code/waas/personal/bpotter/sit_stand_log.py -a"
alias oocalc="libreoffice --calc"
alias h="sha256sum"
alias jamc="rdesktop -g 1000x1390 -a 16 -P -z -u 'bj ctr potter' -d faa -K jamcxww00108332.amc.faa.gov -r clipboard:CLIPBOARD"
alias bigjamc="rdesktop -g 1900x2048 -a 16 -P -z -u 'bj ctr potter' -d faa -K jamcxww00108332.amc.faa.gov -r clipboard:CLIPBOARD"
alias ping="ping -4"
alias dt="date '+%Y-%m-%dT%H:%M'"
function acro() {rg -i "$@" $HOME/projects/*acro*;}
function cdw() {cd `cdw.py "$@"`;}
function o() {/usr/bin/vendor_perl/mimeopen "$@"&;} #xdg-open is flakey

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

# Selecta shortcuts
alias pk='kill `ps aux | selecta | awk '\''{print $2 }'\''`'

PATH=$PATH:$HOME/bin:$HOME/code/waas/tools/bin:$HOME/code/waas/go/bin
export PYTHONPATH="$HOME/code/resiliency/django/:$HOME/code/waas/tools/lib/:$HOME/code/waas/pcaptools/waas_brewery/:$HOME/waas/code/pcaptools/waas_brewery/waas_brewery/:$HOME/code/open_source_passphrase/"
export LD_LIBRARY_PATH=/lib

export VISUAL=vim
export EDITOR=vim
ulimit -c unlimited
export DYLD_LIBRARY_PATH=$ORACLE_HOME
export LD_LIBRARY_PATH=$ORACLE_HOME
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

#Mac OSX specific
if [ "`uname`" = "Darwin" ];then
alias ls='ls -CFG'
alias gvim=mvim
alias vimdiff=mvim -d
alias o=open
alias ping="ping"
alias h="shasum -a 256"
export PATH=/Users/bpotter/miniconda3/bin:/usr/local/bin:/usr/local/sbin:/Applications:$PATH # brew on osx
# export PATH=/Library/Frameworks/Python.framework/Versions/7.2/bin:$PATH # EPD OS X
eval `/usr/libexec/path_helper -s`
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# added by Miniconda3 3.7.0 installer
export PATH="$PATH:/home/bpotter/miniconda3/bin"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#Use vi mode
set -o vi
bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
export KEYTIMEOUT=1

# Fix a problem with gpg/git
export GPG_TTY=$(tty)
