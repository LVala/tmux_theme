#!/usr/bin/env bash

set() {
    local option=$1
    local value=$2
    tmux_commands+=(set-option -g "$option" "$value" ";")
}

fg="#e6eaea";
bg="#0f1c1e";
muted="#587b7b";
red="#ad5c7c";
green="#7aa4a1";

local tmux_commands=()

set "status" "on"
set "status-style" "fg=$fg,bg=$bg"
set "status-left-length" "100"
set "status-right-length" "100"

set "window-status-style" "fg=$muted,bg=$bg"
set "window-status-format" " #I:#W#F"

set "window-status-current-style" "fg=$fg,bg=$bg"
set "window-status-current-format" " #I:#W#F"

set "status-left-style" "fg=$bg,bg=$green,bold"
set "status-left" " #S "

set "status-right-style" "fg=$bg,bg=$red,bold"
set "status-right" "#{?client_prefix, PREFIX ,}"

tmux "${tmux_commands[@]}"
