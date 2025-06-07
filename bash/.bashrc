#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias lg='lazygit'
alias vi='nvim'

eval "$(ssh-agent)"
eval "$(fzf --bash)"
