# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Common bindings
alias ls='ls -a --color=auto'
alias sd='sudo shutdown -P now'
alias rb='sudo shutdown -r now'
alias diskspace="du -h /home/zg/ | sort -n -r | less"
alias sbrc='source ~/.bashrc'

alias dock='xrandr --output eDP-1 --off --output HDMI-1 --mode 1920x1080 --primary --pos 0x0'
alias undock='xrandr --output eDP-1 --auto --primary'

# History settings
export HISTFILESIZE=20000
export HISTSIZE=10000
shopt -s histappend

## Combine multiline commands into one in history
shopt -s cmdhist

## Ignore duplicates, ls without options and builtin commands
HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"

# XBPS Package Manager Commands

alias xu='sudo xbps-install -Su'
alias xi='sudo xbps-install -S'
alias xs='sudo xbps-query -Rs'
alias xro='sudo xbps-remove -o'

extract () {
   for archive in $*; do
       if [ -f $archive ] ; then
	   case $archive in
	       *.tar.bz2)   tar xvjf $archive    ;;
	       *.tar.gz)    tar xvzf $archive    ;;
	       *.bz2)       bunzip2 $archive     ;;
	       *.rar)       rar x $archive       ;;
	       *.gz)        gunzip $archive      ;;
	       *.tar)       tar xvf $archive     ;;
	       *.tbz2)      tar xvjf $archive    ;;
	       *.tgz)       tar xvzf $archive    ;;
	       *.zip)       unzip $archive       ;;
	       *.Z)         uncompress $archive  ;;
	       *.7z)        7z x $archive        ;;
	       *)           echo "don't know how to extract '$archive'..." ;;
	   esac
       else
	   echo "'$archive' is not a valid file!"
       fi
   done
}


PS1='[\u@\h \W]\$ '

