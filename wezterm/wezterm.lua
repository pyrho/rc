local wezterm = require("wezterm")
local config = wezterm.config_builder()
local appearance = require("appearance")
local projects = require("projects")

config.set_environment_variables = {
	PATH = "/opt/homebrew/bin:" .. os.getenv("PATH"),
}

config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false

-- 2024-11-07 This causes a bug where the focus is going haywire
-- config.pane_focus_follows_mouse = true
config.tab_bar_at_bottom = false

local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")
resurrect.periodic_save({ interval_seconds = 60 * 15, save_workspaces = true, save_windows = true, save_tabs = true })

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

config.font = wezterm.font_with_fallback({ "Iosevka Custom", "Apple Color Emoji", "Flog Symbols" })
config.font_rules = {
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font({
			family = "Iosevka Custom",
			weight = "ExtraBold",
		}),
	},
}
config.font_size = 18
config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {
	left = "3cell",
	right = "3cell",
	top = "2cell",
	bottom = "2cell",
}

-- Slightly transparent and blurred background
--config.window_background_opacity = 0.9
--config.macos_window_background_blur = 30

-- Removes the title bar, leaving only the tab bar. Keeps
-- the ability to resize by dragging the window's edges.
-- On macOS, 'RESIZE|INTEGRATED_BUTTONS' also looks nice if
-- you want to keep the window controls visible and integrate
-- them into the tab bar.
config.window_decorations = "RESIZE"
-- config.window_decorations = "RESIZE|INTEGRATED_BUTTONS"
config.integrated_title_button_style = "MacOsNative"
-- Sets the font for the window frame (tab bar)
config.window_frame.font = wezterm.font({ family = "Iosevka Custom", weight = "ExtraBold" })
config.window_frame.font_size = 15
-- config.window_frame.border_top_height = "1cell"

local function does_tab_have_zoomed_pane(_, pane)
	local our_tab = pane:tab()
	local is_zoomed = false
	if our_tab ~= nil then
		for _, pane_attributes in pairs(our_tab:panes_with_info()) do
			is_zoomed = pane_attributes["is_zoomed"] or is_zoomed
		end
	end
	return is_zoomed
end

local function segments_for_right_status(window, pane)
	local bat = ""
	for _, b in ipairs(wezterm.battery_info()) do
		local icon = b.state_of_charge >= 0.7 and wezterm.nerdfonts.md_battery_high
			or (b.state_of_charge >= 0.3 and wezterm.nerdfonts.md_battery_medium or wezterm.nerdfonts.md_battery_low)
		bat = icon .. string.format("%.0f%%", b.state_of_charge * 100)
	end

	local segments = {}
	if does_tab_have_zoomed_pane(window, pane) then
		table.insert(segments, wezterm.nerdfonts.md_magnify_scan)
	end
	table.insert(segments, bat)
	table.insert(segments, window:active_workspace())
	table.insert(segments, wezterm.strftime("%a %b %-d %H:%M"))
	table.insert(segments, wezterm.hostname())

	return segments
end

wezterm.on("update-status", function(window, pane)
	local elements = {}
	local segments = {}
	if does_tab_have_zoomed_pane(window, pane) then
		table.insert(segments, wezterm.nerdfonts.md_magnify_scan)
	end
	local color_scheme = window:effective_config().resolved_palette
	-- local bg = wezterm.color.parse(color_scheme.background)
	local fg = color_scheme.foreground

	for i, seg in ipairs(segments) do
		local is_first = i == 1

		if is_first then
			table.insert(elements, { Background = { Color = "none" } })
		end
		-- table.insert(elements, { Foreground = { Color = gradient[i] } })
		-- table.insert(elements, { Text = SOLID_LEFT_ARROW })

		table.insert(elements, { Foreground = { Color = fg } })
		-- table.insert(elements, { Background = { Color = gradient[i] } })
		table.insert(elements, { Text = " " .. seg .. " " })
	end

	window:set_right_status(wezterm.format(elements))
end)
--[=====[ 
wezterm.on("update-status", function(window, pane)
	local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
	local segments = segments_for_right_status(window, pane)

	local color_scheme = window:effective_config().resolved_palette
	-- Note the use of wezterm.color.parse here, this returns
	-- a Color object, which comes with functionality for lightening
	-- or darkening the colour (amongst other things).
	local bg = wezterm.color.parse(color_scheme.background)
	local fg = color_scheme.foreground

	-- Each powerline segment is going to be coloured progressively
	-- darker/lighter depending on whether we're on a dark/light colour
	-- scheme. Let's establish the "from" and "to" bounds of our gradient.
	local gradient_to, gradient_from = bg, bg
	if appearance.is_dark() then
		gradient_from = gradient_to:lighten(0.2)
	else
		gradient_from = gradient_to:darken(0.2)
	end

	-- Yes, WezTerm supports creating gradients, because why not?! Although
	-- they'd usually be used for setting high fidelity gradients on your terminal's
	-- background, we'll use them here to give us a sample of the powerline segment
	-- colours we need.
	local gradient = wezterm.color.gradient(
		{
			orientation = "Horizontal",
			colors = { gradient_from, gradient_to },
		},
		#segments -- only gives us as many colours as we have segments.
	)

	-- We'll build up the elements to send to wezterm.format in this table.
	local elements = {}

	for i, seg in ipairs(segments) do
		local is_first = i == 1

		if is_first then
			table.insert(elements, { Background = { Color = "none" } })
		end
		table.insert(elements, { Foreground = { Color = gradient[i] } })
		table.insert(elements, { Text = SOLID_LEFT_ARROW })

		table.insert(elements, { Foreground = { Color = fg } })
		table.insert(elements, { Background = { Color = gradient[i] } })
		table.insert(elements, { Text = " " .. seg .. " " })
	end

	window:set_right_status(wezterm.format(elements))
end)
--]=====]

