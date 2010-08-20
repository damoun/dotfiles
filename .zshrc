#!/bin/zsh
## .zshrc for colle in /u/epitech_2014/plenar_d/cu
## 
## Made by damien plenard
## Login   <plenar_d@epitech.net>
## 
## Started on  Tue May 25 14:07:58 2010 damien plenard
## Last update Thu May 27 15:23:42 2010 damien plenard
##

# Package
export PATH="/usr/local/sbin:/usr/local/bin"
# System
export PATH="${PATH}:/usr/sbin:/usr/bin:/sbin:/bin"

if [ ${USER} = 'plenar_d' ]
then
# Bocal
export PATH="${PATH}:/usr/site/sbin:/usr/site/bin"
# NetSoul
export PATH="${PATH}:/usr/netsoul/sbin:/usr/netsoul/bin"
# Heimdal
export PATH="${PATH}:/usr/heimdal/sbin:/usr/heimdal/bin"
# Arla
export PATH="${PATH}:/usr/arla/sbin:/usr/arla/bin"
fi

export EDITOR='emacs'
export HISTFILE="$HOME/.history"
export LOGCHECK='60'
export MAILCHECK=0
export PAGER='most'
export WATCH='all'
export WATCHFMT='%n has %a %l from %m at %T'

PROMPT='$ '
RPROMPT=""

######################################################################
###
### Options (man zshoptions)
###
######################################################################

######################################################################
##
## Changing Directories
##
######################################################################

setopt CHASE_DOTS
setopt CHASE_LINKS

######################################################################
##
## Completion
##
######################################################################

setopt ALWAYS_LAST_PROMPT
setopt AUTO_LIST
setopt AUTO_MENU
setopt LIST_AMBIGUOUS
setopt ALWAYS_TO_END
setopt AUTO_PARAM_SLASH
setopt COMPLETE_ALIASES
setopt COMPLETE_IN_WORD
unsetopt LIST_BEEP
setopt LIST_TYPES
setopt MENU_COMPLETE
setopt REC_EXACT

######################################################################
##
## History
##
######################################################################

setopt APPEND_HISTORY
setopt BANG_HIST
setopt EXTENDED_HISTORY
unsetopt HIST_BEEP
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt SHARE_HISTORY

######################################################################
##
## Initialisation
##
######################################################################

unsetopt ALL_EXPORT
unsetopt GLOBAL_RCS

######################################################################
##
## Input/Output
##
######################################################################

setopt ALIASES
setopt PRINT_EXIT_VALUE
setopt SUN_KEYBOARD_HACK

######################################################################
##
## Job Control
##
######################################################################

setopt AUTO_CONTINUE
setopt AUTO_RESUME
setopt CHECK_JOBS
setopt BG_NICE
setopt LONG_LIST_JOBS
setopt NOTIFY

######################################################################
##
## Prompting
##
######################################################################

setopt TRANSIENT_RPROMPT
setopt PROMPT_PERCENT

######################################################################
##
## Scripts and Functions
##
######################################################################

setopt C_BASES
setopt FUNCTION_ARGZERO

######################################################################
##
## Shell Emulation
##
######################################################################

setopt BSD_ECHO

######################################################################
##
## Zle
##
######################################################################

unsetopt BEEP
setopt EMACS
setopt ZLE

######################################################################
###
### Builtins (man zshbuiltins)
###
######################################################################

# Alias
alias msg='ns_send_msg'
alias c='clear'
alias ls='ls -Fh'
alias l='ls -l'
alias la='ls -la'
alias ne='emacs -nw'
alias j='jobs'
alias zz='zlock -immed'
alias reload=". ${HOME}/.zshrc"
alias bye='kdestroy;kill -9 -1'

######################################################################
###
### Zle (man zshzle)
###
######################################################################

bindkey -e
autoload zkbd

function zkbd_file() {
    [[ -f ~/.zkbd/${TERM}-${VENDOR}-${OSTYPE} ]] && printf '%s' ~/".zkbd/${TERM}-${VENDOR}-${OSTYPE}" && return 0
    [[ -f ~/.zkbd/${TERM}-${DISPLAY}          ]] && printf '%s' ~/".zkbd/${TERM}-${DISPLAY}"          && return 0
    return 1
}

[[ ! -d ~/.zkbd ]] && mkdir ~/.zkbd
keyfile=$(zkbd_file)
ret=$?
if [[ ${ret} -ne 0 ]]; then
    zkbd
    keyfile=$(zkbd_file)
    ret=$?
fi
if [[ ${ret} -eq 0 ]] ; then
    source "${keyfile}"
else
    printf 'Failed to setup keys using zkbd.\n'
fi
unfunction zkbd_file; unset keyfile ret

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

autoload -U tetris
zle -N tetris
bindkey ^T tetris

autoload -U   edit-command-line
zle -N        edit-command-line
bindkey '\ee' edit-command-line

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

clean()
{
    SEARCH='.'
    if [ ${1} ]
    then
	SEARCH=${1}
    fi
    find ${SEARCH} \( -name "*~" -or -name ".*~" -or -name "\#*" \) -exec rm -fv {} \;
}

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

#exec 2>> (while read line; do;
#    print '\e[91m'${(q)line}'' > /dev/tty; print -n $'\0'; done &)