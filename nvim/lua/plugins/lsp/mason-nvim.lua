return {
  {
    "williamboman/mason-lspconfig.nvim",
    ft = require'pyrho.helpers'.getFiletypesForLSP(),
    config = function()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls", "vtsls", "elixirls", "elmls", "prismals", "zk", "ltex",
          "yamlls"
        }
      })
      require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {
            on_attach = function(client, bufnr)
              _G.dump('IN HTEREE for' .. server_name)
              require('nvim-navic').attach(client, bufnr)
              require'pyrho.mappings'.configureMappings()
            end
          }
        end,
        -- Next, you can provide a dedicated handler for specific servers.
        -- For example, a handler override for the `rust_analyzer`:
        ["ltex"] = function()
          require('lspconfig').ltex.setup {
            on_attach = function(client, bufnr)
              require('nvim-navic').attach(client, bufnr)
              require'pyrho.mappings'.configureMappings()
            end,
            filetypes = {"markdown"},
            cmd = {"/opt/homebrew/bin/ltex-ls"},
            settings = {
              ltex = {
                dictionary = {['en_US'] = {"HPAQ"}},
                diagnosticSeverity = 'information',
                language = 'en-US',
                additionalRules = {
                  motherTongue = 'fr',
                  languageModel = '~/.ngrams'
                }
              }
            }
          }
        end,

        ["yamlls"] = function()
          require('lspconfig').yamlls.setup {
            on_attach = function(client, bufnr)
              require('nvim-navic').attach(client, bufnr)
              require'pyrho.mappings'.configureMappings()
            end,
            settings = {
              yaml = {
                schemas = {
                  ["https://json.schemastore.org/taskfile.json"] = "Taskfile*.yml",
                  ["https://json.schemastore.org/circleciconfig.json"] = ".circleci/config.yml"
                }
              }
            }
          }
        end
      }

    end
  }, {
    "williamboman/mason.nvim",
    -- ft = require'pyrho.helpers'.getFiletypesForLSP(),
    -- lazy = false,
    config = function() require("mason").setup() end,
    build = ":MasonUpdate"
  }, {
    "nvim-lspconfig",
    config = function()
      vim.fn.sign_define("DiagnosticSignError", {
        texthl = "DiagnosticSignError",
        text = "",
        numhl = "DiagnosticSignError"
      })
      vim.fn.sign_define("DiagnosticSignWarn", {
        texthl = "DiagnosticSignWarn",
        text = "",
        numhl = "DiagnosticSignWarn"
      })
      vim.fn.sign_define("DiagnosticSignHint", {
        texthl = "DiagnosticSignHint",
        text = "",
        numhl = "DiagnosticSignHint"
      })
      vim.fn.sign_define("DiagnosticSignInfo", {
        texthl = "DiagnosticSignInfo",
        text = "",
        numhl = "DiagnosticSignInfo"
      })

    end

  }, {"nvim-navic"}
}
