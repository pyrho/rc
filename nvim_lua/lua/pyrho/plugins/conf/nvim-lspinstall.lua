local M = {}
function M.config()

  local lsp_installer = require "nvim-lsp-installer"

  local function on_attach(client, bufnr)
    -- Set up buffer-local keymaps (vim.api.nvim_buf_set_keymap()), etc.
    local map = vim.api.nvim_buf_set_keymap
    map(0, "n", "gr", "<cmd>Lspsaga rename<cr>", {silent = true, noremap = true})
    map(0, "n", "gx", "<cmd>Lspsaga code_action<cr>",
        {silent = true, noremap = true})
    map(0, "n", "K", "<cmd>Lspsaga hover_doc<cr>",
        {silent = true, noremap = true})
    map(0, "n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>",
        {silent = true, noremap = true})

    map(0, "n", "gd", "<cmd>Telescope lsp_definitions<cr>",
        {silent = true, noremap = true})

    map(0, "n", "gr", "<cmd>Telescope lsp_references<cr>",
        {silent = true, noremap = true})

    map(0, "n", "gy", "<cmd>Telescope lsp_type_definitions<cr>",
        {silent = true, noremap = true})

    map(0, "n", "g0", "<cmd>Telescope lsp_document_symbols<cr>",
        {silent = true, noremap = true})

    map(0, "n", "gS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        {silent = true, noremap = true})

    map(0, "n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>",
        {silent = true, noremap = true})

    map(0, "n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>",
        {silent = true, noremap = true})

    map(0, "n", "<C-u>",
        "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", {})

    map(0, "n", "<C-d>",
        "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", {})
  end

  local enhance_server_opts = {
    ["ltex"] = function(opts)
      opts.filetypes = { "markdown" }
      opts.settings = {
        ltex = {
          diagnosticSeverity = 'information',
          language = 'en-US',
          additionalRules = {
            motherTongue = 'fr',
            languageModel = '~/.ngrams'
          }
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
