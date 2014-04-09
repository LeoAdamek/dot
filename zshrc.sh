#--------------------------------------------------------------------------------
# ZSH Options
#
# Turn on `extendedglob` to alow filters like *~*important_file* to work
#--------------------------------------------------------------------------------
setopt extendedglob

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

#--------------------------------------------------------------------------------
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#--------------------------------------------------------------------------------
ZSH_THEME="robbyrussell"

#--------------------------------------------------------------------------------
# Plugins
# (For oh-my-zsh)
#--------------------------------------------------------------------------------
plugins=(git github colorize nyan lol archlinux cp theme)

#--------------------------------------------------------------------------------
# Load oh-my-zsh
#--------------------------------------------------------------------------------
source $ZSH/oh-my-zsh.sh

#--------------------------------------------------------------------------------
# SSH Agent
#--------------------------------------------------------------------------------
# eval $(ssh-agent) &> /dev/null

# Private keys all end in `.pem`
# (Required to filter out publics and configs)
#ssh-add $HOME/.ssh/*.pem &> /dev/null

#--------------------------------------------------------------------------------
# Set EDITOR to `emacs -nw`
#--------------------------------------------------------------------------------
which emacs &> /dev/null \
    && export EDITOR="emacs -nw"

#--------------------------------------------------------------------------------
# Hack to change terminal behaviour so SSH works correctly
# As remote hosts won't be configued for a 256-colour temrinal.
#--------------------------------------------------------------------------------
alias ssh="TERM=xterm ssh"

#--------------------------------------------------------------------------------
# (other) Command Aliases
#--------------------------------------------------------------------------------
# Always color pacman output
alias pacman="pacman --color=always"
# Amazing Git fancy-log
alias git-fancy-log="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"


#--------------------------------------------------------------------------------
# RVM Settings + Initialization (if installed)
#--------------------------------------------------------------------------------
[[ -f $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

#--------------------------------------------------------------------------------
# Additional Paths
# Will check for each of the following directories and append it to the path.
#--------------------------------------------------------------------------------
[[ -d '/opt/php/bin'      ]] && export PATH=$PATH:/opt/php/bin

[[ -d '/opt/mongodb/bin'  ]] && export PATH=$PATH:/opt/mongodb/bin
[[ -d '/opt/postgres/bin' ]] && export PATH=$PATH:/opt/postgres/bin
[[ -d '/opt/redis/bin'    ]] && export PATH=$PATH:/opt/redis/bin

[[ -d '/opt/arduino'      ]] && export PATH=$PATH:/opt/arduino

[[ -d '/opt/pronterface'  ]] && export PATH=$PATH:/opt/printerface
[[ -d '/opt/slic3r'       ]] && export PATH=$PATH:/opt/slic3r
[[ -d '/opt/idea'         ]] && export PATH=$PATH:/opt/idea/bin

[[ -d "$HOME/.bin"        ]] && export PATH=$PATH:$HOME/.bin
[[ -d "$HOME/.rvm/bin"    ]] && export PATH=$PATH:$HOME/.rvm/bin
export RSENSE_HOME=/opt/rsense
