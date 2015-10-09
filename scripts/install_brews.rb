#!/usr/bin/env ruby

brews = %w{
  ack
  bash
  boot2docker
  curl
  elasticsearch
  faac
  ffmpeg
  freetype
  gdal
  git
  git-extras
  git-flow
  gnupg
  lame
  libksba
  libxml2
  mongodb
  node
  openssl
  ossp-uuid
  postgresql
  python
  python3
  reattach-to-user-namespace
  redis
  scons
  selenium-server-standalone
  tmux
  vim
  wget
  youtube-dl
}

INSTALLED_BREWS = `brew list`.split("\n")

# update brew
puts `brew update`
# upgrade any already-installed formulae
puts `brew upgrade`

brews.each do |brew|
  if INSTALLED_BREWS.include?(brew)
    puts "#{brew} already installed"
  else
    puts "Installing #{brew}"
    puts `brew install #{brew}`
  end

end

# Remove outdated versions from the cellar
puts `brew cleanup`
puts `brew prune`
