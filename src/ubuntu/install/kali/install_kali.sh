#!/bin/bash
set -e

# Update package list and install Kali tools
apt-get update
apt-get install -y \
  kali-tools-top10 \
  autopsy \
  cutycapt \
  dirbuster \
  faraday \
  fern-wifi-cracker \
  guymager \
  hydra \  # Replaced hydra-gtk with hydra
  legion \
  ophcrack \
  ophcrack-cli \
  sqlitebrowser

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
