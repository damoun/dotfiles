#!/bin/bash

rm -rf $INSTALL_PATH/.fonts
cp -r fonts $INSTALL_PATH/.fonts

gconftool-2 --load ./gnome-terminal-conf.xml