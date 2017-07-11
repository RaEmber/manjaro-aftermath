#!/bin/bash

# Install all needed packages
sudo pacman -S vim firefox stow mlocate wget
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-ma-zsh/master/tools/install.sh)"

# Get dotfiles
git clone https://github.com/RaEmber/manjaro-dotfiles.git ~/dotfiles
~/dotfiles/deletedefaults.sh
~/dotfiles/install.sh

# Setup git
git config --global user.email "raphael.emberger@hotmail.ch"
git config --global user.name "RaEmber"
git config --system core.ignorecase false
