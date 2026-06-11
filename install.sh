#!/bin/bash

# Set up XDG_CONFIG_HOME
export XDG_CONFIG_HOME="$HOME"/.config
mkdir -p "$XDG_CONFIG_HOME"

# Create symlinks for existing configurations
ln -sf "$PWD/nvim" "$XDG_CONFIG_HOME"/nvim
ln -sf "$PWD/.inputrc" "$HOME"/.inputrc
ln -sf "$PWD/.tmux.conf" "$HOME"/.tmux.conf

# Fetch and set up Zsh configuration files from my main dotfiles repo

curl -o "$HOME/.zshrc" https://raw.githubusercontent.com/zimkaa/.dotfiles/main/.zshrc

mkdir -p "$XDG_CONFIG_HOME/ohmyposh"

curl -o "$XDG_CONFIG_HOME/ohmyposh/like_p10k.toml" https://raw.githubusercontent.com/zimkaa/.dotfiles/main/.config/ohmyposh/like_p10k.toml

git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

chmod +x /home/vscode/dotfiles/packages/before.sh

cd /home/vscode/dotfiles/packages/

./before.sh
