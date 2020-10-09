USER_DIR = ~$(USER)
MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
MKFILE_DIR := $(dir $(MKFILE_PATH))
PACKAGE_INSTALL = pacman -S 


.PHONY: install update

help:
	@echo 'SYSTEM SETUP'
	@echo '---------------------------------------------'
	@echo 'Dependencies:'
	@echo 'make, wget, git'
	@echo ''
	@echo 'Commands:'
	@echo 'linux_cmd'
	@echo 'Usefull linux commands'
	@echo ''
	@echo 'update'
	@echo 'Updates the tools based on the git repo'
	@echo ''
	@echo 'install'
	@echo 'Installs all the tools and reboots'
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
	@echo 'tmux'
	@echo 'Installs the tmux tool and links the config'
	@echo ''
	@echo 'zsh'
	@echo 'Installs the zsh shell and links the config and themes'
	@echo ''
	@echo 'services'
	@echo 'Installs systemd services and timers'
	@echo ''
	@echo 'configs'
	@echo 'Installs the configuration of the following items (but does not install the tool itself):'
	@echo ' - sway'
	@echo ' - waybar'

install: bash fzf vim tmux zsh systemd configs
	# Reboot for all changes to go into effect
	sudo reboot

linux_cmd:
	@echo 'USEFULL COMMANDS'
	@echo '---------------------------------------------'
	@echo 'nmtui 					network console UI'

update:
	git reset --hard
	git checkout master
	git pull origin master

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

tmux:
	sudo $(PACKAGE_INSTALL) tmux
	rm -rf ~/.tmux
	ln -snf $(MKFILE_DIR).tmux ~/.tmux
	ln -snf $(MKFILE_DIR).tmux.conf ~/.tmux.conf

	rm -rf ~/.tmux/plugins/tpm
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

	~/.tmux/plugins/tpm/bin/install_plugins

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
	rm -rf ~/.config/sway
	rm -rf ~/.config/waybar
	rm -rf ~/.config/wofi
	rm -rf ~/.config/mako
	rm -rf ~/.config/i3
	rm -rf ~/.config/rofi
	rm -rf ~/.config/alacritty
	rm -rf ~/.config/picom
	rm -rf ~/.config/dunst
	ln -sfn $(MKFILE_DIR).config/sway ~/.config/sway
	ln -sfn $(MKFILE_DIR).config/waybar ~/.config/waybar
	ln -sfn $(MKFILE_DIR).config/wofi ~/.config/wofi
	ln -sfn $(MKFILE_DIR).config/mako ~/.config/mako
	ln -sfn $(MKFILE_DIR).config/i3 ~/.config/i3
	ln -sfn $(MKFILE_DIR).config/rofi ~/.config/rofi
	ln -sfn $(MKFILE_DIR).config/alacritty ~/.config/alacritty
	ln -sfn $(MKFILE_DIR).config/picom ~/.config/picom
	ln -sfn $(MKFILE_DIR).config/dunst ~/.config/dunst
	ln -sfn $(MKFILE_DIR).Xresources ~/.Xresources
