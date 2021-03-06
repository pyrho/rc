export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export JIRA_PREFIX=""
export JIRA_RAPID_BOARD=true
export NPM_PACKAGES="${HOME}/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export PATH="/usr/local/sbin:/Users/pyrho/.local/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:$NPM_PACKAGES/bin:${HOME}/bin:$PATH:${HOME}/go/bin:${HOME}/neovim/bin:${HOME}/.vim/plugged/vim-iced/bin"

# For Gnu Tar
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
# Haskell
source /Users/pyrho/.ghcup/env

export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
export GPG_TTY="tty"
export EDITOR=nvim
export VAULT_TOKEN=$(cat ~/.vault-token)
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=UTF-8
export ZSH_AUTOSUGGEST_USE_ASYNC=1

# Not sure why this is here :)
export PATH="/usr/local/opt/libpq/bin:/Users/pyrho/.cargo/bin:/usr/local/opt/avr-gcc@7/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/avr-gcc@7/lib"
export HISTDB_FILE="/Users/pyrho/SynologyDrive/zsh_histdb/zsh-history.db"

#export MANPAGER="nvim -u ~/rc/nvim/init_minimal.vim -c 'set ft=man' -"
export sel=${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.selection

