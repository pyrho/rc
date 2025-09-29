local wezterm = require 'wezterm'
local config = {}
local appearance = require("appearance")
local projects = require("projects")
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")

wezterm.on("window-config-reloaded", function(window, pane)
	window:toast_notification("wezterm", "configuration reloaded!", nil, 4000)
end)

if appearance.is_dark() then
	config.color_scheme = "Tokyo Night Moon"
	config.colors = {
		split = "#828bb8",
		tab_bar = {
			inactive_tab_edge = "#1e2030",
			active_tab = {
				bg_color = "#1e2030",
				fg_color = "#828bb8",
			},
			inactive_tab = {
				bg_color = "#2f334d",
				fg_color = "#828bb8",
			},
		},
	}
	config.window_frame = {
		-- The overall background color of the tab bar when
		-- the window is focused
		active_titlebar_bg = "#222436",

		-- The overall background color of the tab bar when
		-- the window is not focused
		inactive_titlebar_bg = "#222436",
	}
else
	config.color_scheme = "Tokyo Night Day"
	config.colors = {
		split = "#6172b0",
		tab_bar = {
			inactive_tab_edge = "#e1e2e7", -- tab sep
			active_tab = {
				bg_color = "#e1e2e7",
				fg_color = "#6172b0",
			},
			inactive_tab = {
				bg_color = "#d0d5e3",
				fg_color = "#6172b0",
			},
		},
	}
	config.window_frame = {
		-- The overall background color of the tab bar when
		-- the window is focused
		active_titlebar_bg = "#e1e2e7",

		-- The overall background color of the tab bar when
		-- the window is not focused
		inactive_titlebar_bg = "#e1e2e7",
	}
end

config.font_size                     = 16
config.font                          = wezterm.font('JetBrains Mono', { weight = 'Bold', italic = true })
config.font = wezterm.font_with_fallback({ "IosevkaTerm NF", "Apple Color Emoji", "Flog Symbols" })
config.font_rules = {
	{ -- Italic
		intensity = "Normal",
		italic = true,
		font = wezterm.font({
			family = "IosevkaTerm Nerd Font Propo",
			style = "Italic",
			weight = "Light",
		}),
	},
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font({
			family = "IosevkaTerm Nerd Font",
			weight = "ExtraBold",
		}),
	},
}
config.font_size = 18
config.hide_tab_bar_if_only_one_tab  = true
config.hide_mouse_cursor_when_typing = true
config.default_cursor_style          = 'SteadyBlock'
config.window_decorations            = "RESIZE"
config.window_background_opacity     = 1
config.macos_window_background_blur  = 0
config.window_padding = {
	left = "3cell",
	right = "3cell",
	top = "2cell",
	bottom = "2cell",
}

config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false
-- If you're using emacs you probably wanna choose a different leader here,
-- since we're gonna be making it a bit harder to CTRL + A for jumping to
-- the start of a line
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

