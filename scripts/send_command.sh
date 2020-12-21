
#!/usr/bin/env bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

PANE=$2

instruction="$1"

main() {
    local pane="$1"
    local instruction="$2"

     tmux send-keys -t $pane "$instruction" Enter
	   tmux display-message "Executing command: \"$instruction\" in pane $pane"
}

main "$PANE" "$instruction"