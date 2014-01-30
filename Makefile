DIR=~/dotfiles

all: symlinks ensure_brew brew ruby_env gems node

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
	@ln -nsf $(DIR)/vim/vim ~/.vim
	@ln -sf $(DIR)/vim/vimrc ~/.vimrc
	@ln -nsf $(DIR)/vim/plugin ~/.vim/plugin
	@ln -sf $(DIR)/tmux/tmux.conf ~/.tmux.conf
	@ln -sf $(DIR)/git/gitconfig ~/.gitconfig
	@ln -sf $(DIR)/git/gitignore_global ~/.gitignore_global
	@ln -sf $(DIR)/gem/gemrc ~/.gemrc
	@ln -sf $(DIR)/task/taskrc ~/.taskrc
	@ln -sf $(DIR)/ctags/ctags ~/.ctags

ensure_brew:
	ruby $(DIR)/scripts/ensure_homebrew.rb

ruby_env:
# 	ruby $(DIR)/scripts/ruby_env.rb

gems:
	ruby $(DIR)/scripts/gems.rb

brew: Brewfile
	brew bundle Brewfile

node:
	ruby $(DIR)/scripts/npm_bundles.rb

casks:
	@bash ./cask/cask.sh

osx:
	@./scripts/osx.sh