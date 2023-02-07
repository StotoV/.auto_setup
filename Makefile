USER_DIR = ~$(USER)
MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
MKFILE_DIR := $(dir $(MKFILE_PATH))
PACKAGE_INSTALL = pacman -S 


.PHONY: install

help:
	@echo 'SYSTEM SETUP'
	@echo '---------------------------------------------'
	@echo 'Dependencies:'
	@echo 'make, wget, git'
	@echo ''
	@echo 'install'
	@echo ''
	@echo 'Tools (can be installed sperately):'
	@echo '----------------------------'
	@echo 'bash'
	@echo 'Installs the bash tools (DELETES CURRENT BASHRC)'
	@echo ''
	@echo 'fzf'
	@echo 'Installs the fzf tool and links the config'
	@echo ''
	@echo 'vim'
	@echo 'Installs the vimrc with plugins and themes'
	@echo ''
	@echo 'zsh'
	@echo 'Installs the zsh shell and links the config and themes'
	@echo ''
	@echo 'services'
	@echo 'Installs systemd services and timers'
	@echo ''
	@echo 'configs'

install: bash fzf vim zsh configs
	# Reboot for all changes to go into effect
	# sudo reboot

bash:
	rm -rf ~/.bash_tools
	ln -snf $(MKFILE_DIR).bash_tools ~/.bash_tools 
	ln -snf $(MKFILE_DIR).bash_profile ~/.bash_profile

fzf:
	rm -rf ~/.fzf
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	yes | ~/.fzf/install

vim:
	rm -rf ~/.vim
	ln -snf $(MKFILE_DIR).vim ~/.vim
	vim +Silent +PlugInstall +qall

zsh:
	rm -rf ~/.oh-my-zsh
	git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
	sudo chsh -s /usr/bin/zsh root
	sudo chsh -s /usr/bin/zsh $(USER)
	wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O -

	ln -sfn $(MKFILE_DIR).zshrc ~/.zshrc

services:
	sudo ln -snf $(MKFILE_DIR)systemd/system/checkupdate.timer /etc/systemd/system/checkupdate.timer
	sudo ln -snf $(MKFILE_DIR)systemd/system/checkupdate.service /etc/systemd/system/checkupdate.service
	sudo ln -snf $(MKFILE_DIR)systemd/system/checkupdate_script /etc/systemd/system/checkupdate_script
	sudo ln -snf $(MKFILE_DIR)systemd/system/systemd_monitor.timer /etc/systemd/system/systemd_monitor.timer
	sudo ln -snf $(MKFILE_DIR)systemd/system/systemd_monitor.service /etc/systemd/system/systemd_monitor.service
	sudo ln -snf $(MKFILE_DIR)systemd/system/systemd_monitor_script /etc/systemd/system/systemd_monitor_script
	sudo chown -h root:root /etc/systemd/system/checkupdate*
	sudo chown -h root:root /etc/systemd/system/systemd_monitor*
	sudo systemctl daemon-reload
	sudo systemctl enable --now checkupdate.timer
	sudo systemctl enable --now checkupdate.service
	sudo systemctl enable --now systemd_monitor.timer
	sudo systemctl enable --now systemd_monitor.service

configs:
	rm -rf ~/.config/mako
	rm -rf ~/.config/i3
	rm -rf ~/.config/rofi
	rm -rf ~/.config/alacritty
	rm -rf ~/.config/picom
	rm -rf ~/.config/dunst
	ln -sfn $(MKFILE_DIR).config/mako ~/.config/mako
	ln -sfn $(MKFILE_DIR).config/i3 ~/.config/i3
	ln -sfn $(MKFILE_DIR).config/rofi ~/.config/rofi
	ln -sfn $(MKFILE_DIR).config/alacritty ~/.config/alacritty
	ln -sfn $(MKFILE_DIR).config/picom ~/.config/picom
	ln -sfn $(MKFILE_DIR).config/dunst ~/.config/dunst
	ln -sfn $(MKFILE_DIR).Xresources ~/.Xresources
