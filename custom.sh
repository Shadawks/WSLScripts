#!/usr/bin/env bash

# Install ZSH

sudo apt install zsh

# Change default shell to ZSH

chsh -s $(which zsh)

# Install Oh My ZSH

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install starship

curl -fsSL https://starship.rs/install.sh | sh

# Add starship to zsh config

echo 'eval "$(starship init zsh)"' >> ~/.zshrc

# Create .config folder if it doesn't exist

mkdir -p ~/.config

# Create starship config file

starship preset pastel-powerline -o ~/.config/starship.toml

# Install exa and bat

sudo apt install exa bat

# Add aliases to zsh config

echo "alias ls='exa --icons'" >> ~/.zshrc
echo "alias l='exa -lbF --icons'" >> ~/.zshrc
echo "alias ll='exa -l --icons'" >> ~/.zshrc
echo "alias la='exa -a --icons'" >> ~/.zshrc
echo "alias lla='exa -la --icons'" >> ~/.zshrc
echo "alias cat='batcat'" >> ~/.zshrc
echo "alias bat='batcat'" >> ~/.zshrc

# Install bottom

curl -LO https://github.com/ClementTsang/bottom/releases/download/0.9.3/bottom_0.9.3_amd64.deb
sudo dpkg -i bottom_0.9.3_amd64.deb

# Add bottom aliases to zsh config

echo "alias bottom='btm'" >> ~/.zshrc
echo "alias btom='btm'" >> ~/.zshrc

# Add weather alias to zsh config

echo "alias weather='curl wttr.in'" >> ~/.zshrc
echo "alias wtr='curl wttr.in'" >> ~/.zshrc

