# ~/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
[[ -f ~/.bashrc ]] && . ~/.bashrc


if [[ -f ~/.env ]]; then
    while read line; do
        [[ "$line" =~ ^(#|$) ]] && continue || eval "export ${line}"
    done < ~/.env
    unset l
fi

[[ -f ~/venv/bin/activate ]] && . ~/venv/bin/activate

cd ~
