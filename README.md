# Dom's Dotfiles

My dotfiles and config for macOS. Supports both Intel and Apple Silicon Macs, with separate profiles for personal and work machines.

## Structure

```text
dotfiles/
├── Brewfile              # Shared Homebrew packages
├── Brewfile.personal     # Personal machine packages (includes Brewfile)
├── Brewfile.work         # Work machine packages (includes Brewfile)
├── Makefile              # Setup and management commands
├── .mise.toml            # Ruby & Python versions (via mise)
├── starship.toml         # Starship prompt config
├── bin/                  # Custom scripts on $PATH
├── gem/                  # Gem configuration
├── ghostty/              # Ghostty terminal config
├── git/
│   ├── gitconfig              # Shared git config
│   ├── gitconfig.local.example # Template for machine-specific GPG key/email
│   └── gitignore_global       # Global gitignore
├── scripts/
│   ├── brew_cleanup.sh        # Remove deprecated Homebrew packages
│   ├── ensure_homebrew.sh     # Install Homebrew if missing
│   └── install_omz.sh        # Install Oh My Zsh + plugins
└── zsh/
    ├── zshrc                  # Main shell config
    ├── aliases.zsh            # Aliases (loaded via OMZ custom dir)
    ├── functions.zsh          # Shell functions
    ├── homebrew.zsh           # Architecture-aware Homebrew paths
    ├── local.zsh.example      # Template for machine-specific shell config
    └── tmux.conf              # Tmux configuration
```

## Quick Start

```sh
git clone https://github.com/your-user/dotfiles.git ~/dotfiles
cd ~/dotfiles
make                          # personal machine (default)
make all BREW_PROFILE=work    # work machine
```

This will install Homebrew packages, Oh My Zsh, Volta, mise runtimes, create symlinks, and set up local config templates.

After setup, edit the local config files for this machine:

- `~/.gitconfig.local` — GPG signing key, work email overrides
- `~/.zshrc.local` — machine-specific PATH, env vars, aliases

## Key Tools

| Tool                                             | Purpose                          |
| ------------------------------------------------ | -------------------------------- |
| [Volta](https://volta.sh)                        | Node.js version management       |
| [mise](https://mise.jdx.dev)                     | Ruby & Python version management |
| [Starship](https://starship.rs)                  | Cross-shell prompt               |
| [Ghostty](https://ghostty.org)                   | GPU-accelerated terminal         |
| [zoxide](https://github.com/ajeetdsouza/zoxide)  | Smarter `cd` (replaces `z`)      |
| [delta](https://github.com/dandavella/delta)     | Better git diffs                 |
| [Oh My Zsh](https://ohmyz.sh)                    | Zsh framework + plugins          |

## Make Targets

```sh
make all                    # Full setup (personal profile)
make all BREW_PROFILE=work  # Full setup (work profile)
make brew                   # Install Homebrew packages
make omz                    # Install Oh My Zsh and plugins
make volta                  # Setup Volta + Node LTS
make runtimes               # Setup mise + Ruby/Python
make symlinks               # Create config symlinks
make local-config           # Create machine-specific config templates
make cleanup                # Preview deprecated packages to remove
make cleanup-force          # Remove deprecated packages
make osx                    # Apply macOS system defaults
```

## Multi-Machine Setup

Config that varies between machines lives in local files that are **not** checked into git:

- **`~/.gitconfig.local`** — GPG signing key, email overrides, machine-specific SSH keys
- **`~/.zshrc.local`** — extra PATH entries, work API keys, machine-specific aliases

Templates are copied on first run. See [gitconfig.local.example](git/gitconfig.local.example) and [local.zsh.example](zsh/local.zsh.example).

## Homebrew Profiles

The base `Brewfile` contains shared tools. Profile-specific files extend it:

- **`Brewfile.personal`** — personal apps (games, media, etc.)
- **`Brewfile.work`** — work apps (Slack, Zoom, AWS CLI, etc.)

To add a package, edit the appropriate Brewfile and run `make brew`.

To clean up old packages no longer in your Brewfile:

```sh
make cleanup          # preview what would be removed
make cleanup-force    # remove packages
```

## macOS Defaults

```sh
make osx
```

Applies opinionated macOS system preferences (Finder, Dock, keyboard, etc.).
