# Zsh functions
# Consolidated from bash/functions with Python 3 compatibility

# Create directory and cd into it
mkd() {
    mkdir -p "$@" && cd "$@"
}

# Git clone and cd into repo
unalias gcl 2>/dev/null
gcl() {
    git clone "$1" && cd "$(basename "$1" .git)"
}

# Create branch and push upstream
gcob() {
    git checkout -b "$@" && git push -u origin "$@"
}

# cd to current Finder window
cdf() {
    cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}

# File/directory size
fs() {
    if [[ -n "$@" ]]; then
        du -sh -- "$@"
    else
        du -sh .[^.]* * 2>/dev/null
    fi
}

# Simple calculator
calc() {
    local result="$(printf "scale=10;$*\n" | bc --mathlib | tr -d '\\\n')"
    echo "$result" | sed -e 's/^\./0./' -e 's/^-\./-0./' -e 's/0*$//;s/\.$//'
}

# Quick HTTP server (Python 3)
serve() {
    local port="${1:-8000}"
    echo "Serving at http://localhost:$port"
    python3 -m http.server "$port"
}

# Show SSL certificate names for a domain
getcertnames() {
    if [[ -z "$1" ]]; then
        echo "Usage: getcertnames domain.com"
        return 1
    fi
    echo | openssl s_client -connect "$1:443" -servername "$1" 2>/dev/null | \
        openssl x509 -noout -text | \
        grep -A1 "Subject Alternative Name" | \
        tail -1 | \
        tr ',' '\n' | \
        sed 's/DNS://g' | \
        sed 's/^ *//'
}

# Remove macOS quarantine attribute
unquarantine() {
    xattr -r -d com.apple.quarantine "$@"
}

# Compare gzip sizes
gz() {
    local origsize=$(wc -c < "$1")
    local gzipsize=$(gzip -c "$1" | wc -c)
    local ratio=$(echo "$gzipsize * 100 / $origsize" | bc -l)
    printf "orig: %d bytes\n" "$origsize"
    printf "gzip: %d bytes (%2.2f%%)\n" "$gzipsize" "$ratio"
}

# Create a data URL from a file
dataurl() {
    local mimeType=$(file -b --mime-type "$1")
    if [[ $mimeType == text/* ]]; then
        mimeType="${mimeType};charset=utf-8"
    fi
    echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

# Extract most archives
extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"     ;;
            *.tar.gz)    tar xzf "$1"     ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar e "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xf "$1"      ;;
            *.tbz2)      tar xjf "$1"     ;;
            *.tgz)       tar xzf "$1"     ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
