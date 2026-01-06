local wezterm = require("wezterm")
local config = wezterm.config_builder()

local function basename(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

local SOLID_LEFT_ARROW = utf8.char(0xe0ba)
local SOLID_LEFT_MOST = utf8.char(0x2588)
local SOLID_RIGHT_ARROW = utf8.char(0xe0bc)

local ADMIN_ICON = utf8.char(0xf49c)

local CMD_ICON = utf8.char(0xe62a)
local PS_ICON = utf8.char(0xe70f)
local WSL_ICON = utf8.char(0xe712)

local VIM_ICON = utf8.char(0xe62b)
local HOURGLASS_ICON = utf8.char(0xf252)

local PYTHON_ICON = utf8.char(0xf820)

local SUP_IDX = {
	"¹",
	"²",
	"³",
	"⁴",
	"⁵",
	"⁶",
	"⁷",
	"⁸",
	"⁹",
	"¹⁰",
	"¹¹",
	"¹²",
	"¹³",
	"¹⁴",
	"¹⁵",
	"¹⁶",
	"¹⁷",
	"¹⁸",
	"¹⁹",
	"²⁰",
}
local SUB_IDX = {
	"₁",
	"₂",
	"₃",
	"₄",
	"₅",
	"₆",
	"₇",
	"₈",
	"₉",
	"₁₀",
	"₁₁",
	"₁₂",
	"₁₃",
	"₁₄",
	"₁₅",
	"₁₆",
	"₁₇",
	"₁₈",
	"₁₉",
	"₂₀",
}

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local edge_background = "#1d2021"
	local background = "#4E4E4E"
	local foreground = "#1C1B19"
	local dim_foreground = "#3A3A3A"

	if tab.is_active then
		background = "#FBB829"
		foreground = "#1C1B19"
	elseif hover then
		background = "#FF8700"
		foreground = "#1C1B19"
	end

	local edge_foreground = background
	local process_name = tab.active_pane.foreground_process_name
	local pane_title = tab.active_pane.title
	local exec_name = basename(process_name):gsub("%.exe$", "")
	local title_with_icon

	if exec_name == "pwsh" or exec_name == "powershell" then
		title_with_icon = PS_ICON .. " PS"
	elseif exec_name == "cmd" then
		title_with_icon = CMD_ICON .. " CMD"
	elseif exec_name == "wsl" or exec_name == "wslhost" then
		title_with_icon = WSL_ICON .. " WSL"
	elseif exec_name == "python" or exec_name == "hiss" then
		title_with_icon = PYTHON_ICON .. " " .. exec_name
	else
		title_with_icon = HOURGLASS_ICON .. " " .. exec_name
	end

	if tab.active_pane.title:find("nvim") then
		title_with_icon = VIM_ICON .. " " .. tab.active_pane.title
	end

	local left_arrow = SOLID_LEFT_ARROW

	if tab.tab_index == 0 then
		left_arrow = SOLID_LEFT_MOST
	end
	local id = SUB_IDX[tab.tab_index + 1]
	local pid = SUP_IDX[tab.active_pane.pane_index + 1]
	local title = " " .. wezterm.truncate_right(title_with_icon, max_width - 6) .. " "

	return {
		{ Attribute = { Intensity = "Bold" } },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = left_arrow },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = id },
		{ Text = title },
		{ Foreground = { Color = dim_foreground } },
		{ Text = pid },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
		{ Attribute = { Intensity = "Normal" } },
	}
end)

config.default_domain = "WSL:Ubuntu-24.04"
config.window_decorations = "RESIZE | TITLE"
config.default_cursor_style = "BlinkingBlock"

config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

config.window_close_confirmation = "NeverPrompt"
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 12.0
config.line_height = 1.15
config.color_scheme = "Gruvbox Material (Gogh)"
config.colors = {
	background = "#1d2021",
	tab_bar = {
		background = "#1d2021",
	},
}
config.dpi = 100.0

config.leader = { key = "]", mods = "CTRL" }
config.disable_default_key_bindings = true
config.keys = {
	-- Allows sending a literal CTRL + a to the shell/terminal.
	{ key = "]", mods = "LEADER|CTRL", action = wezterm.action({ SendString = "\x01" }) },
	-- Split terminal vertically
	{ key = "s", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	-- Split terminal horizontally
	{ key = "v", mods = "LEADER", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	-- Toggle Focus on Current tab (Toggle again to return to normal)
	{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
	-- Create new tab
	{ key = "n", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
	-- Vim motions for swapping Split Panes
	{ key = "h", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
	{ key = "j", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
	{ key = "k", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
	{ key = "l", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
	-- Vim motions for adjusting Split Pane sizes
	{ key = "H", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
	{ key = "J", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
	{ key = "K", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
	{ key = "L", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },
	-- Swapping tabs with numbers
	{ key = "1", mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
	{ key = "2", mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
	{ key = "3", mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
	{ key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
	{ key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 4 }) },
	{ key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
	{ key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
	{ key = "8", mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
	{ key = "9", mods = "LEADER", action = wezterm.action({ ActivateTab = 8 }) },
	-- Close Pane/Tab, both forced and confirmed
	{ key = "d", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = false } }) },
	-- Spawn new tab with windows cmd open
	{
		key = "C",
		mods = "LEADER|SHIFT",
		action = wezterm.action({
			SpawnCommandInNewTab = {
				domain = { DomainName = "local" },
				args = { "cmd.exe" },
			},
		}),
	},
	{
		key = "P",
		mods = "LEADER|SHIFT",
		action = wezterm.action({
			SpawnCommandInNewTab = {
				domain = { DomainName = "local" },
				args = { "powershell.exe" },
			},
		}),
	},
	{
		key = "W",
		mods = "LEADER|SHIFT",
		action = wezterm.action({
			SpawnCommandInNewTab = {
				domain = { DomainName = "WSL:Ubuntu-24.04" },
				args = { "zsh", "-ic", "nvim /mnt/c/Users/dhall/.wezterm.lua" },
			},
		}),
	},
	-- Refresh wezterm config
	{ key = "r", mods = "LEADER", action = wezterm.action.ReloadConfiguration },
	-- Enter Copy Mode
	{ key = "v", mods = "LEADER|SHIFT", action = wezterm.action.ActivateCopyMode },
	-- Activate command pallete
	{ key = "p", mods = "LEADER", action = wezterm.action.ActivateCommandPalette },
}

return config
