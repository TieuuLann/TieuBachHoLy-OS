#!/bin/bash

# Termux-os Script

echo "[+] Installing necessary packages..."
pkg install -y zsh termux-extra-keys figlet neofetch wget git

echo "[+] Downloading custom color properties..."
wget -O $HOME/.colors.properties https://raw.githubusercontent.com/h4ck3r0/Termux-os/master/.object/.colors.properties

echo "[+] Setting up Zsh configuration..."

# Your Name Banner
echo "Enter Your Name:"
read username
echo "figlet -f ANSI_Shadow $username" >> ~/.zshrc
echo "export PS1='%F{green}\$(figlet -f ANSI_Shadow $username)%f@%F{blue}termux%f:%F{cyan}%~%f %# '" >> ~/.zshrc

# Customize Zsh theme (add your own theme here)
echo "ZSH_THEME=\"agnoster\"" >> ~/.zshrc

# Highlight / Autosuggestion
echo "plugins=(git colored-man-pages colorize extract zsh-autosuggestions)" >> ~/.zshrc

# Enable Termux Extra Keys
echo "extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]" >> $PREFIX/etc/termux.properties

# Enable color prompt
echo "export TERM=xterm-256color" >> ~/.zshrc

# Set up a custom welcome message
echo "echo 'Welcome to Termux-os!'" >> ~/.zshrc

# Install additional packages for functionality
echo "[+] Installing additional packages for functionality..."
pkg install -y vim nano htop tree

# Set up an alias for updating packages
echo "alias updatepkg='pkg update && pkg upgrade -y'" >> ~/.zshrc

# Set up an alias for clearing the screen
echo "alias cls='clear'" >> ~/.zshrc

# Source the updated configuration
source ~/.zshrc

echo "[+] Setup complete!"
