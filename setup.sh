#!/bin/bash

if [ $# -ne 2 ];
then
    echo "Usage:"
    echo "\t./setup.sh <hostname>"
fi

# Set Hostname
sudo hostname $1

# Configure git
git config --global user.email "ruu1989@me.com"
git config --global user.name "Ruu Mouat"
git config --global push.default simple

# Install Pip
sudo easy_install pip

# Install venv globally
sudo pip install virtualenv

# Install Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Brew Apps
brew install bash-git-prompt python3 fortune cowsay mysql npm

# Add Cask
brew tap caskroom/cask

function install_cask_with_retry {
    brew cask install $1
    if [ $? -ne 0 ]
    then
        echo "Uh oh, failed to install... Sod it; let's try again!"
        brew cask install $1
    fi
}

# Install Apps
install_cask_with_retry google-chrome
install_cask_with_retry pycharm
install_cask_with_retry rubymine
install_cask_with_retry phpstorm
install_cask_with_retry sequel-pro
install_cask_with_retry sublime-text
install_cask_with_retry dropbox
install_cask_with_retry slack
install_cask_with_retry mamp
install_cask_with_retry vagrant
install_cask_with_retry virtualbox
install_cask_with_retry dashlane

# Install DockUtil
curl https://raw.githubusercontent.com/kcrawford/dockutil/master/scripts/dockutil -o /usr/local/bin/dockutil
chmod a+x /usr/local/bin/dockutil

# Minimize Dock
dockutil --remove all
dockutil --add /Applications/Google\ Chrome.app
dockutil --add /Applications/Utilities/Terminal.app
dockutil --add /Applications/Mail.app
dockutil --add /Applications/Slack.app
dockutil --add /Applications/iTunes.app
dockutil --add /Applications/PyCharm.app
dockutil --add /Applications/PhpStorm.app
dockutil --add /Applications/RubyMine.app
dockutil --add /Applications/Sequel\ Pro.app
dockutil --add /Applications/Sublime\ Text.app
dockutil --add /Applications/MAMP/MAMP.app
dockutil --add /Applications/Virtualbox.app
dockutil --add ~/Downloads --view grid --display folder
dockutil --add /Applications --view grid --display folder

# Launch Dropbox to enable login and setup
/Applications/Dropbox.app/Contents/MacOS/Dropbox &

# Wait for dropbox to begin sync
while [ ! -s ~/Dropbox/id_rsa.enc ] ;
do
    sleep 1
done

while [ ! -s ~/Dropbox/id_rsa.pub ] ;
do
    sleep 1
done

# Decrypt private key
mkdir -p ~/.ssh
openssl enc -d -aes-256-cbc -in ~/Dropbox/id_rsa.enc -out ~/.ssh/id_rsa
chmod 0600 ~/.ssh/id_rsa
cp ~/Dropbox/id_rsa.pub ~/.ssh

# Copy .dotfiles
./update_dotfiles.sh

# Uses apple script to switch to the dark theme
osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to not dark mode'
