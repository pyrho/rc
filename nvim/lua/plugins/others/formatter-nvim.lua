return {
  "mhartington/formatter.nvim",
  cmd = {"Format", "FormatWrite"},
  keys = {{"<LEADER>F", "<CMD>FormatWrite<CR>"}},
  enabled = false,
  config = function()
    require("formatter").setup({
      logging = false,
      filetype = {
        vue = {require"formatter.defaults".prettierd},
        javascript = {require"formatter.defaults".prettierd},
        typescript = {require"formatter.defaults".prettierd},
        typescriptreact = {require"formatter.defaults".prettierd},
        elm = {
          function()
            return {exe = "elm-format", args = {"--stdin"}, stdin = true}
          end
        },
        lua = {
          -- luafmt
          function()
            return {
              exe = "lua-format",
              args = {"--indent-width=2"},
              stdin = true
            }
          end
        },
        html = {require"formatter.filetypes.html".prettierd},
        mysql = {
          function()
            return {exe = "sql-formatter", args = {"-lmysql"}, stdin = true}
          end
        }
      }
    })
  end
}
