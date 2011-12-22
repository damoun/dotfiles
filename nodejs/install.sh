#!/bin/bash

install_package "build-essential"
install_package "openssl"
install_package "libssl-dev"
install_package "curl"

echo "Nodejs will be install but it's very take a long time, do you want to install now ? (y or n)"
read CONFIRM

if [[ "$CONFIRM" = "y" || "$CONFIRM" = "Y" ]]
then
    mkdir /tmp/node/
    cd /tmp/node/
    git clone https://github.com/joyent/node.git && cd node
    ./configure
    make
    sudo make install

    cd -
    rm -rf /tmp/node.js;

    curl http://npmjs.org/install.sh | sh
fi
