#!/usr/bin/env bash

#
# Check if Homebrew is installed
#
which -s brew
if [[ $? != 0 ]] ; then
	# Install Homebrew
	# http://brew.sh/
  echo "Installing Homebrew."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  # Make sure we’re using the latest Homebrew.
	brew update
fi

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location
BREW_PREFIX=$(brew --prefix)

# Installs Casks
brew tap homebrew/cask
brew tap heroku/brew

# Tools
brew install wget --with-iri
brew install gmp
brew install grep
brew install gnupg
brew install heroku
brew install node
brew install curl
brew install watch

brew install git
brew install git-lfs
brew install git-crypt
brew install git-extras
brew install github/gh/gh

brew install jq

brew install zsh

# brew install kubernetes-cli
# brew install openssl
# brew install pinentry-mac
# brew install postgresql
# brew install python
# brew install python3
# brew install rbenv
# brew install rbenv-default-gems
# brew install redis
# brew install ruby-build
# brew install s3cmd
# brew install selenium-server-standalone
# brew install sqlite
# brew install tmuxinator

# Apps
brew install --cask alfred
brew install --cask authy
brew install --cask caffeine
brew install --cask dash
brew install --cask docker
brew install --cask firefox
brew install --cask firefox-developer-edition
brew install --cask flux
brew install --cask funter
brew install --cask google-chrome
brew install --cask homebrew/cask-versions/google-chrome-canary
brew install --cask google-drive
brew install --cask gpg-suite
brew install --cask imageoptim
brew install --cask keybase
brew install --cask moom
brew install --cask postman
brew install --cask rescuetime
brew install --cask slack
brew install --cask spotify
brew install --cask visual-studio-code

# Remove outdated versions from the cellar.
brew cleanup
