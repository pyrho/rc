#!/bin/zsh
#
fzd() {
    local dir
    dir=$(dirs -v | fzf --height=40% --reverse --prompt="Select directory: " | awk '{print $2}')
    [[ -n "$dir" ]] && eval "cd $dir"
}
