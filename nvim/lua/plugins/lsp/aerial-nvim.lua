return {
  'stevearc/aerial.nvim',
  ft = require'pyrho.helpers'.getFiletypesForLSP(),
  cmd = { "AerialNavToggle", "AerialToggle" },
  config = function()
    require('aerial').setup({
      show_guides = true,
      nav = {
        border = "rounded",
        max_height = 0.9,
        min_height = {10, 0.1},
        max_width = 0.5,
        min_width = {0.2, 20},
        win_opts = {cursorline = true, winblend = 10},
        -- Jump to symbol in source window when the cursor moves
        autojump = false,
        -- Show a preview of the code in the right column, when there are no child symbols
        preview = true,
        -- Keymaps in the nav window
        keymaps = {
          ["o"] = "actions.jump",
          ["<2-LeftMouse>"] = "actions.jump",
          ["<C-v>"] = "actions.jump_vsplit",
          ["<C-s>"] = "actions.jump_split",
          ["h"] = "actions.left",
          ["l"] = "actions.right",
          ["q"] = "actions.close"
        }
      },
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set('n', '[n', '<cmd>AerialPrev<CR>', {buffer = bufnr})
        vim.keymap.set('n', ']n', '<cmd>AerialNext<CR>', {buffer = bufnr})
        vim.keymap.set('n', '<leader>n', '<cmd>AerialNavToggle<CR>',
                       {buffer = bufnr})
      end
    })
  end,
  keys = {"[n", "]n", "<LEADER>n"}
}
