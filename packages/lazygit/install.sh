#!/bin/bash

# # For Debian 13 "Trixie", Sid, and later, or Ubuntu 25.10 "Questing Quokka" and later:
# sudo apt install lazygit -y

mkdir -p "$HOME/src"
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
LAZYGIT_ARCH=$(uname -m | sed -e 's/aarch64/arm64/')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_${LAZYGIT_ARCH}.tar.gz" --output-dir "$HOME/src"

tar xf "$HOME/src/lazygit.tar.gz" "$HOME/src/lazygit"
sudo install "$HOME/src/lazygit" -D -t /usr/local/bin/
