#! /bin/sh

rsync -a -v -u --exclude=.git --exclude=setenv* --exclude=*.swp ./ ~/

vim=`whereis vim`
ctags=`whereis ctags`
cscope=`whereis cscope`

vim=`echo $vim | awk -F ':' '{print $2}'`
ctags=`echo $ctags | awk -F ':' '{print $2}'`
cscope=`echo $cscope | awk -F ':' '{print $2}'`

[ -z "$vim" ] && sudo apt-get install vim-gtk
[ -z "$ctags" -o -z "$cscope" ] && sudo apt-get install ctags cscope
