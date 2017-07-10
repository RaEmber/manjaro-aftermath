#!/bin/bash

# Install all needed packages
sudo pacman -S vim firefox stow htop mlocate

# Get dotfiles
cd ~
git clone https://github.com/RaEmber/manjaro-dotfiles.git dotfiles
./dotfiles/install.sh
