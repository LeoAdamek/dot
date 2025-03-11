#--------------------------------------------------------------------------------
# ZSH Options
#
# Turn on `extendedglob` to alow filters like *~*important_file* to work
#--------------------------------------------------------------------------------
setopt extendedglob

# Path to your oh-my-zsh configuration.
ZSH="$HOME/.oh-my-zsh"

#--------------------------------------------------------------------------------
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#--------------------------------------------------------------------------------
ZSH_THEME="dieter"

#--------------------------------------------------------------------------------
# Plugins
# (For oh-my-zsh)
#--------------------------------------------------------------------------------
plugins=(git colorize archlinux aws systemd themes)

#--------------------------------------------------------------------------------
# Load oh-my-zsh
#--------------------------------------------------------------------------------
if [ -f "$ZSH/oh-my-zsh.sh" ]; then
  source "$ZSH/oh-my-zsh.sh"
else
  echo "[!] oh-my-zsh not found in $ZSH" 
  echo "override $ZSH if it is installed somewhere else"
fi

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
# Set EDITOR to `vim` -- Will be overridden by emacs if installed.
#--------------------------------------------------------------------------------
export EDITOR=vim

#--------------------------------------------------------------------------------
# Hack to change terminal behaviour so SSH works correctly
# As remote hosts often won't be configued for a 256-colour temrinal.
#--------------------------------------------------------------------------------
alias ssh="TERM=xterm ssh"

#--------------------------------------------------------------------------------
# RVM Settings + Initialization (if installed)
#--------------------------------------------------------------------------------
[[ -f $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

#--------------------------------------------------------------------------------
# Additional Paths
# Will check for each of the following directories and prepend it to the path.
#--------------------------------------------------------------------------------

# Cargo (Rust)
[[ -d "$HOME/.cargo/bin"  ]] && export PATH=$HOME/.cargo/bin:$PATH

# Google Cloud SDK
[[ -d '/opt/google-cloud-sdk' ]] && export PATH=/opt/google-cloud-sdk/bin:$PATH

#--------------------------------------------------------------------------------
# Aliases
#--------------------------------------------------------------------------------

[[ -n `which chromium` ]] && export CHROME_EXECUTABLE=chromium

# Shibe git
alias wow='git status'
alias commit='git commit -m'

# Always color pacman output
alias pacman="pacman --color=always"

# Git Aliases
alias git-fancy-log="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias git-count="git rev-list HEAD --count"

# Output colours
alias grep='grep --color=auto'
alias ip='ip -color=auto'

export LESS='-R --use-color -Dd+r$Du+b'
export MANPAGER='less -R --use-color -Dd+r -Du+b'

# Dalek Delete
alias exterminate="rm -rf"

# Top 10 Processes (shows top-level info about the top 10 memory using processes)
alias top10="ps -c80 -ocmd,%mem,%cpu -k-%mem -ax | head -n11"

# View some JSON/XML data in less
alias less-json="json_pp | pygmentize -ljson | less"
alias less-xml="xmllint --format - | pygmentize -lxml | less"

# Packer is installed as packer-io from AUR
alias packer=packer-io

# My alias for 'thefuck'
alias ocock='$(thefuck $(fc -ln -1))'

# Useful way to get stats for docker info
alias dockertop="docker stats $(docker ps --format '{{.Names}}')"

# useful command for testing TLS
alias tlsprobe="openssl s_client -connect"

alias kc=kubectl
alias tf=terraform

# Unsetting GREP_OPTIONS because it is deprecated.
export GREP_OPTIONS=

# Enable Shell Syntax highlighting if available.
[[ -f "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] \
    && source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

#export LS_COLORS=$($HOME/.bin/ls_colors_generator)
#alias  ls="~/.bin/ls --color=auto"

source ~/.profile

# Cow-free Ansible.
export ANSIBLE_NOCOWS=1
source /usr/share/nvm/init-nvm.sh

export GOPATH=$HOME/development/.go
export PATH=$GOPATH/bin:$PATH
export PATH=$HOME/.yarn/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.fly/bin:$PATH

[[ -n `which rbenv` ]] && eval "$(rbenv init -)"

alias tssh="tsh ssh -i $HOME/.config/teleport.pem --proxy ssh.eu.mrzen.net"
#export SSH_AUTH_SOCK=$HOME/.1password/agent.sock

# bun completions
[ -s "/home/leo/.bun/_bun" ] && source "/home/leo/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

#1 Password
source /home/leo/.config/op/plugins.sh

# SSH Agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.sock"

[ -f "/home/leo/.ghcup/env" ] && . "/home/leo/.ghcup/env" # ghcup-env
