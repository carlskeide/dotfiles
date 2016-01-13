# ~/.bashrc

## Pre-flight checks
# Test for an interactive shell.
if [[ $- != *i* ]] ; then
        # Shell is non-interactive.  Be done now!
        return
fi

# check the window size after each command
shopt -s checkwinsize


## Internal variables
COLOR_BLACK="\[\e[30;49m\]"
COLOR_RED="\[\e[31;49m\]"
COLOR_GREEN="\[\e[32;49m\]"
COLOR_YELLOW="\[\e[33;49m\]"
COLOR_BLUE="\[\e[34;49m\]"
COLOR_MAGENTA="\[\e[35;49m\]"
COLOR_CYAN="\[\e[36;49m\]"
COLOR_WHITE="\[\e[37;49m\]"
COLOR_NONE="\[\e[0m\]"


## Environment
export DISPLAY=:0
export EDITOR=nano

export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth
export HISTSIZE=1000

export PATH="/sbin:/usr/sbin:/usr/local/bin:$PATH"
[[ -d "$HOME/bin" ]] && export PATH="$HOME/bin:$PATH"


## User Features
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -f ~/venv/bin/activate ]] && . ~/venv/bin/activate
[[ -f ~/.docker-machine ]] && eval "$(docker-machine env $(cat ~/.docker-machine))"

[[ "$TERM" != "dumb" && -x /usr/bin/dircolors ]] && eval "$(dircolors -b)"


## System features
[[ -f /etc/bash_completion ]] && . /etc/bash_completion


## Customization
[[ $TERM = 'xterm' ]] && TITLEBAR="\[\e]2;\u@\h:\w\a\]" || TITLEBAR=""

# Use the system-wide host color if avaiable, default to green.
[[ -f /etc/host_color ]] && . /etc/host_color || CLR_HOST="$COLOR_GREEN"

promptFunc()
{
        # Cursor color is determined by the exit status of the last command.
        [[ "$?" -eq 0 ]] && CLR_CURSOR="${COLOR_GREEN}" || CLR_CURSOR="${COLOR_RED}"

        # User color is determined by the current UID, root=red
        [[ "${UID}" -eq 0 ]] && CLR_USER="${COLOR_RED}" || CLR_USER="${COLOR_GREEN}"

        PS1="\
${TITLEBAR}\
${CLR_USER}\u\
${COLOR_NONE}@\
${CLR_HOST}\h\
${COLOR_NONE}:\
${COLOR_CYAN}\w\
${CLR_CURSOR}\\$ \
${COLOR_NONE}"

}

PROMPT_COMMAND=promptFunc
