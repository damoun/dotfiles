#!/bin/bash

sudo cpan Term::ExtendedColor
git clone git://github.com/trapd00r/ls--.git
cd ls--
perl Makefile.PL
make && sudo make install
cd ../
cp ls++.conf $INSTALL_PATH/.ls++.conf