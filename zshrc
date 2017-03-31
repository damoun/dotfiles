ZSH=$HOME/.oh-my-zsh

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/projects
ZSH_THEME=dracula

plugins=(zsh-syntax-highlighting battery capistrano colorize cp colored-man command-not-found common-aliases debian django extract encode64 fabric git git-remote-branch github gitignore gpg-agent history history-substring-search pip python pep8 pylint rsync sudo svn systemadmin theme tmux urltools vagrant virtualenvwrapper wd golang)
export skip_global_compinit=1

REPORTTIME=10

PATH=$PATH:~/.bin/

source $ZSH/oh-my-zsh.sh

alias open='open_command'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias http='python -m SimpleHTTPServer'
alias reload="source ~/.zshrc && echo \"$fg[green]Sourced ~/.zshrc$fg[default]\""
