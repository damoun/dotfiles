#!/bin/bash

NAME="PersonalConfig"

function init_install_path 
{
    INSTALL_PATH=${1:-"${HOME}"}
    while [[ "$INSTALL_PATH" == "" || ! -d "$INSTALL_PATH" ]]
    do
	echo "Home path $INSTALL_PATH can't be found !"
	echo -n "Please enter a valid path (or C-c to cancel): "
	read INSTALL_PATH
    done
    echo "$NAME will be installed in $INSTALL_PATH."
    echo -n "Press 'y' to continue, 'e' to edit or 'c' to cancel: "
    read CONFIRM
    if [[ "$CONFIRM" == "y" || "$CONFIRM" == "Y" ]]
    then
    	exit 0
    elif [[ "$CONFIRM" == "e" || "$CONFIRM" == "E" ]]
    then
    	read INSTALL_PATH
    	init_install_path $INSTALL_PATH
    fi
}

init_install_path $1
