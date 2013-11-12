# ZSH OPTIONS
setopt extendedglob

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

#--------------------------------------------------------------------------------
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#--------------------------------------------------------------------------------
ZSH_THEME="dieter"

#--------------------------------------------------------------------------------
# Plugins
#--------------------------------------------------------------------------------
plugins=(git github colorize nyan lol archlinux themes web-search svn rsync)

# Load Oh-my-zsh
source $ZSH/oh-my-zsh.sh

#--------------------------------------------------------------------------------
# Update PATH & EDITOR
#--------------------------------------------------------------------------------
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin
export EDITOR='emacs -nw'


#--------------------------------------------------------------------------------
# Set Pager to `most` if it is available.
#--------------------------------------------------------------------------------
command -v most &> /dev/null && export PAGER=most

#--------------------------------------------------------------------------------
# Change $TERM to 'xterm'
# When using SSH
# So we can use systems which don't understand a 256colour terminal
#--------------------------------------------------------------------------------
alias ssh="export TERM='xterm';ssh"

#--------------------------------------------------------------------------------
# RVM Settings + Initialization
#--------------------------------------------------------------------------------
source ~/.rvm/scripts/rvm

#--------------------------------------------------------------------------------
# Additional Paths
#--------------------------------------------------------------------------------
[[ -d '/opt/php/bin'      ]] && export PATH=$PATH:/opt/php/bin
[[ -d '/opt/mongodb/bin'  ]] && export PATH=$PATH:/opt/mongodb/bin
[[ -d '/opt/postgres/bin' ]] && export PATH=$PATH:/opt/postgres/bin
[[ -d '/opt/redis/bin'    ]] && export PATH=$PATH:/opt/redis/bin

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