local function move_pane(key, direction)
	return {
		key = key,
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection(direction),
		one_shot = false,
		-- Deactivate the keytable after a timeout.
		timeout_milliseconds = 1000,
	}
end

local function resize_pane(key, direction)
	return {
		key = key,
		action = wezterm.action.AdjustPaneSize({ direction, 3 }),
	}
end

-- If you're using emacs you probably wanna choose a different leader here,
-- since we're gonna be making it a bit harder to CTRL + A for jumping to
-- the start of a line
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

-- Table mapping keypresses to actions
config.keys = {
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
	-- 	}),
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

	{ key = "s", mods = "LEADER", action = wezterm.action.PaneSelect({
		alphabet = "arstneoi",
	}) },

	-- Sends ESC + b and ESC + f sequence, which is used
	-- for telling your shell to jump back/forward.
	{
		-- When the left arrow is pressed
		key = "LeftArrow",
		-- With the "Option" key modifier held down
		mods = "OPT",
		-- Perform this action, in this case - sending ESC + B
		-- to the terminal
		action = wezterm.action.SendString("\x1bb"),
	},
	{
		key = "m",
		mods = "LEADER",
		action = wezterm.action.TogglePaneZoomState,
	},
	{
		key = "RightArrow",
		mods = "OPT",
		action = wezterm.action.SendString("\x1bf"),
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
		key = '"',
		-- Note that instead of a key modifier mapped to a key on your keyboard
		-- like CTRL or ALT, we can use the LEADER modifier instead.
		-- This means that this binding will be invoked when you press the leader
		-- (CTRL + A), quickly followed by quotes (").
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "%",
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

	move_pane("j", "Down"),
	move_pane("k", "Up"),
	move_pane("h", "Left"),
	move_pane("l", "Right"),

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

config.key_tables = {
	resize_panes = {
		resize_pane("j", "Down"),
		resize_pane("k", "Up"),
		resize_pane("h", "Left"),
		resize_pane("l", "Right"),
	},
}

config.skip_close_confirmation_for_processes_named = {
	"bash",
	"sh",
	"zsh",
	"fish",
	"tmux",
	"nu",
	"cmd.exe",
	"sqlite3",
	"pwsh.exe",
	"powershell.exe",
}

--The filled in variant of the < symbol
local LEFT_HALF_CIRCLE = wezterm.nerdfonts.ple_left_half_circle_thick

-- The filled in variant of the > symbol
local RIGHT_HALF_CIRCLE = wezterm.nerdfonts.ple_right_half_circle_thick

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
local function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return tab_info.tab_index + 1 .. ":" .. title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.tab_index + 1 .. ":" .. tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local is_dark = appearance.is_dark()
	local edge_background = is_dark and "#222436" or "#e1e2e7"
	local background = is_dark and "#2f334d" or "#c4c8da"
	local foreground = is_dark and "#828bb8" or "#6172b0"

	if tab.is_active then
		background = is_dark and "#2f334d" or "#b7c1e3"
		foreground = is_dark and "#c8d3f5" or "#828bb8"
	elseif hover then
		background = is_dark and "#2f334d" or "#b7c1e3"
		foreground = is_dark and "#c8d3f5" or "#828bb8"
	end

	local edge_foreground = background

	local title = tab_title(tab)

	-- ensure that the titles fit in the available space,
	-- and that we have room for the edges.
	title = wezterm.truncate_right(title, max_width - 2)

	-- Padding
	if tab.tab_index == 0 then
		return {
			{ Background = { Color = edge_background } },
			{ Foreground = { Color = edge_foreground } },
			{ Text = " " },
			{ Text = LEFT_HALF_CIRCLE },
			{ Background = { Color = background } },
			{ Foreground = { Color = foreground } },
			{ Text = title },
			{ Background = { Color = edge_background } },
			{ Foreground = { Color = edge_foreground } },
			{ Text = RIGHT_HALF_CIRCLE },
		}
	else
		return {
			{ Background = { Color = edge_background } },
			{ Foreground = { Color = edge_foreground } },
			{ Text = LEFT_HALF_CIRCLE },
			{ Background = { Color = background } },
			{ Foreground = { Color = foreground } },
			{ Text = title },
			{ Background = { Color = edge_background } },
			{ Foreground = { Color = edge_foreground } },
			{ Text = RIGHT_HALF_CIRCLE },
		}
	end
end)

wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = true
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)

return config
