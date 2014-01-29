# Dom's Dotfiles

My dotfiles and config files for Mac OSX. Shamelessly stolen from tonnes of dotfile repositories I found online, including [@jackfranklin](https://github.com/jackfranklin), [@mathiasbynens](https://github.com/mathiasbynens/) and [@paulirish](https://github.com/paulirish)

Files are symlinked into the proper location, and have the `.` added. For example:

    ~/dotfiles/bash/bash_profile => ~/.bash_profile
    ~/dotfiles/bin => ~/bin
    ~/dotfiles/git/gitconfig => ~/.gitconfig
    ...and so on

## Installing
- Clone repository (I recommend `~/dotfiles`). If you don't use `~/dotfiles`, you'll have to update a couple of the scripts to point them to the right place.
- `cd ~/dotfiles`
- `make`

### homebrew
- Add line to `Brewfile`.
- Run `make brew`

### node & npm
- The latest Node is installed via homebrew.
- Packages are managed in `scripts/npm_bundles.rb`.
- Add a new package, and run `make node`.

### gems
- Add gem to `scripts/gems.rb`
- Run `make gems`

### cask
-

### app config files
- ST
- iTerm

## Updating
You can run `make` at any time to keep things nice and tidy.

# Requirements

You'll need Ruby and Git installed initially, to first clone this repo and then to run `make` (which in turn calls various Ruby & Sh files. Once that's done, you'll have Ruby properly setup through `rbenv` and the latest Git installed also through homebrew, but you'll need some version of Ruby & Git to get started.

These dotfiles should be fairly agnostic about the OS and environment, but be aware this has only been tested on my machines (Mac, OS X Lion).

