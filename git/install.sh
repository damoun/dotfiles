#!/bin/bash

install_package "git"

local username=$(request_user_input "Git real user name");
git config --global user.name "${username}";

local email=$(request_user_input "Git email address");
git config --global user.email "${email}";

local login=$(request_user_input "Github login");
git config --global github.user "${login}";

local token=$(request_user_input "Github token");
git config --global github.token "${token}";
