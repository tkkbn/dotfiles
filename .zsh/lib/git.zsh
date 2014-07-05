# Configuration for git
alias gs="git status"
alias gd="git diff"
alias ga="git commit -am"
alias gh="git branch"
alias co="git checkout"
alias gus="git branch | percol | xargs git checkout"
alias ghs="git branch | percol | xargs git branch -D"
alias amend="git commit --amend"

function gl(){
  if [ $# -ne 0 ]; then
    git log --date=iso --pretty=format:'%h %Cgreen%ad %Cblue%cn %Creset%s %C(blue)%d%Creset' $@
  else
    git log --date=iso --pretty=format:'%h %Cgreen%ad %Cblue%cn %Creset%s %C(blue)%d%Creset' -10
  fi
}

function gp(){
  if [ $# -ne 0 ]; then
    git push $@ `git rev-parse --abbrev-ref HEAD`
  else
    git push
  fi
}

function gg() {
  if [ -e .git ]; then
    git grep -n $@
  else
    find . -type f | xargs grep -n --color=auto $@
  fi
}

function up() {
  git branch --set-upstream-to=$@/master master
}

# Apply proxy for titech pubnet
alias titech="git config --global http.proxy 131.112.125.238:3128"
alias untitech="git config --global --unset http.proxy"

# git-hook
export PATH="$HOME/.git-hook/bin:$PATH"