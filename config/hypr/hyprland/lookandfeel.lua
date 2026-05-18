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

hl.config({
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo   = false,
    },
})
