return {
  'glepnir/lspsaga.nvim',
  ft = require'pyrho.helpers'.getFiletypesForLSP(),
  config = function()
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

    -- 2023-05-26 Seems to conflict with nvim-cmp..
    -- require('pyrho.plugins.conf.lspsaga_signature_help')
  end,
  branch = "main"
}
