" No need for rquire('lspconfig'), navigator will configure it for you
lua <<EOF
-- local single = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}
require "navigator".setup({
code_action_prompt = {enable = false},
    lsp = {
        format_on_save = false,
    }
})
EOF
