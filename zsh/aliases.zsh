# GIT
function gcob() {
  git checkout -b "$@" && git push -u origin "$@"
}
function gcl() {
  git clone "$@" && cd `echo $_ | sed -n -e 's/^.*\/\([^.]*\)\(.git\)*/\1/p'`
}

# git
alias gs="git status --short --branch"

# ruby
alias be="bundle exec"
alias bi="bundle install"

# npm
alias n="node"
alias ni="npm install"
alias nis="npm install --save"
alias nisd="npm install --save-dev"
alias nui="npm uninstall"
alias nr="npm run"
alias ns="npm start"
alias ng="npm list -g --depth=0 2>/dev/null"
