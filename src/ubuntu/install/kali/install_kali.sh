#!/bin/bash
set -e

# Update package list
apt-get update

# Function to install a package if available
install_package() {
  if apt-cache show "$1" > /dev/null 2>&1; then
    echo "Installing $1..."
    apt-get install -y "$1"
  else
    echo "Package $1 not found, skipping."
  fi
}

# Install Kali tools, with conditional checks for availability
install_package kali-tools-top10
install_package autopsy
install_package cutycapt
install_package dirbuster
install_package faraday
install_package fern-wifi-cracker
install_package guymager
install_package hydra     # Replaced hydra-gtk with hydra
install_package legion
install_package ophcrack
install_package ophcrack-cli
install_package sqlitebrowser

# Remove packages that will be installed separately
apt-get purge -y \
  firefox-esr \
  chromium
rm -f /usr/share/xfce4/panel/plugins/power-manager-plugin.desktop

# Cleanup if SKIP_CLEAN is not set
if [ -z "${SKIP_CLEAN+x}" ]; then
  apt-get autoclean
  rm -rf \
    /var/lib/apt/lists/* \
    /var/tmp/*
fi
