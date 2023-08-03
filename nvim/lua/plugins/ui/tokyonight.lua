return {
  "folke/tokyonight.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    require'tokyonight'.setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      light_style = "day", -- The theme is used when the background is set to light
      transparent = false, -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = {italic = true},
        keywords = {italic = true},
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark" -- style for floating windows
      },
      sidebars = {"qf", "help", "packer", "defx", "lspsagafinder", "fern", "aerial"}, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
      day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
      hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
      dim_inactive = false, -- dims inactive windows
      lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

      --- You can override specific color groups to use other groups or a hex color
      --- function will be called with a ColorScheme table
      ---@param colors ColorScheme
      on_colors = function(colors) end,

      --- You can override specific highlights to use other groups or a hex color
      --- function will be called with a Highlights and ColorScheme table
      ---@param highlights Highlights
      ---@param colors ColorScheme
      on_highlights = function(highlights, colors)
        highlights.TabLineSel = {
          bold = true,
          fg = "#7dcfff",
          bg = colors.bg,
        }

        highlights.CursorLineNr = highlights.WarningMsg
        highlights.WinBarNC = {
            bold = false,
            fg = require("tokyonight.util").darken("#cccccc", 0.9),
            bg = require("tokyonight.util").darken("#dddddd", 0.9),
        }
      end
    }
      if require"pyrho.helpers".is_zen() then
        vim.o.background = "light"
      else
        vim.o.background = "dark"
      end
    vim.cmd [[ colorscheme tokyonight ]]
  end
  --   config = function()
  --     if require"pyrho.helpers".is_zen() then
  --       vim.o.background = "light"
  --     else
  --       vim.o.background = "dark"
  --     end
  --
  --     vim.g.tokyonight_style = "storm"
  --     vim.g.tokyonight_italic_functions = 0
  --     vim.g.tokyonight_italic_keywords = 0
  --     vim.g.tokyonight_italic_variables = 0
  --     vim.g.tokyonight_sidebars = {
  --       "qf", "vista_kind",
  --       -- Can't have this and the nice neovim logo in Dashboard
  --       --[["terminal"]]
  --       "packer", "defx", "lspsagafinder", "fern"
  --     }
  --     vim.g.tokyonight_hide_inactive_statusline = true
  --
  --     -- vim.cmd [[ autocommand ColorScheme tokyonight call MyHighlight() ]]
  --
  --     --[[
  --   --
  --   function! MyHighlights() abort
  --     highlight Visual     cterm=NONE ctermbg=76  ctermfg=16  gui=NONE guibg=#5fd700 guifg=#000000
  --     highlight StatusLine cterm=NONE ctermbg=231 ctermfg=160 gui=NONE guibg=#ffffff guifg=#d70000
  --     highlight Normal     cterm=NONE ctermbg=17              gui=NONE guibg=#00005f
  --     highlight NonText    cterm=NONE ctermbg=17              gui=NONE guibg=#00005f
  -- endfunction
  -- --]]
  --     -- local tokyoNightsOverrides = -- Vimscript function name (as a string)
  --     -- local myvimfun = "g:MyVimFunction"
  --     vim.api.nvim_create_autocmd({"ColorScheme"}, {
  --       pattern = {"tokyonight"},
  --       callback = function()
  --         vim.api
  --             .nvim_command [[ highlight TabLineSel gui=bold guifg=#7dcfff guibg=#1f2335 ]]
  --       end -- Or myvimfun
  --     })
  --
  --     vim.cmd [[ colorscheme tokyonight ]]
  --   end
}