-- Table mapping keypresses to actions
config.keys = {
	{ key = "Enter", mods = "SHIFT", action = wezterm.action({ SendString = "\x1b\r" }) },
	{
		key = "0",
		mods = "CTRL",
		action = wezterm.action.PaneSelect({
			mode = "SwapWithActive",
		}),
	},
	{
		key = "W",
		mods = "LEADER",
		action = wezterm.action_callback(function(win, pane)
			resurrect.save_state(resurrect.workspace_state.get_workspace_state())
			resurrect.window_state.save_window_action()
			win:toast_notification("wezterm", "configuration reloaded!", nil, 4000)
		end),
	},
	{
		key = "w",
		mods = "LEADER",
		action = wezterm.action_callback(function(win, pane)
			resurrect.fuzzy_load(win, pane, function(id, label)
				local type = string.match(id, "^([^/]+)") -- match before '/'
				id = string.match(id, "([^/]+)$") -- match after '/'
				id = string.match(id, "(.+)%..+$") -- remove file extention
				local opts = {
					relative = true,
					restore_text = true,
					on_pane_restore = resurrect.tab_state.default_on_pane_restore,
				}
				if type == "workspace" then
					local state = resurrect.load_state(id, "workspace")
					resurrect.workspace_state.restore_workspace(state, opts)
				elseif type == "window" then
					local state = resurrect.load_state(id, "window")
					resurrect.window_state.restore_window(pane:window(), state, opts)
				elseif type == "tab" then
					local state = resurrect.load_state(id, "tab")
					resurrect.tab_state.restore_tab(pane:tab(), state, opts)
				end
			end)
		end),
	},
	-- {
	-- 	key = "p",
	-- 	mods = "SUPER",
	-- 	action = wezterm.action.QuickSelectArgs({
	-- 		alphabet = "arstneoi",
	-- 		label = "Copy path",
	-- 		patterns = {
	-- 			"\\S[a-zA-Z0-9/.-]+\\S",
	-- 		},
	-- 	}),"SUPER"path"
	-- },
	{
		key = "p",
		mods = "SUPER",
		action = wezterm.action.QuickSelectArgs({
			alphabet = "arstneoi",
			label = "Copy path",
			action = wezterm.action_callback(function(window, pane)
				pane:paste(window:get_selection_text_for_pane(pane))
			end),
			patterns = {
				"\\S[a-zA-Z0-9/.-]+\\S",
			},
		}),
	},
	{
		key = "e",
		mods = "SUPER",
		action = wezterm.action.QuickSelectArgs({
			alphabet = "arstneoi",
			label = "Open URL",
			patterns = {
				"https?://\\S+",
			},
			action = wezterm.action_callback(function(window, pane)
				wezterm.open_with(window:get_selection_text_for_pane(pane))
			end),
		}),
	},
	{
		key = "E",
		mods = "CTRL|SHIFT",
		description = "lol",
		action = wezterm.action.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},

	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.DisableDefaultAssignment,
	}, -- See also disable_default_key_bindings = true,

	{ key = "s", mods = "LEADER", action = wezterm.action.PaneSelect({
		alphabet = "arstneoi",
	}) },

	-- Sends ESC + b and ESC + f sequence, which is used
	-- for telling your shell to jump back/forward.
	-- {
	-- 	-- When the left arrow is pressed
	-- 	key = "LeftArrow",
	-- 	-- With the "Option" key modifier held down
	-- 	mods = "OPT",
	-- 	-- Perform this action, in this case - sending ESC + B
	-- 	-- to the terminal
	-- 	action = wezterm.action.SendString("\x1bb"),
	-- },
	-- {
	-- 	key = "RightArrow",
	-- 	mods = "OPT",
	-- 	action = wezterm.action.SendString("\x1bf"),
	-- },
	{
		key = "m",
		mods = "LEADER",
		action = wezterm.action.TogglePaneZoomState,
	},

	{
		key = ",",
		mods = "SUPER",
		action = wezterm.action.SpawnCommandInNewTab({
			cwd = wezterm.home_dir,
			args = { "nvim", wezterm.config_file },
		}),
	},

	{
		-- I'm used to tmux bindings, so am using the quotes (") key to
		-- split horizontally, and the percent (%) key to split vertically.
		key = "'",
		-- Note that instead of a key modifier mapped to a key on your keyboard
		-- like CTRL or ALT, we can use the LEADER modifier instead.
		-- This means that this binding will be invoked when you press the leader
		-- (CTRL + A), quickly followed by quotes (").
		--
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},

	{
		key = "a",
		-- When we're in leader mode _and_ CTRL + A is pressed...
		mods = "LEADER|CTRL",
		-- Actually send CTRL + A key to the terminal
		action = wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
	},

	-- Zellij-esque {{{
	-- {
	-- 	key = "h",
	-- 	-- When we're in leader mode _and_ CTRL + A is pressed...
	-- 	mods = "ALT",
	-- 	-- Actually send CTRL + A key to the terminal
	-- 	action = wezterm.action.ActivatePaneDirection("Left"),
	-- },
	-- {
	-- 	key = "j",
	-- 	-- When we're in leader mode _and_ CTRL + A is pressed...
	-- 	mods = "ALT",
	-- 	-- Actually send CTRL + A key to the terminal
	-- 	action = wezterm.action.ActivatePaneDirection("Down"),
	-- },
	-- {
	-- 	key = "k",
	-- 	-- When we're in leader mode _and_ CTRL + A is pressed...
	-- 	mods = "ALT",
	-- 	-- Actually send CTRL + A key to the terminal
	-- 	action = wezterm.action.ActivatePaneDirection("Up"),
	-- },
	--    {
	-- 	key = "l",
	-- 	-- When we're in leader mode _and_ CTRL + A is pressed...
	-- 	mods = "ALT",
	-- 	-- Actually send CTRL + A key to the terminal
	-- 	action = wezterm.action.ActivatePaneDirection("Right"),
	-- },
	--    {
	-- 	key = "f",
	-- 	-- When we're in leader mode _and_ CTRL + A is pressed...
	-- 	mods = "ALT",
	-- 	-- Actually send CTRL + A key to the terminal
	-- 	action = wezterm.action.TogglePaneZoomState,
	-- },
	-- }}}

	-- move_pane("j", "Down"),
	-- move_pane("k", "Up"),
	-- move_pane("h", "Left"),
	-- move_pane("l", "Right"),

	{
		-- When we push LEADER + R...
		key = "r",
		mods = "LEADER",
		-- Activate the `resize_panes` keytable
		action = wezterm.action.ActivateKeyTable({
			name = "resize_panes",
			-- Ensures the keytable stays active after it handles its
			-- first keypress.
			one_shot = false,
			-- Deactivate the keytable after a timeout.
			timeout_milliseconds = 1000,
		}),
	},

	{
		key = "p",
		mods = "LEADER",
		-- Present in to our project picker
		action = projects.choose_project(),
	},
	{
		key = "f",
		mods = "LEADER",
		-- Present a list of existing workspaces
		action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
	},
	{
		key = "p",
		mods = "ALT|SHIFT",
		action = wezterm.action_callback(function(win, pane)
			local new_tab, first_pane, new_win = win:mux_window():spawn_tab({
				cwd = "/Users/pyrho/code/caribou/main-repo",
				args = { "task", "api:serve", "-w" },
			})
			first_pane:split({
				direction = "Right",
				size = 0.25,
				cwd = "/Users/pyrho/code/caribou/main-repo",
				args = { "task", "apps:hadash:dev" },
			})
			first_pane:split({
				direction = "Right",
				size = 0.33,
				cwd = "/Users/pyrho/code/caribou/main-repo",
				args = { "task", "apps:fadash:dev" },
			})
		end),
	},
}

smart_splits.apply_to_config(config, {
	-- the default config is here, if you'd like to use the default keys,
	-- you can omit this configuration table parameter and just use
	-- smart_splits.apply_to_config(config)

	-- directional keys to use in order of: left, down, up, right
	direction_keys = { "h", "j", "k", "l" },
	-- if you want to use separate direction keys for move vs. resize, you
	-- can also do this:
	-- modifier keys to combine with direction_keys
	modifiers = {
		move = "CTRL", -- modifier to use for pane movement, e.g. CTRL+h to move left
		resize = "META", -- modifier to use for pane resize, e.g. META+h to resize to the left
	},
	-- log level to use: info, warn, error
	log_level = "info",
})
return config
