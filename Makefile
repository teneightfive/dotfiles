DIR=~/dotfiles
LATEST_RUBY="2.2.3"
SUBLIME_DIR=~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
NVM_DIR=~/.nvm

all: brew node ruby symlinks

symlinks:
	@ln -sf $(DIR)/bash/aliases ~/.aliases
	@ln -sf $(DIR)/bash/bash_profile ~/.bash_profile
	@ln -sf $(DIR)/bash/bash_prompt ~/.bash_prompt
	@ln -sf $(DIR)/bash/exports ~/.exports
	@ln -sf $(DIR)/bash/functions ~/.functions
	@ln -sf $(DIR)/bash/path ~/.path
	@ln -sf $(DIR)/bash/git-completion.bash ~/.git-completion.bash
	@ln -nsf $(DIR)/bin ~/bin
	@ln -sf $(DIR)/git/gitconfig ~/.gitconfig
	@ln -sf $(DIR)/git/gitignore_global ~/.gitignore_global
	@ln -sf $(DIR)/gem/gemrc ~/.gemrc
	@ln -nsf $(DIR)/bundle ~/.bundle
	@ln -sf $(DIR)/rbenv ~/.rbenv
	@ln -sf $(DIR)/sublime/"Default (OSX).sublime-keymap" $(SUBLIME_DIR)/"Default (OSX).sublime-keymap"
	@ln -sf $(DIR)/sublime/Package\ Control.sublime-settings $(SUBLIME_DIR)/Package\ Control.sublime-settings
	@ln -sf $(DIR)/sublime/Preferences.sublime-settings $(SUBLIME_DIR)/Preferences.sublime-settings
	@ln -nsf $(DIR)/sublime/snippets $(SUBLIME_DIR)/snippets

ensure_brew:
	sh $(DIR)/scripts/ensure_homebrew.sh

brew: ensure_brew
	brew tap Homebrew/bundle
	brew bundle

nvm: 
	curl https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | NVM_DIR=$(NVM_DIR) PROFILE=~/.bash_profile sh
	source $(NVM_DIR)/nvm.sh && nvm install 0.12
	source $(NVM_DIR)/nvm.sh && nvm install 4
	source $(NVM_DIR)/nvm.sh && nvm alias default 4

node: nvm
	ruby $(DIR)/scripts/npm_bundles.rb

ruby:
	[ -d ~/.rbenv/versions/$(LATEST_RUBY) ] || rbenv install $(LATEST_RUBY)
	rbenv global $(LATEST_RUBY)

osx:
	sh $(DIR)/scripts/.osx
