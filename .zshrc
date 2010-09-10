#!/bin/zsh
## .zshrc for zshrc in /u/epitech_2014/plenar_d/cu
## 
## Made by damien plenard
## Login   <plenar_d@epitech.net>
## 
## Started on  Tue May 25 14:07:58 2010 damien plenard
## Last update Wed Aug 25 23:41:00 2010 damien plenard
##

if [ -f $HOME/.zsh/vers ]; then
    . $HOME/.zsh/vers
fi

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

if [ -f $HOME/.zsh/module ]; then
    . $HOME/.zsh/module
fi

if [ -f $HOME/.zsh/complete ]; then
    . $HOME/.zsh/complete
fi
