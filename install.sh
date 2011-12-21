#!/bin/bash
# Many of this code is a fork of MiniDump by arcanin
# on https://github.com/arcanin/MiniDump

NAME="PersonalConfig"
HOME_SCRIPT=`pwd`

function init_install_path
{
    INSTALL_PATH=${1:-"${HOME}"}
    while [[ "$INSTALL_PATH" = "" || ! -d "$INSTALL_PATH" ]]
    do
	echo "Home path $INSTALL_PATH can't be found !"
	echo -n "Please enter a valid path (or C-c to cancel): "
	read INSTALL_PATH
    done
    echo "$NAME will be installed in $INSTALL_PATH."
    echo -n "Press 'y' to continue, 'e' to edit or 'c' to cancel: "
    read CONFIRM
    if [[ "$CONFIRM" = "c" || "$CONFIRM" = "C" ]]
    then
    	exit 0
    elif [[ "$CONFIRM" = "e" || "$CONFIRM" = "E" ]]
    then
    	read INSTALL_PATH
    	init_install_path $INSTALL_PATH
    fi
}

function install_package
{
    if ( hash "apt-get" >& /dev/null )
    then
	sudo apt-get -qq install "$1"
    elif ( hash "yum" >& /dev/null )
    then
	sudo yum -q -y install "$1"
    elif ( hash "pkg_add" >& /dev/null )
    then
	sudo pkg_add -r "$1" >& /dev/null
    else
	echo "Can't find package installer"
	exit 1
    fi
}

function request_user_input
{
    local input;
    read -p "$1: " input < /dev/tty;
    echo $input
}

function request_user_pass
{
    local password
    stty -echo
    read -p "$1: " password < /dev/tty;
    stty echo
    echo $password
}

function exec_directory
{
    for dir in *
    do
	if [[ -d $dir && -x "$dir/install.sh" ]]
	then
	    echo "=== Install $dir ==="
	    cd $dir
	    source install.sh
	    cd $HOME_SCRIPT
	    echo "=== $dir installed ==="
	fi
    done
}

init_install_path $1
exec_directory
