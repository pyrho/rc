return {
	"folke/tokyonight.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		require("tokyonight").setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
			style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
			light_style = "day", -- The theme is used when the background is set to light
			transparent = false, -- Enable this to disable setting the background color
			terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
			styles = {
				-- Style to be applied to different syntax groups
				-- Value is any valid attr-list value for `:help nvim_set_hl`
				comments = { italic = true },
				keywords = { italic = true },
				functions = {},
				variables = {},
				-- Background styles. Can be "dark", "transparent" or "normal"
				sidebars = "dark", -- style for sidebars, see below
				floats = "transparent", -- style for floating windows
			},
			day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
			hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
			dim_inactive = false, -- dims inactive windows
			lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

			--- You can override specific color groups to use other groups or a hex color
			--- function will be called with a ColorScheme table
			---@param colors ColorScheme
			on_colors = function(colors_)
				-- This is ugly hack to get alpha-nvim 's logo to get colors.
				-- It looks like tokyonight wipes all pre-existing highlight groups
				vim.cmd([[ hi Alphab guifg=#3399ff ctermfg=33 ]])
				vim.cmd([[ hi Alphaa guifg=#53C670 ctermfg=35 ]])
				vim.cmd([[ hi Alphag guifg=#39ac56 ctermfg=29 ]])
				vim.cmd([[ hi Alphah guifg=#33994d ctermfg=23 ]])
				vim.cmd([[ hi Alphai guifg=#33994d guibg=#39ac56 ctermfg=23 ctermbg=29 ]])
				vim.cmd([[ hi Alphaj guifg=#53C670 guibg=#33994d ctermfg=35 ctermbg=23 ]])
				vim.cmd([[ hi Alphak guifg=#30A572 ctermfg=36 ]])
			end,

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

				highlights.TabLineFill = {
					bg = colors.bg,
				}

				highlights.TabLine = {
					bg = colors.bg,
				}
				--
				--
				-- highlights.CursorLineNr = highlights.WarningMsg
				--
				-- if vim.o.background == "light" then
				-- 	highlights.TSCurrentScope = {
				-- 		bg = "#d4d7e4",
				-- 	}
				-- end
			end,
		})
		vim.cmd([[ colorscheme tokyonight ]])
	end,
}
