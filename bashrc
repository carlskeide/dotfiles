####### Config #######
PROMPT_ONELINE=1

PROMPT_HOST=1
HOST_COLOR="green"

PROMPT_VIRTUALENV=1
PROMPT_GITSTATUS=1
PROMPT_JOBS=1
##### END config #####

## Pre-flight checks
# Test for an interactive shell.
if [[ $- != *i* ]] ; then
        # Shell is non-interactive.  Be done now!
        return
fi

# append to the history file, don't overwrite it
shopt -s histappend
# reformat multiline commands
shopt -s cmdhist
# check the window size after each command
shopt -s checkwinsize
# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

## Internal variables
# Available colors
declare -A colors=(
    ["black"]="\[\e[30;49m\]"
    ["red"]="\[\e[31;49m\]"
    ["green"]="\[\e[32;49m\]"
    ["yellow"]="\[\e[33;49m\]"
    ["blue"]="\[\e[34;49m\]"
    ["magenta"]="\[\e[35;49m\]"
    ["cyan"]="\[\e[36;49m\]"
    ["white"]="\[\e[37;49m\]"
    ["none"]="\[\e[0m\]"
)

# External helpers
GIT_STATUS_HELPER=~/dotfiles/sbp_git_status.sh

## Environment
export DISPLAY=:0
export EDITOR=nano

export HISTCONTROL=ignoreboth
export HISTIGNORE='ls:ll:l:bg:fg:history'
export HISTTIMEFORMAT='%F %T '

export HISTSIZE=10000
export HISTFILESIZE=10000

export PATH="/sbin:/usr/sbin:/usr/local/bin:$PATH"
[[ -d "$HOME/bin" ]] && export PATH="$HOME/bin:$PATH"

[[ -f "$HOME/.hosts" ]] && export HOSTFILE="$HOME/.hosts"

## User Features
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

# Use the system-wide host color, if avaiable.
[[ -f /etc/host_color ]] && HOST_COLOR="$(cat /etc/host_color)"

if [[ "$TERM" != "dumb" ]] && which dircolors >/dev/null ; then
    [[ -r ~/.dircolors ]] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

## Shell features
[[ -f /etc/bash_completion ]] && . /etc/bash_completion
[[ -f /usr/bin/virtualenvwrapper.sh ]] && . /usr/bin/virtualenvwrapper.sh

## logic
function prompt_cmd_git {
    [[ -x "$GIT_STATUS_HELPER" && $PROMPT_GITSTATUS -eq 1 ]] || exit 0

    GIT_STATUS="$(${GIT_STATUS_HELPER})"

    [[ -n "${GIT_STATUS}" ]] \
    && echo "${colors[none]}:${GIT_STATUS}"
}

function prompt_cmd_venv {
    [[ $PROMPT_VIRTUALENV -eq 1 ]] || exit 0

    [[ -n "${VIRTUAL_ENV}" ]] \
    && echo "${colors[none]}:${colors[blue]}${VIRTUAL_ENV##*/}${colors[none]}"
}

function prompt_cmd_jobs {
    [[ $PROMPT_JOBS -eq 1 ]] || exit 0

    NUM_JOBS=$(jobs | wc -l)
    [[ "$NUM_JOBS" -gt 0 ]] \
    && echo "${colors[none]}:${colors[yellow]}&${NUM_JOBS}${colors[none]}"
}

function prompt_cmd {

    # Cursor color is determined by the exit status of the last command.
    [[ "$?" -eq 0 ]] \
    && CLR_CURSOR="${colors[green]}" \
    || CLR_CURSOR="${colors[red]}"

    # User color is determined by the current UID, root=red
    [[ "${UID}" -eq 0 ]] \
    && CLR_USER="${colors[red]}" \
    || CLR_USER="${colors[green]}"

    [[ "${PROMPT_HOST}" -eq 1 ]] \
    && STATUS_HOST="${colors[none]}@${colors[${HOST_COLOR}]}\h" \
    || STATUS_HOST=""

    STATUS_VENV="$(prompt_cmd_venv)"
    STATUS_GIT="$(prompt_cmd_git)"
    STATUS_JOBS="$(prompt_cmd_jobs)"

    [[ "PROMPT_ONELINE" -eq 1 ]] \
    && SEPARATOR=' ' \
    || SEPARATOR='\n'

    ## GUI features
    [[ "$TERM" =~ ^xterm ]] && TITLEBAR="\[\e]0;\u@\h: \w\a\]" || TITLEBAR=""

    PS1="\
${TITLEBAR}\
${CLR_USER}\u\
${STATUS_HOST}\
${STATUS_VENV}\
${STATUS_GIT}\
${colors[none]}:\
${colors[cyan]}\w\
${STATUS_JOBS}\
${SEPARATOR}\
${CLR_CURSOR}\\$ \
${colors[none]}\
"
}

PROMPT_COMMAND=prompt_cmd
