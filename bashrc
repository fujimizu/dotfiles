#PS1='[\u@\h \w]$ '
PS1='${debian_chroot:+($debian_chroot)}[\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]]\$ '

HISTCONTROL=ignoredups:ignorespace
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

umask 022

## aliases
alias ls='ls -F --color=auto'
alias la='ls -a'
alias ll='ls -al'
alias sl='ls'
alias vi='vim'
alias vie="vim '+e ++enc=euc-jp'"
alias viu="vim '+e ++enc=utf-8'"
alias memo='vi ~/text/ChangeLog'
alias cp='cp -p'
alias syn='synergys -f --config ${HOME}/conf/synergy.conf'
alias ty='tail -f /var/log/apache2/error.log'
alias grep='grep --color=auto'

## environment variables
export LANGUAGE=japanese
export LANG=ja_JP.UTF-8
export LOCALE=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export TERM=xterm-256color
export CLICOLOR=true  #for screen
#export LSCOLORS=dxfxfxfxbxfxfxBxBxDhDh
export EDITOR=vim
export PATH=${HOME}/bin:${HOME}/extlib/bin:${PATH}
export VIM=/usr/share/vim
export VIMHOME=${HOME}/.vim
export PAGER=lv
#export LD_LIBRARY_PATH=/usr/lib/octave-3.0.0
export JAVA_HOME=/usr/lib/jvm/java-7-oracle
export PERL_CPANM_OPT="--local-lib=~/extlib"
export PERL5LIB="$HOME/extlib/lib/perl5:$HOME/extlib/lib/perl5/x86_64-linux-gnu-thread-multi"

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
