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
plugins=(git colorize archlinux cp theme aws npm bundler systemd)

#--------------------------------------------------------------------------------
# Load oh-my-zsh
#--------------------------------------------------------------------------------
source $ZSH/oh-my-zsh.sh

#--------------------------------------------------------------------------------
# SSH Agent -- Only if one isn't already open (TODO!)
#--------------------------------------------------------------------------------
if [[ $SSH_AGENT_PID == 0 ]]; then
    eval $(ssh-agent) &> /dev/null
    
    # Private keys all end in `.pem`
    # (Required to filter out publics and configs)
    ssh-add $HOME/.ssh/*.pem &> /dev/null
fi

#--------------------------------------------------------------------------------
# Set EDITOR to `emacs -nw` if emacs is installed
#--------------------------------------------------------------------------------
which emacsclient &> /dev/null \
    && export EDITOR="emacsclient -nw"

#--------------------------------------------------------------------------------
# Hack to change terminal behaviour so SSH works correctly
# As remote hosts won't be configued for a 256-colour temrinal.
#--------------------------------------------------------------------------------
alias ssh="TERM=xterm ssh"


#--------------------------------------------------------------------------------
# RVM Settings + Initialization (if installed)
#--------------------------------------------------------------------------------
[[ -f $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

#--------------------------------------------------------------------------------
# Additional Paths
# Will check for each of the following directories and append it to the path.
#--------------------------------------------------------------------------------
# PHP from source
[[ -d '/opt/php/bin'      ]] && export PATH=/opt/php/bin:$PATH

## Databases etc
[[ -d '/opt/mongodb/bin'  ]] && export PATH=/opt/mongodb/bin:$PATH
[[ -d '/opt/postgres/bin' ]] && export PATH=/opt/postgres/bin:$PATH
[[ -d '/opt/redis/bin'    ]] && export PATH=/opt/redis/bin:$PATH

[[ -d '/opt/arduino'      ]] && export PATH=/opt/arduino:$PATH

## 3D Printing
[[ -d '/opt/pronterface'  ]] && export PATH=/opt/printerface:$PATH
[[ -d '/opt/slic3r'       ]] && export PATH=/opt/slic3r:$PATH

## IntelliJ IDEA
[[ -d '/opt/idea'         ]] && export PATH=/opt/idea/bin:$PATH

## RVM
[[ -d "$HOME/.bin"        ]] && export PATH=$HOME/.bin:$PATH
[[ -d "$HOME/.rvm/bin"    ]] && export PATH=$HOME/.rvm/bin:$PATH

## Haskell (Cabal)
[[ -d "$HOME/.cabal/bin"  ]] && export PATH=$HOME/.cabal/bin:$PATH

#--------------------------------------------------------------------------------
# Aliases
#--------------------------------------------------------------------------------

# Shibe git
alias vim='emacsclient -nw'
alias wow='git status'
alias commit='git commit -m'

# Always color pacman output
alias pacman="pacman --color=always"
# Amazing Git fancy-log
alias git-fancy-log="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

# Dalek Delete
alias exterminate="rm -rf"

# Top 10 Commands
alias top10="ps -c80 -ocmd,%mem,%cpu -k-%mem -ax | head -n11"

# View some JSON/XML data in less
alias less-json="json_pp | pygmentize -ljson | less"
alias less-xml="xmllint --format - | pygmentize -lxml | less"

# Packer is installed as packer-io from AUR
alias packer=packer-io


# My alias for 'thefuck'
alias cock='$(thefuck $(fc -ln -1))'

