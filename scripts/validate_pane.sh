
#!/usr/bin/env bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

PATTERN=$1

main() {
    local pattern="$1"
    panes=$(tmux list-panes -F#{pane_index})

    # for i in ${panes[@]};do
    # echo "$i"
    # done

    if [[ ${panes[*]} =~ "$pattern" ]]
    then
	    tmux command-prompt -p "command:" "run-shell \"$CURRENT_DIR/send_command.sh '%1' '$pattern'\""
    else
	   tmux display-message "Sorry pane <<$pattern>> is not active."
    fi
}

main "$PATTERN"