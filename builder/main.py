import configs
import requests
import pkgs
import time
import os

def install_cfg():
    print("Создаём директорию ~/.icons")
    try:
        os.mkdir("/home/$USER/.icons")
    except:
        print("Директория уже создана, пропускаем")
        pass
    
    print("Копируем конфиги в ~/.config")
    for cfg in configs.cfg_list:
        os.system(f"cp -r {cfg} /home/$USER/.config")
    
    print("Копируем иконки в ~/.icons")
    for icon in configs.icons:
        os.system(f"cp -r {icon} /home/$USER/.icons")
    pass

def install_pkgs():
    print("Установка пакетов hyprland")
    os.system(f"sudo pacman -S {pkgs.hypr}")
    print("Установка прочих элементов окружения")
    os.system(f"sudo pacman -S {pkgs.wl_apps}")
    print("Установка терминалов")
    os.system(f"sudo pacman -S {pkgs.terminals}")

    print("Дальше на ваш выбор...")
    time.sleep(3)
    for pkg in pkgs.base:
        os.system(f"sudo pacman -S {pkg}")

    for pkg in pkgs.files:
        os.system(f"sudo pacman -S {pkg}")

    for pkg in pkgs.daily_use:
        os.system(f"sudo pacman -S {pkg}")

    for pkg in pkgs.for_devs:
        os.system(f"sudo pacman -S {pkg}")
    
    print("Крутой плеер, скачайте пж")
    for pkg in pkgs.aur:
        os.system(f"yay -S {pkg}")
    
    choice = input("Вам нужны драйвера Nvidia? [Y/n] >")
    if choice == "n" or "N":
        pass
    else:
        os.system("sudo pacman -S nvidia-dkms nvidia-utils")
    pass

def other_files():
    print("Установка пакета обоев")
    os.system("cp -r wallpapers /home/$USER")
    print("Копирование .zshrc и .avatar в ~")
    os.system("cp .zshrc /home/$USER")
    os.system("cp .avatar /home/$USER")
    print("Создаём директорию ~/.themes")
    try:
        os.mkdir("/home/$USER/.themes")
    except:
        print("Директория уже создана, пропускаем")
        pass
    print("Установка тем в ~/.themes")
    os.system("sudo cp -r /usr/share/themes/catppuccin-mocha-mauve-standard+default ~/.themes")
    os.system("sudo rm -rf /usr/share/themes")
    pass

def configure_shell():
    print("Установка oh my zsh")
    os.system('sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"')

    print("Установка темы PowerLevel10k")
    os.system('git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"')

    print("Копирование файлов конфигурации zsh")
    os.system("cp -r .oh-my-zsh /home/$USER")
    os.system("cp .p10k.zsh .oh-my-zsh /home/$USER")
    os.system("cp .zshrc /home/$USER")
    print("Установка zsh как шелла по умолчанию")
    os.system("chsh -s $(which zsh)")
    pass

if __name__ == "__main__":
    install_cfg()
    other_files()
    install_pkgs()
    configure_shell()
    print("Всё готово! Перезагрузите сессию")