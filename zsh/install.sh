#!/bin/bash

install_package "zsh"

cp zsh $INSTALL_PACKAGE/.zsh
cp -r zsh.d $INSTALL_PACKAGE/.zsh.d
