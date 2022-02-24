# ~/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
[[ -f ~/.bashrc ]] && . ~/.bashrc

## User Features
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

if [[ -f ~/.env ]]; then
    while read line; do
        [[ "$line" =~ ^(#|$) ]] && continue || eval "export ${line}"
    done < ~/.env
    unset l
fi

export PATH="/sbin:/usr/sbin:/usr/local/bin:$PATH"

[[ -d "$HOME/bin" ]] && export PATH="$HOME/bin:$PATH"
[[ -f "$HOME/.hosts" ]] && export HOSTFILE="$HOME/.hosts"


## Python stuff
# Basic user virtualenv
[[ -f ~/venv/bin/activate ]] && . ~/venv/bin/activate

# Virtualenvwrapper
#[[ -f /usr/bin/virtualenvwrapper.sh ]] && . /usr/bin/virtualenvwrapper.sh

#PyEnv
if [[ -f ~/.pyenv/bin/pyenv ]]; then
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1

    eval "$(~/.pyenv/bin/pyenv init -)"
    eval "$(~/.pyenv/bin/pyenv init --path)"

    eval "$(~/.pyenv/bin/pyenv virtualenv-init -)"
fi

## Workaround for weird system profiles
[[ -f /etc/bash_completion ]] && . /etc/bash_completion

cd ~
