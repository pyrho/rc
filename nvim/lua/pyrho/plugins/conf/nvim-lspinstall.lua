local M = {}
function M.config()

  local lsp_installer = require "nvim-lsp-installer"

  local function on_attach(client, bufnr)
    local map = vim.api.nvim_buf_set_keymap

    local function configureForLspSaga()
      -- Set up buffer-local keymaps (vim.api.nvim_buf_set_keymap()), etc.
      map(0, "n", "gx", "<cmd>Lspsaga code_action<cr>",
          {silent = true, noremap = true})
      map(0, "n", "K", "<cmd>Lspsaga hover_doc<cr>",
          {silent = true, noremap = true})

      map(0, "n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>",
          {silent = true, noremap = true})
      map(0, "n", "gO", "<cmd>Lspsaga show_cursor_diagnostics<cr>",
          {silent = true, noremap = true})

      map(0, "n", "gd", "<cmd>Lspsaga goto_definition<cr>",
          {silent = true, noremap = true})

      map(0, "n", "gp", "<cmd>Lspsaga peek_definition<cr>",
          {silent = true, noremap = true})

      map(0, "n", "gr", "<cmd>Lspsaga lsp_finder<cr>",
          {silent = true, noremap = true})

      map(0, "n", "gy", "<cmd>Telescope lsp_type_definitions<cr>",
          {silent = true, noremap = true})

      map(0, "n", "g0", "<cmd>Lspsaga outline<cr>",
          {silent = true, noremap = true})

      map(0, "n", "gS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
          {silent = true, noremap = true})

      map(0, "n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>",
          {silent = true, noremap = true})

      map(0, "n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>",
          {silent = true, noremap = true})

      map(0, "n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>",
          {silent = true, noremap = true})
      map(0, "n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>",
          {silent = true, noremap = true})
    end

    local function configureForTrouble()
      vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
                     {silent = true, noremap = true})
      vim.keymap.set("n", "<leader>xw",
                     "<cmd>TroubleToggle workspace_diagnostics<cr>",
                     {silent = true, noremap = true})
      vim.keymap.set("n", "<leader>xd",
                     "<cmd>TroubleToggle document_diagnostics<cr>",
                     {silent = true, noremap = true})
      vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
                     {silent = true, noremap = true})
      vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
                     {silent = true, noremap = true})
      vim.keymap.set("n", "gr", "<cmd>TroubleToggle lsp_references<cr>",
                     {silent = true, noremap = true})
      vim.keymap.set("n", "gd", "<cmd>TroubleToggle lsp_definitions<cr>",
                     {silent = true, noremap = true})
      vim.keymap.set("n", "gy", "<cmd>TroubleToggle lsp_type_definitions<cr>",
                     {silent = true, noremap = true})
      vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>",
                     {silent = true, noremap = true})

    end

    require('nvim-navic').attach(client, bufnr)
    --configureForTrouble()
    configureForLspSaga()
  end

  local enhance_server_opts = {
    ["ltex"] = function(opts)
      opts.filetypes = {"markdown"}
      opts.cmd = {"/opt/homebrew/bin/ltex-ls"}
      opts.settings = {
        ltex = {
          diagnosticSeverity = 'information',
          language = 'en-US',
          additionalRules = {motherTongue = 'fr', languageModel = '~/.ngrams'}
        }
      }
    end
  }

  lsp_installer.on_server_ready(function(server)
    -- Specify the default options which we'll use to setup all servers
    local opts = {on_attach = on_attach}

    if enhance_server_opts[server.name] then
      -- Enhance the default opts with the server-specific ones
      enhance_server_opts[server.name](opts)
    end

    server:setup(opts)
  end)

end
return M
