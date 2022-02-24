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
alias nocomment="grep -vEe '^\s*(#|$)'"

alias dk="docker"
alias dkco="docker-compose"
alias dkma="docker-machine"

alias https='http --default-scheme=https'

alias ffs="fc -ln -1 | xargs sudo -s"

alias crt="openssl x509 -noout -text"

## pyenv
function cdproject {
    [[ -z "$VIRTUAL_ENV" ]] && echo "No virtualenv active" && return

    [[ -f "${VIRTUAL_ENV}/.project" ]] && cd $(cat "${VIRTUAL_ENV}/.project");

}

function workon {
    pyenv activate ${@}

    [[ -f "${VIRTUAL_ENV}/.project" ]] && pushd "$(cat "${VIRTUAL_ENV}/.project")" >/dev/null;

}

function workoff {
    [[ -z "$VIRTUAL_ENV" ]] && echo "No virtualenv active" && return

    [[ -f "${VIRTUAL_ENV}/.project" ]] && popd >/dev/null

    pyenv deactivate

}
