# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#USER ADDED PATHS

#matlab
export PATH=/usr/local/MATLAB/R2012a/bin:$PATH
#zotero
export PATH=/opt/Zotero_linux-x86_64:$PATH
#lammps
export PATH=/home/jason/lammps/lammps-22Feb13/src:$PATH
export PYTHONPATH=/home/jason/lammps/lammps-22Feb13/python:$PYTHONPATH
export LD_LIBRARY_PATH=/home/jason/lammps/lammps-22Feb13/src:$LD_LIBRARY_PATH
export PYTHONPATH=/opt/mcgaugheygroup/ntpy/:$PYTHONPATH
export PYTHONPATH=/opt/mcgaugheygroup/ntpy/examples/lmppy/plot_realtime/:$PYTHONPATH

#tex
export PATH=/usr/share/texmf/tex/latex/iop:$PATH
export PATH=/usr/share/texlive/texmf-dist/tex/latex:$PATH


#lammps
export PATH=/home/jason/Dropbox/lammps-19Feb13/src:$PATH
#gulp
export PATH=/home/jason/Dropbox/gulp-4.1.0/Src:$PATH
export PATH=/home/jason/Dropbox/gulp-4.1.0/Library:$PATH
export GULP_LIB=/home/jason/Dropbox/gulp-4.1.0/Library
export GULP_DOC=/home/jason/Dropbox/gulp-4.1.0/Docs
#phonopy
export PATH=/home/jason/phonopy/phonopy-1.1/bin:$PATH
export PYTHONPATH=/home/jason/phonopy/phonopy-1.1/lib/python:$PYTHONPATH
#vesta
export PATH=/opt/VESTA-x86_64:$PATH
#datathief
export PATH=/opt/Datathief:$PATH
#slepc
export SLEPC_DIR=/home/jason/slepc-3.3-p3
export PETSC_DIR=/home/jason/petsc-3.3-p6
export PETSC_ARCH=arch-linux2-c-debug

#android
export PATH=${PATH}:~/Downloads/android-sdk-linux/tools
export PATH=${PATH}:~/Downloads/android-sdk-linux/platform-tools

#USER ADDED FUNCTIONS
#cpyclip
cpyc() {
  pwd | xclip -selection clipboard
}
#printscreenwindow
psw() {
  file=${1:?"error: I need a filename"}
  import ${file}
}
#sed_remove
sed_rm() {
  string=${1:?"error: I need a string"}
  file=${2:?"error: I need a file"}
  sed '/${string}/d' ${file}
}

#kevin
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
	}
	
export PS1='\[\033[01;34m\]\u@\h\[\033[01;32m\] \w\[\033[01;31m\]$(parse_git_branch) \[\033[01;32m\]\$\[\033[00m\] '



# Set Hadoop-related environment variables
export HADOOP_HOME=/usr/local/hadoop

# Set JAVA_HOME (we will also configure JAVA_HOME directly for Hadoop later on)
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64

# Some convenient aliases and functions for running Hadoop-related commands
unalias fs &> /dev/null
alias fs="hadoop fs"
unalias hls &> /dev/null
alias hls="fs -ls"

# If you have LZO compression enabled in your Hadoop cluster and
# compress job outputs with LZOP (not covered in this tutorial):
# Conveniently inspect an LZOP compressed file from the command
# line; run via:
#
# $ lzohead /hdfs/path/to/lzop/compressed/file.lzo
#
# Requires installed 'lzop' command.
#
lzohead () {
    hadoop fs -cat $1 | lzop -dc | head -1000 | less
}

# Add Hadoop bin/ directory to PATH
export PATH=$PATH:$HADOOP_HOME/bin

# gcutil
export PATH=$PATH:$HOME/gcutil-1.8.4

#Qt
export PATH=$PATH:/opt/Qt/5.1.1/gcc_64/bin/
export QT_PATH=/opt/Qt/5.1.1/gcc_64/bin/

#ROS
export PATH=$PATH:/opt/ros/groovy/bin/
export PYTHONPATH=/opt/ros/groovy/lib/python2.7/:$PYTHONPATH
source /home/jason/spiralgen/ros_groovy_base/cmu/devel/setup.bash

#webots
export WEBOTS_HOME=/usr/local/webots
export LD_LIBRARY_PATH=${WEBOTS_HOME}/lib:${LD_LIBRARY_PATH}
export PYTHONPATH=${WEBOTS_HOME}/lib/python:${PYTHONPATH}
