#!/bin/bash
#
#  Customize BASH PS1 prompt to show current SVN repository and Revision.
#  Customize BASH PS1 prompt to show current GIT repository and branch.
#

#  SETUP CONSTANTS
#  Bunch-o-predefined colors.  Makes reading code easier than escape sequences.
#  I don't remember where I found this.  o_O

# Reset
color_off="\[\033[0m\]"       # Text Reset

# Regular Colors
black="\[\e[0;30m\]"        # Black
red="\[\e[0;31m\]"          # Red
green="\[\e[0;32m\]"        # Green
yellow="\[\e[0;33m\]"       # Yellow
blue="\[\e[0;34m\]"         # Blue
purple="\[\e[0;35m\]"       # Purple
cyan="\[\e[0;36m\]"         # Cyan
white="\[\e[0;37m\]"        # White

# Bold
bblack="\[\e[1;30m\]"       # Black
bred="\[\e[1;31m\]"         # Red
bgreen="\[\e[1;32m\]"       # Green
byellow="\[\e[1;33m\]"      # Yellow
bblue="\[\e[1;34m\]"        # Blue
bpurple="\[\e[1;35m\]"      # Purple
bcyan="\[\e[1;36m\]"        # Cyan
bwhite="\[\e[1;37m\]"       # White

# Underline
ublack="\[\e[4;30m\]"       # Black
ured="\[\e[4;31m\]"         # Red
ugreen="\[\e[4;32m\]"       # Green
uyellow="\[\e[4;33m\]"      # Yellow
ublue="\[\e[4;34m\]"        # Blue
upurple="\[\e[4;35m\]"      # Purple
ucyan="\[\e[4;36m\]"        # Cyan
uwhite="\[\e[4;37m\]"       # White

# Background
on_black="\[\e[40m\]"       # Black
on_red="\[\e[41m\]"         # Red
on_green="\[\e[42m\]"       # Green
on_yellow="\[\e[43m\]"      # Yellow
on_blue="\[\e[44m\]"        # Blue
on_purple="\[\e[45m\]"      # Purple
on_cyan="\[\e[46m\]"        # Cyan
on_white="\[\e[47m\]"       # White

# High Intensty
iblack="\[\e[0;90m\]"       # Black
ired="\[\e[0;91m\]"         # Red
igreen="\[\e[0;92m\]"       # Green
iyellow="\[\e[0;93m\]"      # Yellow
iblue="\[\e[0;94m\]"        # Blue
ipurple="\[\e[0;95m\]"      # Purple
icyan="\[\e[0;96m\]"        # Cyan
iwhite="\[\e[0;97m\]"       # White

# Bold High Intensty
bi_black="\[\e[1;90m\]"      # Black
bi_red="\[\e[1;91m\]"        # Red
bi_green="\[\e[1;92m\]"      # Green
bi_yellow="\[\e[1;93m\]"     # Yellow
bi_blue="\[\e[1;94m\]"       # Blue
bi_purple="\[\e[1;95m\]"     # Purple
bi_cyan="\[\e[1;96m\]"       # Cyan
bi_white="\[\e[1;97m\]"      # White

# High Intensty backgrounds
on_iblack="\[\e[0;100m\]"   # Black
on_ired="\[\e[0;101m\]"     # Red
on_igreen="\[\e[0;102m\]"   # Green
on_iyellow="\[\e[0;103m\]"  # Yellow
on_iblue="\[\e[0;104m\]"    # Blue
on_ipurple="\[\e[10;95m\]"  # Purple
on_icyan="\[\e[0;106m\]"    # Cyan
on_iwhite="\[\e[0;107m\]"   # White

# Various variables you might want for your PS1 prompt instead
time12h="\T"
time12a="\@"
path_short="\w"
path_full="\W"
new_line="\n"
jobs="\j"

__svn_rev ()
{
	svn info 2>/dev/null | awk '/Revision:/ {print $2;}'
}

__svn_clean ()
{
	state=$(svn status -q 2>/dev/null | wc -l)
	if [ $state != 0 ]; then
		echo "$2"
	else
		echo "$1"
	fi
}

__svn_stat ()
{
	rev=$(__svn_rev)
	if [ $rev ]; then
		local_status=$(__svn_clean "" "*")
		echo [$rev$local_status]
	fi
}

__git_branch()
{
	git branch 2>/dev/null | awk '/\*/ {print $2;}'
}

__git_clean ()
{
	state=$(git status 2>/dev/null | grep "nothing to commit" | wc -l)
	if [ $state != 0 ]; then
		echo "$1"
	else
		echo "$2"
	fi
}

__git_stat ()
{
	branch=$(__git_branch)
	if [ $branch ]; then
		local_status=$(__git_clean "" "*")
		echo [$branch$local_status]
	fi
}

__stat()
{
	if [ -d .svn ] || [ -d .git ]; then
		[ -d .svn ] && __svn_stat
		[ -d .git ] && __git_stat
	else
		[ $(__svn_rev) ] && __svn_stat
		[ $(__git_branch) ] && __git_stat
	fi
}

PS1=$(echo $PS1 | awk -F '$' '{print $1}')'${debian_chroot:+($debian_chroot)}\u@\h:\w'$byellow'$(__stat)'$color_off'\$ '
