# tmux
export PATH="$HOME/bin:$PATH"
alias tmux="tmux -2"
if [ -z "$TMUX" -a -z "$STY" ]; then
	if type tmux > /dev/null 2>&1; then
		tmux new-session -A -s "*scratch*"
	fi
fi

function create-session() {
	if [ $# -ne 0 ]; then
		target_dir=$1
	else
		target_dir='.'
	fi
	target_dir=$(cd $target_dir; pwd)
	session_name=$(echo $target_dir | grep -o "[^/]*/[^/]*$")

	# switch or create session
	if tmux has-session -t $session_name > /dev/null 2>&1; then
		tmux switch-client -t $session_name
		return
	fi
	TMUX= tmux new-session -d -s $session_name -c $target_dir -n console
	tmux switch-client -t $session_name

	# open 'editor', 'git' and 'test' windows
	tmux send-keys -t $session_name "tmux new-window -d -n editor" C-m
	tmux send-keys -t $session_name "tmux send-keys -t editor 'vim .' C-m" C-m
	tmux send-keys -t $session_name "tmux new-window -d -n git" C-m
	tmux send-keys -t $session_name "tmux new-window -d -n test" C-m

	tmux send-keys -t $session_name "tmux select-window -t console" C-m
	tmux send-keys -t $session_name "clear" C-m
}
alias cs="create-session"
