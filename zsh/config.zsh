#!/bin/zsh
export LSCOLORS='exfxcxdxbxegedabagacad'
export CLICOLOR=true
export WORDCHARS=""

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

HISTFILE=~/.zsh_history
HISTSIZE=40000
SAVEHIST=40000

# https://blog.confirm.ch/zsh-tips-changing-directories/
setopt auto_cd
# don't nice background tasks
setopt NO_BG_NICE
setopt NO_HUP
setopt NO_BEEP
# allow functions to have local options
setopt LOCAL_OPTIONS
# allow functions to have local traps
setopt LOCAL_TRAPS
# share history between sessions ???
setopt SHARE_HISTORY
# add timestamps to history
setopt EXTENDED_HISTORY
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
# adds history
setopt APPEND_HISTORY
# adds history incrementally and share it across sessions
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
# don't record dupes in history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt HIST_EXPIRE_DUPS_FIRST
# dont ask for confirmation in rm globs*
setopt RM_STAR_SILENT
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# emacs mode
# I always enter vi mode by mistake
bindkey -v

# fuzzy find: start to type
# bindkey "$terminfo[kcuu1]" up-line-or-beginning-search
# bindkey "$terminfo[kcud1]" down-line-or-beginning-search
# bindkey "$terminfo[cuu1]" up-line-or-beginning-search
# bindkey "$terminfo[cud1]" down-line-or-beginning-search

# backward and forward word with option+left/right
bindkey '^[^[[D' backward-word
bindkey '^[b' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[f' forward-word

# to to the beggining/end of line with fn+left/right or home/end
bindkey "${terminfo[khome]}" beginning-of-line
bindkey '^[[H' beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey '^[[F' end-of-line

# delete char with backspaces and delete
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char

# delete word with ctrl+backspace
bindkey '^[[3;5~' backward-delete-word
# bindkey '^[[3~' backward-delete-word

bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# ability to comment on cmd line
setopt interactivecomments
HISTORY_IGNORE="(pwd|cd|cd ..|ls|l|nvim|kill*|rm *|z *|gss|gd)"
