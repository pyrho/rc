export EDITOR='nvim'
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag -g ""'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export JIRA_PREFIX=""
export JIRA_RAPID_BOARD=true
export VAULT_ADDR=https://auth.dashlane.com:8200
export NPM_PACKAGES="${HOME}/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export PATH="$NPM_PACKAGES/bin:${HOME}/bin:$PATH"
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
