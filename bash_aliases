# ~/.bash_aliases

alias ls="ls --color=auto"
alias grep="grep --color=auto"

alias l="ls -lFh"
alias ll="ls -alFh"

alias ..="cd .."

alias rmd="rm -rf"
alias chx="chmod +x"

alias e="exit"
alias i="grep"
alias c="clear"

alias psg="ps aux | grep"
alias rcopy="rsync -vahP"

alias dk="docker"
alias dkco="docker-compose"
alias dkma="docker-machine"
alias dmount="mount | grep -v docker"

alias workon="pushd . &>/dev/null && workon"
alias workoff="deactivate"

alias vup="vagrant up --provider=docker"
alias vssh="vagrant ssh"

alias https='http --default-scheme=https'

alias ffs="sudo !!"
