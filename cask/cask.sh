# Install native apps
brew tap phinze/homebrew-cask
brew install brew-cask

function installcask() {
  brew cask install "${@}" 2> /dev/null
}

installcask google-chrome
installcask google-drive
installcask google-chrome-canary
installcask imagealpha
installcask imageoptim
installcask iterm2
installcask sublime-text # 3???
installcask the-unarchiver
installcask ukelele
installcask virtualbox
installcask vlc

installcask alfred
installcask dash
installcask dash
installcask charles
installcask firefox
installcask evernote
installcask hipchat
installcask sourcetree
installcask spotify
installcask sequel-pro
installcask skype
installcask brackets
installcask onepassword
installcask transmit
installcask filezilla
installcask mamp
installcask paralells
installcask opera

## Other potentials to check?
# Moom
# TweetDeck
# Mamp pro
# MS Office
# Safari