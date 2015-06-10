#!/usr/bin/env ruby

brews = %w{
  autoconf
  automake
  bash
  bash-completion2
  brew-cask
  cloog-ppl015
  curl
  elasticsearch
  faac
  ffmpeg
  freetype
  freexl
  gcc46
  gdal
  gdbm
  geos
  giflib
  git
  git-extras
  git-flow
  gmp4
  gnupg
  jpeg
  json-c
  lame
  libevent
  libgeotiff
  libgpg-error
  libksba
  liblwgeom
  libmpc08
  libpng
  libspatialite
  libtiff
  libtool
  libxml2
  libyaml
  lzlib
  mongodb
  mpfr2
  node
  openssl
  ossp-uuid
  pkg-config
  postgresql
  ppl011
  proj
  python
  readline
  reattach-to-user-namespace
  redis
  scons
  selenium-server-standalone
  sqlite
  tmux
  vim
  wget
  x264
  xvid
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
