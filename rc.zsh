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

#--------------------------------------------------------------------------------
# Load oh-my-zsh
#--------------------------------------------------------------------------------
source $ZSH/oh-my-zsh.sh

#--------------------------------------------------------------------------------
# Export Path
#--------------------------------------------------------------------------------
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl

#--------------------------------------------------------------------------------
# Set Pager
#--------------------------------------------------------------------------------
which most &> /dev/null \
    && export PAGER=most

#--------------------------------------------------------------------------------
# Set EDITOR
#--------------------------------------------------------------------------------
which emacs &> /dev/null \
    && export EDITOR="emacs -nw"

#--------------------------------------------------------------------------------
# Change $TERM to 'xterm' so we can ssh properly
#--------------------------------------------------------------------------------
alias ssh="export TERM='xterm';ssh"


# Alias for dev mysql
alias dev-mysql="mysql -h 192.168.56.102 -udev -p"

#--------------------------------------------------------------------------------
# Additional Paths
#--------------------------------------------------------------------------------
[[ -d '/opt/php/bin' ]] && export PATH=$PATH:/opt/php/bin
[[ -d '/opt/mongodb/bin' ]] && export PATH=$PATH:/opt/mongodb/bin
[[ -d '/opt/postgres/bin' ]] && export PATH=$PATH:/opt/postgres/bin

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#--------------------------------------------------------------------------------
# SSH-Agent
#--------------------------------------------------------------------------------
