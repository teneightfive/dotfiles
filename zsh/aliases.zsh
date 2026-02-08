# Zsh Aliases
# Consolidated from bash/aliases with modern tool support

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Directory shortcuts
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/Projects"
alias df="cd ~/dotfiles"

# Dotfiles
alias reload="source ~/.zshrc"

# Git (complements oh-my-zsh git plugin)
alias gs="git status --short --branch"
alias gaa="git add --all"
alias gca="git add --all && git commit"

# Ruby
alias be="bundle exec"
alias bi="bundle install"

# Node/npm (modern - no --save needed)
alias n="node"
alias ni="npm install"
alias nui="npm uninstall"
alias nr="npm run"
alias ns="npm start"
alias ng="npm list -g --depth=0 2>/dev/null"

# Modern CLI replacements (with fallbacks)
if command -v eza &> /dev/null; then
    alias ls="eza"
    alias l="eza -l"
    alias la="eza -la"
    alias ll="eza -la"
    alias lt="eza -la --tree --level=2"
else
    alias l="ls -lF"
    alias la="ls -laF"
    alias ll="ls -laF"
fi

if command -v bat &> /dev/null; then
    alias cat="bat --paging=never"
    alias catp="bat"  # with paging
fi

# macOS utilities
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash"

# Clipboard
alias c="tr -d '\n' | pbcopy"
alias cpwd="pwd | tr -d '\n' | pbcopy"

# Network
alias ip="curl -s ifconfig.me"
alias localip="ipconfig getifaddr en0"

# Misc utilities
alias week='date +%V'
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'
alias urlencode='python3 -c "import sys, urllib.parse; print(urllib.parse.quote_plus(sys.argv[1]))"'

# Kill Chrome tabs to free memory
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Enable aliases to be sudo'ed
alias sudo='sudo '
