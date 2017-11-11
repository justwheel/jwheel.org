#!/bin/bash
#
# Author: Justin W. Flory
# Language: Shell
# Filename: update_from_git.sh
#
# Description:
#    Pulls latest changes from repository and copies latest changes to WWW
#    directory. The idea is to make updating the site painless and simple.
#

WWW_DIR=/var/www/justinwflory.com/public_html
GIT_DIR=$HOME/git/web/justinwflory.com/public_html

#####################################################
# Pull down the latest changes from GitHub          #
#####################################################
cd $GITDIR && git pull

#####################################################
# Synchronize new files into the web directory      #
#####################################################
rsync -rav $GIT_DIR/* $WWW_DIR

