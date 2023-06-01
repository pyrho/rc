autoload -Uz add-zsh-hook
# This is deprecated, see https://github.com/larkery/zsh-histdb
# rhea should update to the latest version that that this can be commited to master
#add-zsh-hook precmd histdb-update-outcome
#
#bindkey '^R' histdb-fzf-widget
_zsh_autosuggest_strategy_histdb_top() {
    local query="
        select commands.argv from history
        left join commands on history.command_id = commands.rowid
        left join places on history.place_id = places.rowid
        where commands.argv LIKE '$(sql_escape $1)%'
        group by commands.argv, places.dir
        order by places.dir != '$(sql_escape $PWD)', count(*) desc
        limit 1
    "
    suggestion=$(_histdb_query "$query")
}

ZSH_AUTOSUGGEST_STRATEGY=histdb_top
