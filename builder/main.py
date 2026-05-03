from lists import configs, pkgs
import requests
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

    print("Создаём директорию ~/.extra")
    try:
        os.mkdir("/home/$USER/.extra")
    except:
        print("Директория уже создана, пропускаем")
        pass

    print("Копируем дополнительные файлы в ~/.extra")
    for file in os.listdir(configs.extra):
        try:
            os.system(f"cp extra/{file} /home/$USER/.extra")
        except:
            os.system(f"cp -r extra/{file} /home/$USER/.extra")
    pass

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
    
    choice = input("Вам нужны драйвера Nvidia? [Y/n] >")
    if choice == "n" or "N":
        pass
    else:
        os.system("sudo pacman -S nvidia-dkms nvidia-utils")
    pass

def install_assets():
    print("Создаём папку /home/$USER/.assets")
    try:
        os.mkdir("/home/$USER/.assets")
    except:
        print("Директория уже создана, пропускаем")
        pass
    
    print("Установка файлов ассетов")
    os.system("cp -r assets/icons /home/$USER/.assets")
    os.system("cp assets/colors.css /home/$USER/.assets")

def other_files():
    print("Установка пакета обоев")
    os.system("cp -r wallpapers /home/$USER")
    print("Копирование .zshrc и .avatar в ~")
    os.system("cp .zshrc /home/$USER")
    os.system("cp .avatar /home/$USER")
    pass

def configure_shell():
    print("Установка oh my zsh")
    os.system('sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"')

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
    install_cfg()
    other_files()
    install_assets()
    install_pkgs()
    configure_shell()
    post_installation()
    print("Всё готово! Перезагрузите сессию")