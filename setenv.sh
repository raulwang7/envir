#! /bin/sh

rsync -a -v -u --exclude=.git --exclude=setenv* --exclude=*.swp ./ ~/
