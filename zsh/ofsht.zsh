ofsht() {
    if [[ "$1" == "cd" ]] || [[ "$1" == "add" ]] || [[ "$1" == "rm" ]]; then
        local result
        result=$(command ofsht "$@") || return $?

        # Expand tilde if present at the start
        if [[ -n "$result" ]]; then
            result="${result/#\~/$HOME}"
            cd -- "$result"
        fi
    else
        command ofsht "$@"
    fi
}
