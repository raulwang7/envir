#! /bin/sh

find . -maxdepth 1 -type f -a ! -iname "setenv.sh" -a ! -iname "*.swp" | awk -F '/' '{print $2}' | xargs -t -r -i cp {} ~/.{}

if [ ! -e ~/.vim ]; then
	cp -vrf vim ~/.vim
else
	rm -vrf ~/.vim; cp -vrf vim ~/.vim
fi

find . -maxdepth 1 -type d -a ! -iname ".git" -a ! -iname "vim" | awk -F '/' '{print $2}' | xargs -t -r -i cp -rf {} ~/{}


