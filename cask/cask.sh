# Install native apps
brew tap phinze/homebrew-cask
brew install brew-cask

function installcask() {
  brew cask install "${@}" 2> /dev/null
}

# installcask dropbox
# installcask google-chrome
# installcask google-chrome-canary
# installcask imagealpha
# installcask imageoptim
# installcask iterm2
# installcask macvim
# installcask miro-video-converter
# installcask sublime-text 3???
# installcask the-unarchiver
# installcask ukelele
# installcask virtualbox
# installcask vlc

## Other potentials to check?
# Alfred 2
# Dash
# Charles Proxy
# Firefox
# Evernote
# HipChat
# Moom
# SourceTree
# Spotify
# TweetDeck
# Xcode???
# sequel-pro
# skype
# one-password
# brackets
# coda 2
# transmit / filezilla
# google drive
# mamp pro
# MS Office
# parallels
# safari
# opera

