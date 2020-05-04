# GIT
function gcob() {
  git checkout -b "$@" && git push -u origin "$@"
}
function gcl() {
  git clone "$@" && cd `echo $_ | sed -n -e 's/^.*\/\([^.]*\)\(.git\)*/\1/p'`
}
