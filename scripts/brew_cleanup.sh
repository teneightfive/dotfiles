#!/bin/bash
# Remove deprecated packages from old Brewfile versions
# Run this after updating to the new Brewfile structure
#
# Usage:
#   ./brew_cleanup.sh                    # Preview what would be removed (personal)
#   ./brew_cleanup.sh Brewfile.work      # Preview for work profile
#   ./brew_cleanup.sh --force            # Actually remove packages
#   ./brew_cleanup.sh --force --zap      # Remove packages and app data

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"

# Default to personal profile, or use first argument if it's a Brewfile
if [[ "$1" == Brewfile* ]]; then
    BREWFILE="$DOTFILES_DIR/$1"
    shift
else
    BREWFILE="$DOTFILES_DIR/Brewfile.personal"
fi

echo "=== Homebrew Cleanup ==="
echo "Using Brewfile: $BREWFILE"
echo ""

if [ ! -f "$BREWFILE" ]; then
    echo "Error: Brewfile not found at $BREWFILE"
    exit 1
fi

# Show what would be removed
echo "Packages that would be REMOVED (not in Brewfile):"
echo "---"
brew bundle cleanup --file="$BREWFILE" 2>/dev/null || true
echo "---"
echo ""

# Handle --force flag
if [[ "$*" == *"--force"* ]]; then
    ZAP_FLAG=""
    [[ "$*" == *"--zap"* ]] && ZAP_FLAG="--zap"

    echo "Removing packages..."
    brew bundle cleanup --force $ZAP_FLAG --file="$BREWFILE"
    echo ""
    echo "Cleanup complete!"
else
    echo "To actually remove these packages, run:"
    echo "  $0 $(basename $BREWFILE) --force"
    echo ""
    echo "To also remove cask app data (preferences, caches), run:"
    echo "  $0 $(basename $BREWFILE) --force --zap"
fi
