source ~/.zsh/lib/go.zsh
source ~/.zsh/lib/aliases.zsh
source ~/.zsh/lib/basic.zsh
source ~/.zsh/lib/completion.zsh
source ~/.zsh/lib/functions.zsh
source ~/.zsh/lib/overrides.zsh
source ~/.zsh/lib/git.zsh
source ~/.zsh/lib/languages.zsh
source ~/.zsh/lib/peco.zsh
source ~/.zsh/lib/theme.zsh
source ~/.zsh/lib/tmux.zsh

# Environment-local configurations
[ -f ~/.zshrc.local ]   && source ~/.zshrc.local
[ -f ~/.zshrc.`uname` ] && source ~/.zshrc.`uname`
