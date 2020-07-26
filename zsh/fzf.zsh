# FZF {{{
export FZF_ALT_C_COMMAND="cd $HOME; bfs -type d -nohidden 2>/dev/null | sed s@^\.@$HOME@"

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
# bindkey '^P' "nvim $(fzf)";

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

_gen_fzf_default_opts() {
    # local color00='#282c34'
    # local color01='#353b45'
    # local color02='#3e4451'
    # local color03='#545862'
    # local color04='#565c64'
    # local color05='#abb2bf'
    # local color06='#b6bdca'
    # local color07='#c8ccd4'
    # local color08='#e06c75'
    # local color09='#d19a66'
    # local color0A='#e5c07b'
    # local color0B='#98c379'
    # local color0C='#56b6c2'
    # local color0D='#61afef'
    # local color0E='#c678dd'
    # local color0F='#be5046'

    export FZF_DEFAULT_OPTS="--height 40% --border"

}

_gen_fzf_default_opts
# }}}
