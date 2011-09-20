#!/bin/bash

install_package "emacs"

cp emacs $INSTALL_PATH/.emacs
rm -rf $INSTALL_PATH/.emacs.d
cp -r emacs.d $INSTALL_PATH/.emacs.d
