#!/bin/bash

cd ~

# Literally dotfiles
hitlist="~/dotfiles/screenrc ~/dotfiles/tmux.conf"
for file in $hitlist ~/dotfiles/bash*; do echo rm -f "~/.${file##*/}"; echo ln -s "$file" "~/.${file##*/}"; done
echo ": > ~/.hushlogin"
echo "cat dotfiles/virtualenvs.postdeactivate >>.virtualenvs/postdeactivate"
echo "cat ~/dotfiles/gitconfig > ~/.gitconfig"

# Config files
echo "cp -aT ~/dotfiles/config/terminator/ ~/.config/terminator/"
echo "cp -a ~/dotfiles/config/sublime-text-3/* ~/.config/sublime-text-3/Packages/User/"
