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
alias docker-prune="docker volume ls -qf dangling=true | xargs docker volume rm"

alias workon="pushd . &>/dev/null && workon"
alias workoff="deactivate"

alias git-log="git log --graph --oneline --decorate"
alias git-commit="git commit -m"
