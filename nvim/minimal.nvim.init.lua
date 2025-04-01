local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({{
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local dashboard = require("alpha.themes.dashboard")

		-- helper function for utf8 chars
		local function getCharLen(s, pos)
			local byte = string.byte(s, pos)
			if not byte then
				return nil
			end
			return (byte < 0x80 and 1) or (byte < 0xE0 and 2) or (byte < 0xF0 and 3) or (byte < 0xF8 and 4) or 1
		end

		local function applyColors(logo, colors, logoColors)
			dashboard.section.header.val = logo

			for key, color in pairs(colors) do
				local name = "Alpha" .. key
				vim.api.nvim_set_hl(0, name, color)
				colors[key] = name
			end

			dashboard.section.header.opts.hl = {}
			for i, line in ipairs(logoColors) do
				local highlights = {}
				local pos = 0

				for j = 1, #line do
					local opos = pos
					pos = pos + getCharLen(logo[i], opos + 1)

					local color_name = colors[line:sub(j, j)]
					if color_name then
						table.insert(highlights, { color_name, opos, pos })
					end
				end

				table.insert(dashboard.section.header.opts.hl, highlights)
			end
			return dashboard.opts
		end

		require("alpha").setup(applyColors({
			[[  ███       ███  ]],
			[[  ████      ████ ]],
			[[  ████     █████ ]],
			[[ █ ████    █████ ]],
			[[ ██ ████   █████ ]],
			[[ ███ ████  █████ ]],
			[[ ████ ████ ████ ]],
			[[ █████  ████████ ]],
			[[ █████   ███████ ]],
			[[ █████    ██████ ]],
			[[ █████     █████ ]],
			[[ ████      ████ ]],
			[[  ███       ███  ]],
			[[                    ]],
			[[  N  E  O  V  I  M  ]],
		}, {
			["b"] = { fg = "#3399ff", ctermfg = 33 },
			["a"] = { fg = "#53C670", ctermfg = 35 },
			["g"] = { fg = "#39ac56", ctermfg = 29 },
			["h"] = { fg = "#33994d", ctermfg = 23 },
			["i"] = { fg = "#33994d", bg = "#39ac56", ctermfg = 23, ctermbg = 29 },
			["j"] = { fg = "#53C670", bg = "#33994d", ctermfg = 35, ctermbg = 23 },
			["k"] = { fg = "#30A572", ctermfg = 36 },
		}, {
			[[  kkkka       gggg  ]],
			[[  kkkkaa      ggggg ]],
			[[ b kkkaaa     ggggg ]],
			[[ bb kkaaaa    ggggg ]],
			[[ bbb kaaaaa   ggggg ]],
			[[ bbbb aaaaaa  ggggg ]],
			[[ bbbbb aaaaaa igggg ]],
			[[ bbbbb  aaaaaahiggg ]],
			[[ bbbbb   aaaaajhigg ]],
			[[ bbbbb    aaaaajhig ]],
			[[ bbbbb     aaaaajhi ]],
			[[ bbbbb      aaaaajh ]],
			[[  bbbb       aaaaa  ]],
			[[                    ]],
			[[  a  a  a  b  b  b  ]],
		}))
	end,
}, {
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
			terminal_colors = false, -- Configure the colors used when opening a `:terminal` in Neovim
			styles = {
				-- Style to be applied to different syntax groups
				-- Value is any valid attr-list value for `:help nvim_set_hl`
				comments = { italic = true },
				keywords = { italic = true },
				functions = {},
				variables = {},
				-- Background styles. Can be "dark", "transparent" or "normal"
				sidebars = "dark", -- style for sidebars, see below
				floats = "dark", -- style for floating windows
			},
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

				if vim.o.background == "light" then
					highlights.TSCurrentScope = {
						bg = "#d4d7e4",
					}
				end
			end,
		})
		-- vim.cmd([[ colorscheme tokyonight ]])
	end,
}})
