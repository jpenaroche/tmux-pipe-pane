#!/usr/bin/env bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

main() {
   local pattern="$1"
    panes=$(tmux list-panes -F#{pane_index})

    # for i in ${panes[@]};do
    # echo "$i"
    # done

	tmux command-prompt -p "select pane:" "run-shell \"$CURRENT_DIR/select_pane.sh '%1'\""
    tmux display-panes
    local pane="$1"
    if [[ ${panes[*]} =~ "$pane" ]]
    then
	tmux command-prompt -p "command:" "run-shell \"$CURRENT_DIR/new_command.sh '%1'\""
    # Send instruction to selected pane
    local parameter="$1"
    tmux send-keys -t $pane "$instrution" Enter
    else
	tmux command-prompt -p "Sorry pane <<$pane>> is not active."
    fi
}

main