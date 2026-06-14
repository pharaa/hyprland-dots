from funcs.install_files import *
from funcs.install_pkgs import *
from funcs import create_dirs
from lists import pkgs
import time
import os

def install_yay():
    print("Установка yay...")
    os.system("git clone https://aur.archlinux.org/yay.git && cd yay")
    os.system("makepkg -si")

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
    scripts = [
        "screenshot.sh",
        "wipe_clipboard.sh",
        "toggle_waybar.sh",
        "switch_workspace.sh"
    ]
    print("Добавляем права запуска для скриптов")
    for script in scripts:
        os.system(f"chmod +x /home/$USER/.assets/scripts/{script}")
    
    print("Добавляем пользователя в группу input")
    os.system("sudo usermod -aG input $USER")
    print("Добавляем пользователя в группу gamemode")
    os.system("sudo usermod -aG gamemode $USER")
    pass

if __name__ == "__main__":
    choice = 0
    driv = input("Вам нужны драйвера Nvidia 580xx? [y/N] > ")
    
    while True:
        choice = input("Выберите что ставить:\n1. Только конфиги\n2. Только пакеты\n3. Пакеты и конфиги\n > ")
        if choice == "1" or "2" or "3":
            break
        else:
            continue

    if choice == "1":
        create_dirs.create_dirs()
            
        install_cfg()
        install_icons()
        install_extra()
        install_assets()
        install_wallpapers()
        install_avatar()
        configure_shell()
    elif choice == "2":
        print("Устанавливаем пакеты..")
        time.sleep(3)
        install_pacman_pkg(pkgs.pacman_pkgs)
        install_yay()
        install_yay_pkg(pkgs.aur_pkgs)
    elif choice == "3":
        create_dirs.create_dirs()
            
        install_cfg()
        install_icons()
        install_extra()
        install_assets()
        install_wallpapers()
        install_avatar()
        
        print("Устанавливаем пакеты..")
        time.sleep(3)
        install_pacman_pkg(pkgs.pacman_pkgs)
        install_yay()
        install_yay_pkg(pkgs.aur_pkgs)

        configure_shell()
        post_installation()
    else:
        "Выберите либо 1 либо 2 либо 3"
        
    if driv == "y" or "Y":
        install_yay_pkg(pkgs.ancient_drivers)
    else:
        pass

    print("Всё готово! Перезагрузите сессию")