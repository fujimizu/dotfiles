set prompt='[%n@%m %c]$ '
set history = 1000

limit coredumpsize 0
umask 022

## aliases
alias ls    ls -F --color
alias la    ls -a
alias ll    ls -al
alias sl    ls
#alias lv    jless
alias vi    vim
alias vie   "vim '+e ++enc=euc-jp'"
alias viu   "vim '+e ++enc=utf-8'"
alias memo  vi ~/text/ChangeLog
alias cp    cp -p
alias syn   synergys -f --config ${HOME}/conf/synergy.conf
alias ty    tail -f /var/log/apache2/error.log

## environment variables
setenv LANGUAGE japanese
setenv LANG ja_JP.UTF-8
setenv LOCALE ja_JP.UTF-8
setenv LC_ALL ja_JP.UTF-8
setenv TERM xterm-256color
setenv CLICOLOR true  #for screen
#setenv LSCOLORS dxfxfxfxbxfxfxBxBxDhDh
setenv EDITOR vim
setenv PATH ${HOME}/bin:${HOME}/extlib/bin:${PATH}
setenv VIM /usr/share/vim
setenv VIMHOME ${HOME}/.vim
setenv PAGER lv
#setenv LD_LIBRARY_PATH /usr/lib/octave-3.0.0
setenv JAVA_HOME /usr/lib/jvm/java-7-oracle
setenv PERL_CPANM_OPT "--local-lib=~/extlib"
setenv PERL5LIB "$HOME/extlib/lib/perl5:$HOME/extlib/lib/perl5/i386-freebsd-64int"
setenv SEN_HOME $HOME/local/sen-1.2.2.1
setenv CLASSPATH $SEN_HOME/lib/sen.jar #:$CLASSPATH

## include server list
if (-e ~/.srvlst.csh) then
  source ~/.srvlst.csh
endif

## include local setting file
if (-e ~/.cshrc.local) then
  source ~/.cshrc.local
endif

complete {finger,slogin,ssh,rlogin,rsh,rcp,nslookup,host,telnet,ping,traceroute} 'p/*/$hostnames/'
