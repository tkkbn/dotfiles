# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"

# FIXME: bottle neck for sourcing .zshrc
eval "$(rbenv init - --no-rehash zsh)"

# bundler
alias be="bundle exec"

# bundle open
export BUNDLER_EDITOR="/usr/local/bin/vim"

# rails
alias -g RET="RAILS_ENV=test"
alias -g RED="RAILS_ENV=development"
alias -g REP="RAILS_ENV=production"

# hash rocket
function hr() {
	sed -i '' -e 's/:\([a-zA-Z_]*\) =>/\1:/g' $1
}
