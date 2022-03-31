local M = {}

function M.config()
  local function get_current_function_name()
    local symbol = require"nvim-treesitter".statusline({indicator_size = 100})
    if symbol ~= "" and symbol ~= nil then
      return " " .. symbol
    else
      return ""
    end

    --[[ local indicator_size = options.indicator_size or 100
  local type_patterns = options.type_patterns or { "class", "function", "method" }
  local transform_fn = options.transform_fn or transform_line
  local separator = options.separator or " -> " ]]

  end

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
  local function num() return vim.fn.tabpagenr() .. '' end

  require("lualine").setup {
    options = {
      section_separators = {left = '', right = ''},
      component_separators = {left = '', right = ''},
      --[[ section_separators   = { left = '', right = '' },
        component_separators = { left = '', right = '' }, ]]
      theme = "tokyonight",
      extensions = {"fugitive"},
      disabled_filetypes = {"dashboard"}
    },
    tabline = {
      lualine_a = {function() return ' ' end},
      lualine_b = {
        {
          'tabs',
          max_length = vim.o.columns,
          mode = 2,
        }
      },
      lualine_c = {},
      --[[ lualine_c = {
        {
          function() return '%=' .. get_current_function_name() end,
          color = {gui = "italic", fg = "#2ac3de"}
        }
      }, ]]
      lualine_x = {},
      lualine_y = {},
      lualine_z = {MyCWD}
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
      lualine_x = {},
      lualine_y = {
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
      lualine_z = {WebDevIconsGetFileTypeSymbol, "progress", "location"}
    }
  }
end
return M
