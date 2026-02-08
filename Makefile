DIR=$(HOME)/dotfiles
LATEST_RUBY="3.3"

# Machine profile: personal or work (default: personal)
BREW_PROFILE ?= personal

# Main targets
all: brew omz volta runtimes symlinks local-config
	@echo ""
	@echo "=== Setup complete! ==="
	@echo "Run 'source ~/.zshrc' or open a new terminal to apply changes."
	@echo ""
	@echo "Don't forget to:"
	@echo "  1. Edit ~/.gitconfig.local with your GPG signing key"
	@echo "  2. Edit ~/.zshrc.local for machine-specific settings"

# Oh My Zsh and plugins
omz:
	@bash $(DIR)/scripts/install_omz.sh

# Homebrew with profile support
ensure_brew:
	@bash $(DIR)/scripts/install_homebrew.sh

brew: ensure_brew
	@echo "Installing Homebrew packages (profile: $(BREW_PROFILE))..."
	brew bundle --file=$(DIR)/brew/Brewfile.$(BREW_PROFILE)

# Volta for Node.js
volta:
	@echo "Setting up Volta for Node.js..."
	@command -v volta >/dev/null 2>&1 || curl https://get.volta.sh | bash -s -- --skip-setup
	@export VOLTA_HOME="$$HOME/.volta" && export PATH="$$VOLTA_HOME/bin:$$PATH" && \
		volta install node@22 && \
		volta install node@lts

# Mise for Ruby/Python
runtimes:
	@echo "Setting up mise for Ruby/Python..."
	@if command -v mise >/dev/null 2>&1; then \
		cd $(DIR) && MISE_CONFIG_FILE=$(DIR)/zsh/.mise.toml mise install; \
	 elif [ -f ~/.local/bin/mise ]; then \
		cd $(DIR) && MISE_CONFIG_FILE=$(DIR)/zsh/.mise.toml ~/.local/bin/mise install; \
	else \
		echo "mise not found. Install with: brew install mise"; \
	fi

# Symlinks
symlinks:
	@echo "Creating symlinks..."
	@ln -sf $(DIR)/zsh/zshrc ~/.zshrc
	@ln -sf $(DIR)/zsh/tmux.conf ~/.tmux.conf
	@ln -sf $(DIR)/zsh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
	@ln -nsf $(DIR)/bin ~/bin
	@ln -sf $(DIR)/git/gitconfig ~/.gitconfig
	@ln -sf $(DIR)/git/gitignore_global ~/.gitignore_global
	@ln -sf $(DIR)/ruby/gemrc ~/.gemrc
	@mkdir -p ~/.config
	@ln -sf $(DIR)/zsh/starship.toml ~/.config/starship.toml
	@mkdir -p ~/.config/ghostty
	@ln -sf $(DIR)/ghostty/config ~/.config/ghostty/config

# Local config setup (only creates if doesn't exist)
local-config:
	@echo "Setting up local config files..."
	@test -f ~/.gitconfig.local || cp $(DIR)/git/gitconfig.local.example ~/.gitconfig.local
	@test -f ~/.zshrc.local || cp $(DIR)/zsh/local.zsh.example ~/.zshrc.local
	@echo "Local config files ready at ~/.gitconfig.local and ~/.zshrc.local"

# Homebrew cleanup
cleanup:
	@echo "Previewing packages to remove..."
	@bash $(DIR)/scripts/brew_cleanup.sh $(DIR)/brew/Brewfile.$(BREW_PROFILE)

cleanup-force:
	@echo "Removing deprecated packages..."
	@bash $(DIR)/scripts/brew_cleanup.sh $(DIR)/brew/Brewfile.$(BREW_PROFILE) --force

cleanup-zap:
	@echo "Removing deprecated packages and app data..."
	@bash $(DIR)/scripts/brew_cleanup.sh $(DIR)/brew/Brewfile.$(BREW_PROFILE) --force --zap

# macOS defaults
osx:
	@bash $(DIR)/scripts/.osx

# Help
help:
	@echo "Available targets:"
	@echo "  make all                    - Full setup (default profile: personal)"
	@echo "  make all BREW_PROFILE=work  - Full setup with work profile"
	@echo "  make brew                   - Install Homebrew packages"
	@echo "  make omz                    - Install Oh My Zsh and plugins"
	@echo "  make volta                  - Setup Volta for Node.js"
	@echo "  make runtimes               - Setup mise for Ruby/Python"
	@echo "  make symlinks               - Create config symlinks"
	@echo "  make local-config           - Create machine-specific config files"
	@echo "  make cleanup                - Preview deprecated packages to remove"
	@echo "  make cleanup-force          - Remove deprecated packages"
	@echo "  make cleanup-zap            - Remove packages and app data"
	@echo "  make osx                    - Apply macOS system defaults"

.PHONY: all omz ensure_brew brew volta runtimes symlinks local-config cleanup cleanup-force cleanup-zap osx help
