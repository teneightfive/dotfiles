# Install native apps
brew install caskroom/cask/brew-cask

function installcask() {
  brew cask install "${@}" 2> /dev/null
}

installcask alfred
installcask atom
installcask charles
installcask diffmerge
installcask dropbox
installcask firefox
installcask flux
installcask gopro-studio
installcask google-chrome
installcask google-drive
installcask handbrake
installcask imageoptim
installcask iterm2
installcask licecap
installcask opera
installcask pycharm
installcask sequel-pro
installcask sketch
installcask skype
installcask sourcetree
installcask spotify
installcask virtualbox
installcask vlc

## Can be synced via app store?
#installcask 1password
#installcask caffeine
#installcask dash
#installcask evernote
#installcask moom
#installcask slack
#installcask the-unarchiver
#installcask transmit

## Manual
#tweetdeck
