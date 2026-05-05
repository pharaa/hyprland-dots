from funcs.install_files import *
from funcs import create_dirs
from lists import configs, pkgs
import time
import os

def install_pkgs():
    print("Установка базовых пакетов")
    os.system(f"sudo pacman -S {pkgs.base}")
    
    print("Установка пакетов hyprland")
    os.system(f"sudo pacman -S {pkgs.hypr}")
    
    print("Установка прочих элементов окружения")
    os.system(f"sudo pacman -S {pkgs.wl_apps}")
    
    print("Установка терминалов")
    os.system(f"sudo pacman -S {pkgs.terminals_and_tui}")
    
    print("Установка пакетов шелла")
    os.system(f"sudo pacman -S {pkgs.shell}")
    
    print("Прочие пакеты..")
    time.sleep(3)
    os.system(f"sudo pacman -S {pkgs.files}")
    os.system(f"sudo pacman -S {pkgs.daily_use}")
    os.system(f"sudo pacman -S {pkgs.for_devs}")
    
    os.system(f"yay -S {pkgs.aur}")

def configure_shell():
    print("Установка oh my zsh (после установки напишите exit)")
    os.system('sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"')
    
    print("Установка плагинов zsh")
    os.system("git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions")
    os.system("git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting")

    print("Установка темы PowerLevel10k")
    os.system('git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"')

    print("Копирование файлов конфигурации zsh")
    os.system("cp .p10k.zsh .oh-my-zsh /home/$USER")
    os.system("cp .zshrc /home/$USER")
    print("Установка zsh как шелла по умолчанию")
    os.system("chsh -s $(which zsh)")
    pass

def post_installation():
    os.system("chmod +x /home/$USER/.config/fuzzel/screenshot.sh")
    pass

if __name__ == "__main__":
    create_dirs.create_dirs()
    
    install_cfg()
    install_icons()
    install_extra()
    install_assets()
    install_wallpapers()
    install_avatar()
    
    install_pkgs()
    configure_shell()
    post_installation()
    print("Всё готово! Перезагрузите сессию")