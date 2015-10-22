DIR=~/dotfiles

all: symlinks brew node ruby 

symlinks:
	@ln -sf $(DIR)/bash/aliases ~/.aliases
	@ln -sf $(DIR)/bash/bash_profile ~/.bash_profile
	@ln -sf $(DIR)/bash/bash_prompt ~/.bash_prompt
	@ln -sf $(DIR)/bash/bashrc ~/.bashrc
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
	@ln -sf $(DIR)/app_config/sublime/"Default (OSX).sublime-keymap" ~/"Library/Application Support/Sublime Text 3/Packages/User/Default (OSX).sublime-keymap"
	@ln -sf $(DIR)/app_config/sublime/"Package Control.sublime-settings" ~/"Library/Application Support/Sublime Text 3/Packages/User/Package Control.sublime-settings"
	@ln -sf $(DIR)/app_config/sublime/Preferences.sublime-settings ~/"Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
	@ln -nsf $(DIR)/app_config/sublime/snippets ~/"Library/Application Support/Sublime Text 3/Packages/User/snippets"

ensure_brew:
	ruby $(DIR)/scripts/ensure_homebrew.rb

brew: ensure_brew
	brew tap Homebrew/bundle
	brew bundle

nvm: brew
	source ~/.nvm/nvm.sh && nvm install 0.12
	source ~/.nvm/nvm.sh && nvm install 4
	source ~/.nvm/nvm.sh && nvm alias default 4

node: nvm
	ruby $(DIR)/scripts/npm_bundles.rb

LATEST_RUBY="2.2.3"
ruby:
	[ -d ~/.rbenv/versions/$(LATEST_RUBY) ] || rbenv install $(LATEST_RUBY)
	rbenv global $(LATEST_RUBY)

osx:
	sh $(DIR)/scripts/.osx
