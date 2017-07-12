#!/bin/bash

# Install all needed packages
sudo pacman -S make fakeroot vim stow mlocate wget firefox
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Get dotfiles
git clone https://raember@github.com/raember/manjaro-dotfiles.git ~/dotfiles
cd ~/dotfiles/
./delete_defaults.sh
./install.sh

# Setup git
git config --global user.email "raphael.emberger@hotmail.ch"
git config --global user.name "raember"
sudo git config --system core.ignorecase false
