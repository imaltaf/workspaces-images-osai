#!/bin/bash

# Install Oh My Posh
mkdir -p ~/bin
curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/bin

# Ensure ~/bin is in PATH
if ! grep -q 'export PATH=$PATH:~/bin' ~/.bashrc && [ -f ~/.bashrc ]; then
  echo 'export PATH=$PATH:~/bin' >> ~/.bashrc
fi

if ! grep -q 'export PATH=$PATH:~/bin' ~/.zshrc && [ -f ~/.zshrc ]; then
  echo 'export PATH=$PATH:~/bin' >> ~/.zshrc
fi

# Create poshthemes directory and download a theme
mkdir -p ~/.poshthemes
wget https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/craver.omp.json -O ~/.poshthemes/craver.omp.json

# Update .bashrc if it exists
if [ -f ~/.bashrc ]; then
  if ! grep -q 'eval "$(oh-my-posh init bash --config ~/.poshthemes/craver.omp.json)"' ~/.bashrc; then
    echo 'eval "$(oh-my-posh init bash --config ~/.poshthemes/craver.omp.json)"' >> ~/.bashrc
  fi
fi

# Update .zshrc if it exists
if [ -f ~/.zshrc ]; then
  if ! grep -q 'eval "$(oh-my-posh init zsh --config ~/.poshthemes/craver.omp.json)"' ~/.zshrc; then
    echo 'eval "$(oh-my-posh init zsh --config ~/.poshthemes/craver.omp.json)"' >> ~/.zshrc
  fi
fi

# Source the appropriate shell configuration file
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -f ~/.zshrc ]; then
  source ~/.zshrc
fi

echo "Oh My Posh has been installed and configured."
