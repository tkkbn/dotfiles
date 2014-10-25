# global aliases
alias -g B='`git branch | peco | sed -e "s/^\*[ ]*//g"`'
alias -g P='| peco | xargs '

if ! which peco > /dev/null; then
	return
fi

# history
function peco-select-history() {
	typeset tac
	if which tac > /dev/null; then
		tac=tac
	else
		tac='tail -r'
	fi
	BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER" --prompt "[zsh history]")
	CURSOR=$#BUFFER
	zle redisplay
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# integrate all source code with ghq
function peco-src() {
	local selected_dir=$(ghq list | peco --query "$LBUFFER" --prompt "[ghq list]")
	if [ -n "$selected_dir" ]; then
		BUFFER="cd ${GOPATH}/src/${selected_dir}"
		zle accept-line
	fi
	zle redisplay
}
zle -N peco-src
stty -ixon
bindkey '^s' peco-src

# process kill
function peco-pkill() {
	for pid in `ps aux | peco | awk '{ print $2 }'`
	do
		kill $pid
		echo "Killed ${pid}"
	done
}
alias pk="peco-pkill"

# search file recursively and append the path to the buffer
function peco-append-filepath() {
local selected_file=$(find . -type f | grep -v "\.\/\.git\/" | peco --prompt "[find file]")
	BUFFER="${BUFFER}${selected_file}"
	CURSOR=$#BUFFER
	zle redisplay
}
zle -N peco-append-filepath
bindkey '^q' peco-append-filepath