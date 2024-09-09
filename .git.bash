alias gs='git status'
alias ga='git add'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gr='git reset'
alias gl='git log --oneline'

# git branch
alias gb='git branch'
alias gbm='git branch -m'
alias gbd='git branch -d'
alias gbdd='git branch -D'

# diff, merge
alias gd='git diff'
alias gdi='git icdiff'
alias gdc='git diff --cached'
alias gdci='git icdiff --cached'
# alias gm='git mergetool --tool=p4merge'

# fetch, push, commit
alias gfo='git fetch -p origin'
alias gpo='git push origin "$(git rev-parse --abbrev-ref HEAD)"'
alias gca='git commit --amend'
# git undo amend
alias gua='git reset --soft HEAD@{1}'
gc() {
    if [ -z "$1" ]
    then
        git commit
    else
        git commit -m "$1"
    fi
}

# git tag
alias gtl='git tag --list'
alias gtd='git tag --delete'
# Delete remote tags
alias gtrd='git push --delete origin'
gtdd() {
    git tag --delete $1
    git push --delete origin $1
}

# stash
alias gss='git stash save'
alias gsp='git stash pop'
alias gsl='git stash list'
# view the contents of a git stash without applying it
gsv() {
    git stash show -p stash@{$1}
}

gsd() {
    git stash drop stash@{$1}
}

gsa() {
    git stash apply stash@{$1}
}

# merge remote branch to local, `gi` shorts for `git integrate`
gm() {
    # https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
    local current_branch="$(git rev-parse --abbrev-ref HEAD)"
    local branch=${1:-$current_branch}

    echo git fetch -p origin
    git fetch -p origin

    echo
    echo git merge --no-edit "origin/$branch"
    git merge --no-edit "origin/$branch"
}

# gib () {
#     git fetch -p origin
#     git merge --no-edit origin/$1
#     git rebase origin/$1
# }

grb () {
    git fetch -p origin
    git rebase --update-refs origin/$1
}
