export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export JIRA_PREFIX=""
export JIRA_RAPID_BOARD=true
export NPM_PACKAGES="${HOME}/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export PATH="/usr/local/bin:$NPM_PACKAGES/bin:${HOME}/bin:$PATH:${HOME}/go/bin:${HOME}/neovim/bin:${HOME}/.vim/plugged/vim-iced/bin"
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
export GPG_TTY="tty"
export EDITOR=nvim
export VAULT_TOKEN=$(cat ~/.vault-token)
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=UTF-8
export ZSH_AUTOSUGGEST_USE_ASYNC=1

# Not sure why this is here :)
export PATH="/usr/local/opt/avr-gcc@7/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/avr-gcc@7/lib"
