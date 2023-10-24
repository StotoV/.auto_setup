export EDITOR=vim

export PATH=$PATH:/home/tom/BurpSuitePro

export TERM=xterm-256color
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
. ~/.bash_tools/z.sh

# SSH keys
eval $(keychain --eval --quiet ~/.ssh/gitea)
eval $(keychain --eval --quiet ~/.ssh/github_personal)

# General usefull commands
alias gittree='git log --graph --oneline --all'
