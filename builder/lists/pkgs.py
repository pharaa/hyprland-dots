pacman_pkgs = [
    # пакеты композитора
    "hyprland",
    "hyprlock",
    "hypridle",
    "hyprshot",
    "hyprpicker",
    "xdg-desktop-portal-hyprland",
    
    # буфер обмена
    "wl-clipboard",
    "cliphist",
    
    # gui-фреймворки
    "qt5-wayland",
    "qt6-wayland",
    "quickshell",
    "gtk3",
    "gtk4",
    
    # шрифты
    "ttf-jetbrains-mono",
    "ttf-jetbrains-mono-nerd",
    "noto-fonts",
    "noto-fonts-emoji",
    
    # всякие хрени для настройки чего-то там
    "blueman",
    "nwg-look",
    "pavucontrol",
    "nm-connection-editor"
    
    # обои, панелька, уведомления, лаунчер приложений
    "awww",
    "waybar",
    "swaync",
    "fuzzel",
    
    # tui-утилиты
    "alacritty",
    "kitty",
    "fastfetch",
    "uwufetch",
    "nvtop",
    "htop",
    "ranger",
    "cava",
    
    # звук и прочее жизненно-важное
    "pipewire",
    "alsa-utils",
    "pipewire-pulse",
    "pipewire-alsa",
    "wireplumber",
    "dbus",
    "gvfs",
    "gvfs-mtp",
    "brightnessctl",
    
    # шелл
    "zsh",
    "bat",
    "lsd",
    
    # всякие открывашки и редакторы
    "feh",
    "vlc",
    "krita",
    "shotcut",
    "libreoffice-fresh",
    
    # ежедневное использование
    "steam",
    "discord",
    "chromium",
    "firefox",
    "telegram-desktop",
    "kiwix-desktop", # офлайн-браузер
    "torbrowser-launcher",
    "virtualbox",
    "prismlauncher",
    "obs-studio",
    
    # для разрабов
    "gcc",
    "clang",
    "make",
    "automake",
    "jdk21-openjdk",
    "python-pip",
    "rust",
    "cargo",
    "docker",
    "sqlitebrowser"
    
]

aur_pkgs = [
    "aimp", # крутой плеер для музыки
    "wlogout", # менюшка управления сессией
    "vscodium", # редактор
    "catppuccin-gtk-theme-mocha", # тема GTK
    "amneziavpn-bin" # впн-клиент
]

# нвидиа драйвера на gtx 10 серии
ancient_drivers = [
    "nvidia-580xx-dkms",
    "nvidia-580xx-utils",
    "nvidia-580xx-settings"
]