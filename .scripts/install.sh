#!/usr/bin/env bash

set -e

# Ask for the administrator password upfront.
sudo -v
# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Xcode Command-Line Tools
if ! xcode-select -p ; then
	xcode-select --install
	exit 0
fi

# Check for Homebrew, Install if not here
which brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor || exit $?

# Update Homebrew
brew update

# Install Homebrew Bundle
brew tap 'homebrew/bundle'

# List dependencies to uninstall, apend --force to actually uninstall
brew bundle cleanup # --force

# Upgrade installed dependencies
brew upgrade


# Check and installs dependencies in Brewfile
brew bundle check || brew bundle install


# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Change shell to Zsh
chsh -s $(which zsh)