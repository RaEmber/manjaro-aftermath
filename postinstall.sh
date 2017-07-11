#!/bin/bash

# Install all needed packages
sudo pacman -S vim firefox stow mlocate wget
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Get dotfiles
git clone https://RaEmber@github.com/RaEmber/manjaro-dotfiles.git ~/dotfiles
cd ~/dotfiles/
./deletedefaults.sh
./install.sh

# Setup git
git config --global user.email "raphael.emberger@hotmail.ch"
git config --global user.name "RaEmber"
git config --system core.ignorecase false
