#!/bin/bash

# xorg display server installation
sudo apt install -y xorg xbacklight xbindkeys xvkbd xinput

# visual front end for XRandR
sudo apt install -y arandr

# PACKAGE INCLUDES build-essential.
sudo apt install -y build-essential

# Suckless dependencies
sudo apt install -y make gcc libx11-dev libxft-dev libxinerama-dev xorg # dwm
# sudo apt install -y libharfbuzz-dev # st
# sudo apt install -y libxrandr-dev # slock


# For polybar modules
#sudo apt install -y lm-sensors procps redshift i3lock
sudo apt install -y redshift i3lock

# Microcode for Intel/AMD 
sudo apt install -y amd64-microcode
# sudo apt install -y intel-microcode 

# Network File Tools/System Events
#sudo apt install -y dialog mtools dosfstools avahi-daemon acpi acpid gvfs-backends xfce4-power-manager
sudo apt install -y dialog mtools dosfstools avahi-daemon acpi acpid gvfs-backends

sudo systemctl enable avahi-daemon
sudo systemctl enable acpid

# File Manager (eg. pcmanfm,krusader,thunar,nautilus)
sudo apt install -y thunar

# Image viewer
sudo apt install -y mirage sxiv

# PDF viewer
sudo apt install -y mupdf zathura

# Terminal (eg. terminator,kitty,xfce4-terminal)
sudo apt install -y alacritty

# Sound packages
sudo apt install -y pulseaudio alsa-utils pavucontrol volumeicon-alsa pulsemixer

# Music/media player packages
sudo apt install -y mpc mpd ncmpcpp mpv

# Polkit
sudo apt install -y policykit-1-gnome

# Neofetch/HTOP
sudo apt install -y neofetch htop

# Network Manager
sudo apt install -y network-manager network-manager-gnome 

# Installation for Appearance management
# sudo apt install -y lxappearance 

# Browser Installation (eg. chromium)
# sudo apt install -y firefox-esr # (problem: old version)

# Desktop background browser/handler 
sudo apt install -y xwallpaper
sudo apt install -y galculator
sudo apt install -y brightnessctl pamixer light
sudo apt install -y trash-cli
sudo apt install -y calcurse

# Script dependencies
sudo apt install -y gpick imagemagick
 
# Fonts and icons for now
sudo apt install -y fonts-firacode fonts-liberation2
sudo apt install -y fonts-noto-color-emoji fonts-font-awesome

# EXA installation
# replace ls command in .bashrc file with line below
# alias ls='exa -al --long --header --color=always --group-directories-first' 
sudo apt install -y exa

# Printing and bluetooth (if needed)
# sudo apt install -y cups system-config-printer simple-scan
# sudo apt install -y bluez blueman

# sudo systemctl enable cups
# sudo systemctl enable bluetooth

# Packages needed for bspwm installation
sudo apt install -y bspwm dmenu sxhkd picom numlockx rofi dunst libnotify-bin unzip geany maim xdotool wtype

# Build rofi emoji
sudo apt install -y rofi-dev autoconf automake libtool-bin libtool
mkdir ~/.stuff && cd ~/.stuff/
git clone https://github.com/Mange/rofi-emoji 
cd rofi-emoji
autoreconf -i
mkdir build
cd build/
../configure
make
sudo make install
cd ~/.stuff
rm -rf rofi-emoji

# Status bar 
sudo apt install -y polybar

# Command line text editor -- nano preinstalled 
# sudo apt install -y micro
sudo apt install -y vim

# Tmux and plugins
sudo apt install -y tmux 
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Create folders in user directory (eg. Documents,Downloads,etc.)
xdg-user-dirs-update

########################################################
## Install zsh and copy all config
sudo apt install -y zsh fzf bc
[ ! -d "~/.local/src/zsh_plugins/" ] && mkdir -p ~/.local/src/zsh_plugins
cd ~/.local/src/zsh_plugins/
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/hlissner/zsh-autopair.git

cd ~/
cp -r ~/.dotfiles/.config/* ~/.config/
cp -r ~/.dotfiles/.local/bin/ ~/.local/
[ ! -d "~/.local/share/" ] && mkdir -p ~/.local/share
cp -r ~/.dotfiles/.local/share/* ~/.local/share/
ln -s ~/.config/zsh/profile .zprofile
chsh -s $(which zsh) # change default shell

# Install icon and theme
sudo tar -xf ~/.dotfiles/.assets/qogir-icon.tar.gz -C /usr/share/icons
sudo tar -xf ~/.dotfiles/.assets/tela-blue-icon.tar.gz -C /usr/share/icons
sudo tar -xf ~/.dotfiles/.assets/andromeda-theme.tar.gz -C /usr/share/themes

# Custom GRUB theme
# this is just add new file, not to worry
sudo cp ~/.dotfiles/.assets/99_mytheme /etc/grub.d
sudo update-grub

sudo apt autoremove

printf "\e[1;32mAll config and files are sourced\e[0m\n"
printf "\e[1;32mTo build firefox and neovim, read the instructions in this script\e[0m\n"
printf "\e[1;32mDon't forget to source tmux plugin in terminal\e[0m\n"
printf "\e[1;32mIcon was set in gtk3 config, and theme was set on zsh profile\e[0m\n"
printf "\e[1;32mJust note if you want to change it,\e[0m\n\n"
printf "\e[1;32mYou can now reboot! after login in tty1, it will auto start BSPWM session. Thanks you.\e[0m\n"

######################## End of script for my config #####################

###########################################################
################## BUILD INSTRUCTIONS #####################
###########################################################

## Build neovim from source
## https://github.com/neovim/neovim/wiki/Building-Neovim
# sudo apt-get install -y ninja-build gettext cmake unzip curl
# cds
# git clone https://github.com/neovim/neovim
# cd neovim
# git checkout stable
# make CMAKE_BUILD_TYPE=RelWithDebInfo
# sudo make install

# Or download neovim nightly (not recomended)
#wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
#chmod +x *appimage
#sudo mv nvim.appimage /usr/bin/nvim

## Build firefox:
# sudo apt install -y libdbus-glib-1-2 # require dependencies
# read: https://support.mozilla.org/en-US/kb/install-firefox-linux
# or this is the step:
# - download source code from official website
# - extract the file: tar xjf firefox-*.tar.bz2
# - mv firefox /opt
# - ln -s /opt/firefox/firefox /usr/local/bin/firefox
# - download .desktop file: wget https://raw.githubusercontent.com/mozilla/sumo-kb/main/install-firefox-linux/firefox.desktop
# - sudo mv firefox.desktop /usr/share/applications/
# nice....

## Nodejs (require for neovim config)
# Download binary file, and put the directory into ~/.local/src/
# ex: ~/.local/src/node-v18.16.0-linux-x64/*
# It has already source in zsh profile

###########################################################
########################## END ############################
###########################################################
