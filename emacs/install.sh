#!/bin/bash

install_package "emacs"

cp emacs $INSTALL_PACKAGE/.emacs
cp -r emacs.d $INSTALL_PACKAGE/.emacs.d
