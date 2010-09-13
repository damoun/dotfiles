#!/bin/sh
## install.sh for install in /home/damienplenard
## 
## Made by Damien Plenard
## Login   <damienplenard@epitech.net>
## 
## Started on  Mon Sep 13 13:22:42 2010 Damien Plenard
## Last update Mon Sep 13 13:30:00 2010 Damien Plenard
##

function main()
{
    echo "Config will be installed";
    cp -fR .* ~/;
    echo "Let's go";
}

main();