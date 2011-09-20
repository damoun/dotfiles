#!/bin/bash

mkdir -p "$INSTALL_PATH/.jogsoul.d/"
cp jogsoul.pl "$INSTALL_PATH/.jogsoul.d/"

echo ":server" > "$INSTALL_PATH/.jogsoul"
echo "ns-server.epita.fr" >> "$INSTALL_PATH/.jogsoul"

echo ":port" >> "$INSTALL_PATH/.jogsoul"
echo "4242" >> "$INSTALL_PATH/.jogsoul"

echo ":login" >> "$INSTALL_PATH/.jogsoul"
local login=$(request_user_input "Epitech login")
echo "$login" >> "$INSTALL_PATH/.jogsoul"

echo ":pass" >> "$INSTALL_PATH/.jogsoul"
local pass=$(request_user_pass "Socks password")
echo "$pass" >> "$INSTALL_PATH/.jogsoul"

echo ":logfile" >> "$INSTALL_PATH/.jogsoul"
echo "/tmp/jogsoul.log" >> "$INSTALL_PATH/.jogsoul"

echo ":location" >> "$INSTALL_PATH/.jogsoul"
local loca=`hostname`
echo "$loca" >> "$INSTALL_PATH/.jogsoul"

echo ":data" >> "$INSTALL_PATH/.jogsoul"
echo "Can't read messages" >> "$INSTALL_PATH/.jogsoul"
