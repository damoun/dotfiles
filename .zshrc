#!/bin/zsh
## .zshrc for zshrc in /u/epitech_2014/plenar_d/cu
## 
## Made by damien plenard
## Login   <plenar_d@epitech.net>
## 
## Started on  Tue May 25 14:07:58 2010 damien plenard
## Last update Tue Aug 24 22:37:01 2010 damien plenard
##

if [ -f $HOME/.zsh/env ]; then
    . $HOME/.zsh/env
fi

if [ -f $HOME/.zsh/path ]; then
    . $HOME/.zsh/path
fi

if [ -f $HOME/.zsh/opt ]; then
    . $HOME/.zsh/opt
fi

if [ -f $HOME/.zsh/alias ]; then
    . $HOME/.zsh/alias
fi

if [ -f $HOME/.zsh/function ]; then
    . $HOME/.zsh/function
fi

if [ -f $HOME/.zsh/bindkey ]; then
    . $HOME/.zsh/bindkey
fi

######################################################################
###
### Modules (man zshmodules)
###
######################################################################

zmodload zsh/compctl
zmodload zsh/complist
zmodload zsh/datetime
zmodload zsh/mathfunc
zmodload zsh/stat
zmodload zsh/system
zmodload zsh/zftp

######################################################################
###
### Usefull (personnal) functions
###
######################################################################



######################################################################
###
### Completion
###
######################################################################

autoload -U compinit
compinit

zstyle ':completion::complete:*' use-cache 1

local _myhosts
if [[ -f $HOME/.ssh/known_hosts ]]
then
_myhosts=( ${${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ }:#\!*}
           ${=${(f)"$(cat /etc/hosts(|)(N);(ypcat hosts &>/dev/null))"}%%\#*});
  zstyle ':completion:*' hosts $_myhosts
fi

zstyle ':completion:*:*:kill:*' menu yes select
compdef pkill=kill
compdef pkill=killall
zstyle ':completion:*:processes-names' command  'ps c -u ${USER} -o command | uniq'


zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns par '*?.o' '*?.c~' '\#*' '*?.old' '*?.pro'