#!/bin/bash


## Firewall
echo "✔ Enabling firewall"
# Turn On Firewall
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1
# Enable stealth mode
sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -int 1

## Software update
echo "✔ Enabling automatic software updates"
# Check for updates
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticCheckEnabled -bool true
# Download new updates when available
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticDownload -bool true
# Install macOS updates
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticallyInstallMacOSUpdates -bool true
# Install app updates from the App Store
sudo defaults write /Library/Preferences/com.apple.commerce.plist AutoUpdate -bool true
# Install system data files and security updates
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist ConfigDataInstall -bool true
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist CriticalUpdateInstall -bool true

## Display sleep
echo "✔ Forcing display to sleep after 2 minutes"
# Turn display off after: 2 minutes
sudo pmset -a displaysleep 2

## Disable screensaver
echo "✔ Disabling screensaver"
defaults -currentHost write com.apple.screensaver idleTime 0

## Lock screen security
# Require password 5 seconds after sleep or screen saver begins
echo "❗Go to 'System Preferences' > 'Security & Privacy' and set 'Require password' to '5 seconds'."
read -n 1 -s -p "Press any key to continue"
echo ""

## Generic settings
# Fast keyboard repeat
echo "✔ Setting a fast keyboard repeat"
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10
defaults write -g ApplePressAndHoldEnabled -bool false

# Show inspector in all webviews
echo "✔ Showing inspector in all WebViews"
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Show all hidden files and folders
echo "✔ Showing hidden files and folders"
defaults write com.apple.finder AppleShowAllFiles YES

# Show all file extensions
echo "✔ Showing file extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Store screenshots in Screenshots folder on desktop
echo "✔ Storing screenshots in '~/Desktop/Screenshots'"
mkdir ~/Desktop/Screenshots
defaults write com.apple.screencapture location ~/Desktop/Screenshots

# Expanded save panel by default
echo "✔ Expanding save panels by default"
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true

# Enable tab key in modals
echo "✔ Enabling tab key in modals"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable auto-correct
echo "✔ Disabling auto-correct"
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Enable AirDrop over Ethernet and on Unsupported Macs
echo "✔ Enable AirDrop over Ethernet and on Unsupported Macs"
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Xcode command line tools
echo "✔ Installing Xcode command line tools"
read -n 1 -s -p "Press any key to continue";
echo ""
xcode-select --install
read -n 1 -s -p "Press any key to continue";

# Git settings
echo "✔ Configuring Git user settings"
read -r -p "Full name: " username
read -r -p "Email: " useremail
git config --replace-all --global user.name "$username"
git config --replace-all --global user.email "$useremail"
echo "✔ Configuring Git to use KeyChain for credentials"
git config --replace-all --global credential.helper osxkeychain

# SSH config
echo "✔ Configuring SSH to search for private keys in the format '~/.ssh/[remoteuser]@[remotehost]'"
mkdir -p ~/.ssh
chmod 700 ~/.ssh
echo "IdentityFile ~/.ssh/%r@%h" >> ~/.ssh/config
chmod 600 ~/.ssh/config

## Software
# Homebrew
echo "✔ Installing Homebrew"
read -n 1 -s -p "Press any key to continue";
echo ""
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo ""
echo ""

# 1Password
read -p "Do you want to install 1Password? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew cask install 1password
fi

# Google Chrome
read -p "Do you want to install Google Chrome? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew cask install google-chrome
fi

# iTerm2
read -p "Do you want to install iTerm2? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew cask install iterm2
fi

# Jetbrains Toolbox
read -p "Do you want to install Jetbrains Toolbox? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew cask install jetbrains-toolbox
fi

# Parallels Desktop
read -p "Do you want to install Parallels Desktop? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew cask install parallels
fi

# Postman
read -p "Do you want to install Postman? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew cask install postman
fi

# Sequel Pro Nightly
read -p "Do you want to install Sequel Pro Nightly? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew tap homebrew/cask-versions
    brew cask install sequel-pro-nightly
fi

# Slack
read -p "Do you want to install Slack? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew cask install slack
fi

# Spotify
read -p "Do you want to install Spotify? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew cask install spotify
fi

# Sublime Merge
read -p "Do you want to install Sublime Merge? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew cask install sublime-merge
fi

# Sublime Text
read -p "Do you want to install Sublime Text? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew cask install sublime-text
fi

# The Unarchiver
read -p "Do you want to install The Unarchiver? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew cask install the-unarchiver
fi

# Transmit
read -p "Do you want to install Transmit? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew cask install transmit
fi

# Zeplin
read -p "Do you want to install Zeplin? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew cask install zeplin
fi

# Node.js
read -p "Do you want to install Node.js? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew install node
fi

echo ""
echo ""

echo "✔ All done, enjoy!"
