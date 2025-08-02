#!/usr/bin/env bash

SESSION_NAME="${1:-$(tmux display-message -p '#S')}"
LAYOUT_FILE="$HOME/.tmux/layouts/${SESSION_NAME}.yml"

mkdir -p "$HOME/.tmux/layouts"

echo "session_name: $SESSION_NAME" > "$LAYOUT_FILE"
echo "windows:" >> "$LAYOUT_FILE"

tmux list-windows -t "$SESSION_NAME" -F '#I:#W' | while IFS=: read -r index name; do
    echo "  - window_name: $name" >> "$LAYOUT_FILE"
    echo "    layout: $(tmux list-windows -t "$SESSION_NAME:$index" -F '#{window_layout}')" >> "$LAYOUT_FILE"
    echo "    panes:" >> "$LAYOUT_FILE"

    tmux list-panes -t "$SESSION_NAME:$index" -F '#{pane_current_path}:#{pane_current_command}' | while IFS=: read -r pane_path pane_cmd; do
        echo "      - path: $pane_path" >> "$LAYOUT_FILE"
        echo "        cmd: $pane_cmd" >> "$LAYOUT_FILE"
    done
done

echo "Layout saved to: $LAYOUT_FILE"

