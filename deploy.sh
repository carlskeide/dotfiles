#!/bin/bash

cd ~
hitlist="~/dotfiles/gitconfig ~/dotfiles/screenrc"
for file in $hitlist ~/dotfiles/bash*; do echo rm -f "~/.${file##*/}"; echo ln -s "$file" "~/.${file##*/}"; done