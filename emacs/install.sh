#!/bin/bash

install_package "emacs"

cp emacs $INSTALL_PACKAGE/.emacs
cp emacs.d $INSTALL_PACKAGE/.emacs.d
