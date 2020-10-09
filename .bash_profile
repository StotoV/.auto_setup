export EDITOR=vim

export TERM=xterm-256color
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
. ~/.bash_tools/z.sh

# SSH keys
eval $(keychain --eval --quiet ~/.ssh/github ~/.ssh/vps)

# General usefull commands
alias gittree='git log --graph --oneline --all'
alias open='mimeo'

# Package management
alias package_preview="fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
