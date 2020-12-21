#!/usr/bin/env bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

main() {
	tmux command-prompt -p "pane:" "run-shell \"$CURRENT_DIR/validate_pane.sh '%1'\""
    tmux display-panes
}

main