#!/bin/bash

# Set Hostname
sudo hostname ROTTENROOT

# Install Pip
sudo easy_install pip

# Install Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Brew Apps
brew install bash-git-prompt python3

# Add Cask
brew tap caskroom/cask

# Install Apps
brew cask install google-chrome pycharm rubymine phpstorm sequel-pro sublime-text dropbox iterm2

# Install DockUtil
curl https://raw.githubusercontent.com/kcrawford/dockutil/master/scripts/dockutil -o /usr/local/bin/dockutil
chmod a+x /usr/local/bin/dockutil

# Minimize Dock
dockutil --remove all
dockutil --add /Applications/Google\ Chrome.app
dockutil --add /Applications/iTerm.app
dockutil --add /Applications/Mail.app
dockutil --add /Applications/iTunes.app
dockutil --add /Applications/PyCharm.app
dockutil --add /Applications/PhpStorm.app
dockutil --add /Applications/RubyMine.app
dockutil --add /Applications/Sequel\ Pro.app
dockutil --add /Applications/Sublime\ Text.app
dockutil --add ~/Downloads --view grid --display folder
dockutil --add /Applications --view grid --display folder

