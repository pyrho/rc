local M = {}

function M.text_object_config()
  require"nvim-treesitter.configs".setup {
    textobjects = {
      move = {
        enable = true,
        goto_next_start = {["]]"] = "@function.outer"},
        goto_previous_start = {["[["] = "@function.outer"}
      },
      select = {
        enable = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          -- Or you can define your own textobjects like this
          ["iF"] = {
            python = "(function_definition) @function",
            cpp = "(function_definition) @function",
            c = "(function_definition) @function",
            java = "(method_declaration) @function"
          }
        }
      }
    }
  }
end

function M.refactor_config()
  require"nvim-treesitter.configs".setup {
    refactor = {highlight_current_scope = {enable = true}}
  }
end

function M.config()
  require"nvim-treesitter.configs".setup {
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = {"c", "rust"} -- list of language that will be disabled
    },
    ensure_installed = "maintained" -- one of "all", "language", or a list of languages
  }
end

return M
