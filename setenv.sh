#! /bin/sh

rsync -a -v -u --exclude=.git --exclude=setenv* --exclude=*.swp ./ ~/

sudo apt-get install ctags cscope
