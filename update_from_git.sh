#!/bin/bash
#
# Author: Justin W. Flory
# Language: Shell
# Filename: update_from_git.sh
#
# Description:
#    Automatically pulls latest changes from repository
#    for justinwflory.com from GitHub, deletes old site
#    data, and copies latest site changes to the virtual
#    host. The idea is to make updating the site as
#    painless and simple as possible.
#

WEBDIR=/var/www/justinwflory.com/public_html
GITDIR=$HOME/justinwflory.com/public_html

#####################################################
# Pull down the latest changes from GitHub          #
#####################################################
cd $GITDIR && git pull

#####################################################
# Delete all known files in web server directory    #
#####################################################
cd $WEBDIR && rm -r ap/ blog/ chat/ contact/ css/ fossmc/ irc/ lit/ music/ old/ index.html robots.txt

#####################################################
# Copy the files from the git repo into virtualhost #
#####################################################
cd $GITDIR
cp -r ap/ blog/ chat/ contact/ css/ fossmc/ irc/ lit/ music/ old/ index.html robots.txt $WEBDIR
