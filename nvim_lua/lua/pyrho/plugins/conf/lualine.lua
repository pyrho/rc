local M = {}
function M.config()
  local function WebDevIconsGetFileTypeSymbol()
    return require"nvim-web-devicons".get_icon(vim.fn.expand("%:t"),
                                               vim.fn.expand("%:e"),
                                               {default = true})
  end

  local function ObsessionStatusEnhance()
    local obsStatus = vim.fn.ObsessionStatus("奈", " ")
    if #obsStatus > 0 then
      return obsStatus
    else
      return " "
    end
  end

  local function MyCWD()
    return " " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
  end

  require("lualine").setup {
    options = {
      -- section_separators = {'', ''},
      -- component_separators = {'', ''},
      theme = "tokyonight",
      extensions = {"fzf", "fugitive"},
      disabled_filetypes = {"dashboard"}
    },
    sections = {
      lualine_a = {"mode"},
      lualine_b = {
        "branch", {
          'diff',
          colored = true, -- displays diff status in color if set to true
          -- all colors are in format #rrggbb
          color_added = require"tokyonight.colors".setup().git.add,
          color_modified = require"tokyonight.colors".setup().git.change,
          color_removed = require"tokyonight.colors".setup().git.delete,
          symbols = {added = '+', modified = '~', removed = '-'} -- changes diff symbols
        }
      },
      lualine_c = {{"filename", file_status = true, path = 1}},
      lualine_x = {
        ObsessionStatusEnhance, {
          'diagnostics',
          sources = {"nvim_lsp"},
          sections = {'error', 'warn', 'info', 'hint'},
          symbols = {
            error = ' ',
            warn = ' ',
            info = ' ',
            hint = ' '
          }
        }
      },
      lualine_y = {WebDevIconsGetFileTypeSymbol, "progress", "location"},
      lualine_z = {MyCWD}
    }
  }
end
return M
