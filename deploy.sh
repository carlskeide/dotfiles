#!/bin/bash

cd ~

# Literally dotfiles
hitlist="~/dotfiles/screenrc ~/dotfiles/nanorc ~/dotfiles/tmux.conf"
for file in $hitlist ~/dotfiles/bash*; do echo rm -f "~/.${file##*/}"; echo ln -s "$file" "~/.${file##*/}"; done

echo "cat ~/dotfiles/gitconfig > ~/.gitconfig"
echo "cat ~/dotfiles/dotenv > ~/.env"

echo ": > ~/.hushlogin"

# Custom scripts
echo "mkdir -p ~/bin"
for s in dotfiles/bin/*; do echo "ln -s ~/${s} ~/bin/${s##*/}"; done

# Python
echo "mkdir -p ~/.ipython/profile_default"
echo "rm ~/.ipython/profile_default/ipython_config.py; ln -s ~/dotfiles/ipython/ipython_config.py ~/.ipython/profile_default/ipython_config.py"
echo "rm -rf ~/.ipython/profile_default/startup; ln -s ~/dotfiles/ipython/startup ~/.ipython/profile_default/startup"

# GUI Config
echo "mkdir -p ~/.config/sublime-text-3/Packages/User && cp -a ~/dotfiles/config/sublime-text-3/* ~/.config/sublime-text-3/Packages/User/"
echo "mkdir -p ~/.config/rofi && ln -s ~/dotfiles/config/rofi/config.rasi ~/.config/rofi/config.rasi"
echo "dconf load /com/gexperts/Tilix/ < ~/dotfiles/dconf/tilix"
