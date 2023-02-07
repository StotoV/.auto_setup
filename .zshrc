# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# ZSH_THEME="zeit"
ZSH_THEME="af-magic"

bindkey -v

plugins=(
  git
  vi-mode
  ripgrep
  fzf
)

source $ZSH/oh-my-zsh.sh

. ~/.bash_profile

# Fuzzy find
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
