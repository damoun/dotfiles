#!/bin/bash

install_package "git"

local username=$(request_user_input "Git real user name")
git config --global user.name "${username}"

local email=$(request_user_input "Git email address")
git config --global user.email "${email}"

local login=$(request_user_input "Github login")
git config --global github.user "${login}"

local token=$(request_user_input "Github token")
git config --global github.token "${token}"

git config --global achievement.upload "true"

echo "Host github.com" > $INSTALL_PATH/.ssh/config
echo "    StrictHostKeyChecking no" >> $INSTALL_PATH/.ssh/config

git clone "git@github.com:${login}/git-achievements.git"

if [ -d "$INSTALL_PATH/.git-achievements/" ]
then
    rm -rf $INSTALL_PATH/.git-achievements
fi

mv -f git-achievements/ $INSTALL_PATH/.git-achievements