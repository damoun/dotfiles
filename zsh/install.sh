#!/bin/bash

install_package "zsh"

cp zshrc $INSTALL_PATH/.zshrc
rm -rf $INSTALL_PATH/.zsh.d
cp -r zsh.d $INSTALL_PATH/.zsh.d

chsh -s /bin/zsh
