#!/bin/bash

# Install all needed packages
sudo pacman --noconfirm -S \
	base-devel \
	python3 \
	python-pip \
	ufw \
	\
	vim \
	stow \
	mlocate \
	wget \
	imagemagick \
	slim slim-themes \
	vlc qt4 \
	xterm \
	unzip \
	xarchiver \
	firefox \
	libreoffice-fresh libreoffice-fresh-de hunspell-de \
	thunderbird thunderbird-i18n-de

yaourt --noconfirm -S \
	gtk-theme-arc-git \
	polybar

sudo pip install pywal

sudo systemctl enable slim ufw
mkdir -p ~/.config/polybar

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Get dotfiles
git clone https://raember@github.com/raember/dotfiles.git ~/dotfiles
cd ~/dotfiles/
./delete_defaults.sh
./install.sh

# Setup git
git config --global user.email "raphael.emberger@hotmail.ch"
git config --global user.name "raember"
sudo git config --system core.ignorecase false
