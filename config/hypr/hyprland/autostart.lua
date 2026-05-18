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