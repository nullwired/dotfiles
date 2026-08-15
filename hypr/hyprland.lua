local terminal = "kitty"
local launcher = "rofi -show drun"

hl.config({
    general = {
        gaps_in = 4,
        gaps_out = 8,
        border_size = 1,
        layout = "dwindle",
        resize_on_border = true,
        extend_border_grab_area = 4,
        hover_icon_on_border = true
    },

    decoration = {
        rounding = 7,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        fullscreen_opacity = 1.0,

        blur = {
            enabled = false
        },

        shadow = {
            enabled = false
        }
    },

    animations = {
        enabled = true,

        animation = {
            windows = {
                enabled = true,
                duration = 3,
                curve = "default"
            },

            windowsOut = {
                enabled = true,
                duration = 3,
                curve = "default"
            },

            border = {
                enabled = true,
                duration = 3,
                curve = "default"
            },

            fade = {
                enabled = true,
                duration = 3,
                curve = "default"
            },

            workspaces = {
                enabled = true,
                duration = 3,
                curve = "default"
            }
        }
    },

    input = {
        kb_layout = "us",
        follow_mouse = 1,

        touchpad = {
            natural_scroll = true,
            tap_to_click = true,
            disable_while_typing = true
        }
    },

    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        vrr = 0,
        focus_on_activate = true
    },

    cursor = {
        hide_on_key_press = false
    }
})

hl.env("XCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("GDK_BACKEND", "wayland,x11")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

hl.exec("waybar")
hl.exec("nm-applet")
hl.exec("/usr/lib/polkit-kde-authentication-agent-1")

hl.bind("SUPER + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + D", hl.dsp.exec_cmd(launcher))

hl.bind("SUPER + Q", hl.dsp.killactive())
hl.bind("SUPER + F", hl.dsp.fullscreen())
hl.bind("SUPER + V", hl.dsp.togglefloating())
hl.bind("SUPER + M", hl.dsp.exit())

hl.bind("SUPER + LEFT", hl.dsp.movefocus("l"))
hl.bind("SUPER + RIGHT", hl.dsp.movefocus("r"))
hl.bind("SUPER + UP", hl.dsp.movefocus("u"))
hl.bind("SUPER + DOWN", hl.dsp.movefocus("d"))

hl.bind("SUPER + SHIFT + LEFT", hl.dsp.movewindow("l"))
hl.bind("SUPER + SHIFT + RIGHT", hl.dsp.movewindow("r"))
hl.bind("SUPER + SHIFT + UP", hl.dsp.movewindow("u"))
hl.bind("SUPER + SHIFT + DOWN", hl.dsp.movewindow("d"))

for i = 1, 6 do
    hl.bind(
        "SUPER + " .. i,
        hl.dsp.workspace({ name = tostring(i) })
    )

    hl.bind(
        "SUPER + SHIFT + " .. i,
        hl.dsp.movetoworkspace({ name = tostring(i) })
    )
end

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+")
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")
)

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl set 5%+")
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl set 5%-")
)
