return {
  'mickael-menu/zk-nvim',
  cond = function() return require"pyrho.helpers".is_zen() end,
  config = function()
    require("zk").setup({
      -- can be "telescope", "fzf" or "select" (`vim.ui.select`)
      -- it's recommended to use "telescope" or "fzf"
      picker = "select",

      lsp = {
        -- `config` is passed to `vim.lsp.start_client(config)`
        config = {
          cmd = {"zk", "lsp"},
          name = "zk",
          on_attach = function(client, bufnr)
            vim.diagnostic.config({signs = false, underline = false})
          end
          -- on_attach = ...
          -- etc, see `:h vim.lsp.start_client()`
        },

        -- automatically attach buffers in a zk notebook that match the given filetypes
        auto_attach = {enabled = false, filetypes = {"markdown"}}
      }
    })

    local opts = {noremap = true, silent = false}

    -- Create a new note after asking for its title.
    vim.keymap.set("n", "gzn", function()
      require('zk').new({title = vim.fn.input('Title: ')})
    end, opts)
    -- "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>",

    -- Open notes.
    vim.api.nvim_set_keymap("n", "gzz",
                            "<Cmd>ZkNotes { sort = { 'modified' }, exclude = { 'diary' } }<CR>",
                            opts)
    -- Open notes associated with the selected tags.
    vim.api.nvim_set_keymap("n", "gzt", "<Cmd>ZkTags<CR>", opts)

    -- Search for the notes matching the current visual selection.
    vim.api.nvim_set_keymap("v", "<leader>zf", ":'<,'>ZkMatch<CR>", opts)
  end
}
