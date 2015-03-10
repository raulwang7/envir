#! /bin/bash

rsync -a -v -u --exclude=.git --exclude=setenv* --exclude=*.swp ./ ~/

vim=$(whereis vim)
ctags=$(whereis ctags)
cscope=$(whereis cscope)

[ -z "$vim" ] && sudo apt-get install vim-gtk
[ -z "$ctags" -o -z "$cscope" ] && sudo apt-get install ctags cscope
