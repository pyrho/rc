local M = {}

function M.config()
  require"lspsaga".setup({

    ui = {
      -- This option only works in Neovim 0.9
      title = true,
      -- Border type can be single, double, rounded, solid, shadow.
      border = "rounded",
      winblend = 0,
      expand = "",
      collapse = "",
      code_action = "󰌵",
      incoming = " ",
      outgoing = " ",
      hover = ' ',
      kind = {}
    },
    symbol_in_winbar = {enable = false},
    lightbulb = {enable = false}
  })
end

return M
