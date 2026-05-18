-- Проги
local terminal = "alacritty"
local fileManager = "kitty ranger"
local menu = "fuzzel"

local nvtop = "kitty nvtop"
local htop = "kitty htop"
local browser = "chromium"
local launcher = "prismlauncher"

-- Функции
local wallpaper = "bash /home/$USER/.extra/wallpaper_picker/wallpaper_picker.sh" -- Менюшка выбора обоев
local screenshot = "bash /home/$USER/.config/fuzzel/screenshot.sh" -- Меню скриншота
local quick_screenshot = "hyprshot -m region -z -o ~/Pictures/Screenshots/" -- Быстрый скриншот области
local pick = "hyprpicker -a" -- Выбиралка цвета с экрана
local wipe = "cliphist wipe" -- Очистка буфера

local clipboard = "cliphist list | fuzzel --dmenu | cliphist decode | wl-copy" -- Открывашка буфера для копирования