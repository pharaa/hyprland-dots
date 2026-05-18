
------------------
---- MONITORS ----
------------------

hl.monitor({
    output   = "DP-1",
    mode     = "1920x1080@180",
    position = "1920x0",
    scale    = "1",
})

hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080@60",
    position = "0x0",
    scale    = "1",
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "alacritty"
local fileManager = "kitty ranger"
local menu = "fuzzel"

local nvtop = "kitty nvtop"
local htop = "kitty htop"
local browser = "chromium"
local launcher = "prismlauncher"

local wallpaper = "bash /home/$USER/.extra/wallpaper_picker/wallpaper_picker.sh"
local screenshot = "bash /home/$USER/.config/fuzzel/screenshot.sh"
local quick_screenshot = "hyprshot -m region -z -o ~/Pictures/Screenshots/"
local pick = "hyprpicker -a"
local wipe = "cliphist wipe"

local clipboard = "cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"

-- Автозапуск пж

hl.on("hyprland.start", function ()
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("dbus-session")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("cliphist wipe")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "moga")

hl.env("GTK_THEME", "catppuccin-mocha-blue-standard+default")
hl.env("QT_QPA_PLATFORMTHEME", "gtk3")

hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in  = 2,
        gaps_out = 5,
        border_size = 0,

        col = {
            active_border   = { colors = {"rgba(89b4faff)"}},
            inactive_border = "rgba(1a1a1aff)",
        },

        resize_on_border = false,
        allow_tearing = false,
        layout = "scrolling",
    },

    decoration = {
        rounding       = 15,
        rounding_power = 2,
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = false,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 2,
            passes    = 1,
            vibrancy  = 0.125,
        },
    },

    animations = {
        enabled = true,
    },
})

hl.curve("shot", {type = "bezier", points = { {0.2, 1}, {0.2, 1} }})
hl.curve("swipe", {type = "bezier", points = { {0.6, 0}, {0.2, 1.05} }})
hl.curve("linear", {type = "bezier", points = { {0, 0}, {1, 1} }})
hl.curve("progressive", {type = "bezier", points = { {1, 0}, {0.6, 1} }})

hl.animation({ leaf = "border",        enabled = true,  speed = 6, bezier = "linear" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 6, bezier = "shot", style = "slide"})
hl.animation({ leaf = "fade",          enabled = true,  speed = 4, bezier = "progressive" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 6, bezier = "swipe", style = "slide" })
hl.animation({ leaf = "borderangle",    enabled = true,  speed = 100, bezier = "linear", style = "loop" })

hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
	column_width = 0.5,
	direction = "right"
    },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo   = false,
    },
})

hl.config({
    input = {
        kb_layout  = "us,ru",
        kb_variant = "",
        kb_model   = "",
        kb_options = "grp:alt_shift_toggle",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0,

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd(htop))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(nvtop))

hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))

hl.bind(mainMod .. " + ALT + PRINT", hl.dsp.exec_cmd(pick))
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd(quick_screenshot))
hl.bind("PRINT", hl.dsp.exec_cmd(screenshot))

hl.bind(mainMod .. " + ALT + R", hl.dsp.exec_cmd(clipboard))
hl.bind(mainMod .. " + ALT + C", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + ALT + P", hl.dsp.exec_cmd(launcher))
hl.bind(mainMod .. " + ALT + D", hl.dsp.exec_cmd("discord"))
hl.bind(mainMod .. " + ALT + N", hl.dsp.exec_cmd(wallpaper))
hl.bind(mainMod .. " + ALT + W", hl.dsp.exec_cmd(wipe))

hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + SHIFT + up",  hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + right",  hl.dsp.window.move({ direction = "r" }))

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})
