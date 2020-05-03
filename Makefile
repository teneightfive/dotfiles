DIR=$(HOME)/dotfiles
LATEST_RUBY="2.6.2"
NVM_DIR=$(HOME)/.nvm

all: brew ruby node symlinks

symlinks:
	@ln -sf $(DIR)/bash/aliases ~/.aliases
	@ln -sf $(DIR)/bash/bash_profile ~/.bash_profile
	@ln -sf $(DIR)/bash/bash_prompt ~/.bash_prompt
	@ln -sf $(DIR)/bash/exports ~/.exports
	@ln -sf $(DIR)/bash/functions ~/.functions
	@ln -sf $(DIR)/bash/path ~/.path
	@ln -sf $(DIR)/bash/git-completion.bash ~/.git-completion.bash
	@ln -sf $(DIR)/zsh/zshrc ~/.zshrc
	@ln -sf $(DIR)/zsh/tmux ~/.tmux.conf
	@ln -nsf $(DIR)/bin ~/bin
	@ln -sf $(DIR)/linter/jshintrc ~/.jshintrc
	@ln -sf $(DIR)/linter/scss-lint.yml ~/.scss-lint.yml
	@ln -sf $(DIR)/git/gitconfig ~/.gitconfig
	@ln -sf $(DIR)/git/gitignore_global ~/.gitignore_global
	@ln -sf $(DIR)/gem/gemrc ~/.gemrc
	@ln -nsf $(DIR)/bundle ~/.bundle
	@ln -sf $(DIR)/rbenv/default-gems ~/.rbenv/default-gems

ensure_brew:
	sh $(DIR)/scripts/ensure_homebrew.sh

brew: ensure_brew
	brew bundle

nvm:
	curl https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | NVM_DIR=$(NVM_DIR) PROFILE=$(HOME)/.bash_profile sh
	source $(NVM_DIR)/nvm.sh && nvm install 8
	source $(NVM_DIR)/nvm.sh && nvm install 10
	source $(NVM_DIR)/nvm.sh && nvm install 11
	source $(NVM_DIR)/nvm.sh && nvm alias default 11

node: nvm
	ruby $(DIR)/scripts/npm_bundles.rb

ruby:
	[ -d ~/.rbenv/versions/$(LATEST_RUBY) ] || rbenv install $(LATEST_RUBY)
	rbenv global $(LATEST_RUBY)

osx:
	sh $(DIR)/scripts/.osx
