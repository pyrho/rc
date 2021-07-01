local M = {}
function M.config()

  -- Configure lua language server for neovim development
  local lua_settings = {
    Lua = {
      runtime = {
        -- LuaJIT in the case of Neovim
        version = 'LuaJIT',
        path = vim.split(package.path, ';')
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim', 'describe', 'it', 'dump'}
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
        }
      }
    }
  }

  local nvim_lsp = require('lspconfig')

  -- Use an on_attach function to only map the following keys 
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
      vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = {noremap = true, silent = true}

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.nnoremap {'gD', vim.lsp.buf.declaration, silent = true}
    vim.keymap.nnoremap {'gd', vim.lsp.buf.definition, silent = true}

    vim.keymap.nnoremap {
      '<leader>gs',
      function()
        vim.cmd ":sp"
        vim.cmd ":wincmd j"
        vim.cmd ":wincmd _"
        vim.lsp.buf.definition()
      end,
      buffer = true
    }

    -- vim.keymap.nnoremap {'K', vim.lsp.buf.hover, { silent = true }}
    -- vim.keymap.nnoremap {'gi', vim.lsp.buf.implementation, { silent = true }}

    -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>',
                   -- opts)
    -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    -- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    -- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    -- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    --

    require('vim.lsp.protocol').CompletionItemKind = {
      '', -- Text          = 1;
      'ƒ', -- Method        = 2;
      'ƒ', -- Function      = 3;
      '', -- Constructor   = 4;
      '識', -- Field         = 5;
      '𝑋', -- Variable      = 6;
      '', -- Class         = 7;
      '', -- Interface     = 8;
      '', -- Module        = 9;
      'Property', -- Property      = 10;
      'Unit', -- Unit          = 11;
      'Value', -- Value         = 12;
      '了', -- Enum          = 13;
      '', -- Keyword       = 14;
      '﬌', -- Snippet       = 15;
      'Color', -- Color         = 16;
      '', -- File          = 17;
      'Reference', -- Reference     = 18;
      '', -- Folder        = 19;
      '', -- EnumMember    = 20;
      '', -- Constant      = 21;
      '', -- Struct        = 22;
      'Event', -- Event         = 23;
      'Operator', -- Operator      = 24;
      'TypeParameter' -- TypeParameter = 25;
    }
  end

  -- config that activates keymaps and enables snippet support
  local function make_config()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    return {
      -- enable snippet support
      capabilities = capabilities,
      -- map buffer local keybindings when the language server attaches
      on_attach = on_attach
    }
  end

  local function setup_servers()
    require'lspinstall'.setup()
    local servers = require'lspinstall'.installed_servers()
    for _, server in pairs(servers) do
      local config = make_config()
      if server == "lua" then config.settings = lua_settings end

      require'lspconfig'[server].setup(config)
    end
  end

  setup_servers()

end
return M
