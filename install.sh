#! /bin/sh


function init_install_path
{
    INSTALL_PATH=$HOME
    while [ "$INSTALL_PATH" == "" ]
    do
	echo "Home path can't be found !"
	echo -n "Please enter this (or C-c): "
	read $INSTALL_PATH
    done
}

init_install_path
