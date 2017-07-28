#!/bin/bash

gitdir=~/Dokumente/git/
walldir=~/Bilder/wallpaper/

install_packages() {
	sudo pacman --noconfirm -Syu \
		base-devel \
		python-pip \
		\
		vim \
		stow \
		mlocate \
		wget \
		redshift python-xdg \
		gpsd \
		imagemagick \
		slim slim-themes \
		vlc qt4 \
		rxvt-unicode \
		unzip \
		xarchiver \
		atom \
		firefox \
		libreoffice-fresh libreoffice-fresh-de hunspell-de \
		thunderbird thunderbird-i18n-de
	
	yaourt --noconfirm -S \
		gtk-theme-arc-git \
		polybar-git \
		firefox-extension-stylish \
		jsawk-git
	
	sudo pip install pywal
}

uninstall_packages() {
	sudo pacman -Rs \
		compton \
		limepanel
	rm ~/.config/compton.conf
	rm ~/.limepanelrc
	rm ~/.tmux.conf
}

enable_services() {
	sudo systemctl enable \
		slim \
		ufw \
		redshift-gtk \
		gpsd
}

install_powerline_fonts() {
	cd $gitdir
	git clone https://github.com/powerline/fonts.git
	./fonts/install.sh
	rm -rf fonts
}

install_oh_my_zsh() {
	rm ~/.zshrc
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

install_plugins() {
	apm install \
		atom-material-ui \
		atom-beautify \
		atom-formatter-jsbeautify \
		jekyll \
		jekyll-syntax-highlighting \
		less-autocompile \
		sass-autocompile \
		Sublime-Style-Column-Selection \
		mathjax-wrapper
}

install_dotfiles() {
	git clone https://raember@github.com/raember/dotfiles.git ~/dotfiles
	cd ~/dotfiles
	./delete_defaults.sh
	mkdir -p ~/.config/polybar
	./install.sh
}

setup_git_config() {
	git config --global user.email "raphael.emberger@hotmail.ch"
	git config --global user.name "raember"
	sudo git config --system core.ignorecase false
}

load_wallpaper_colorscheme() {
	mkdir -p $walldir
	if [ -z "$(ls -A $walldir)" ]; then
		cp $gitdir/manjaro-aftermath/dummywallpaper.jpg $walldir
	fi
	wal -i $walldir
}

setup_git_config
uninstall_packages
install_packages
enable_services
install_plugins
install_powerline_fonts
install_oh_my_zsh
install_dotfiles
load_wallpaper_colorscheme
