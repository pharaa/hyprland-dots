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

    print("Прочие пакеты..")
    time.sleep(3)
    
    print("Крутой плеер, скачайте пж")
    for pkg in pkgs.aur:
        os.system(f"yay -S {pkg}")
    
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
    os.system("cp -r assets/icons /home/$USER/assets")
    os.system("cp -r assets/colors.css /home/$USER/assets")

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
    os.system("cp -r .oh-my-zsh /home/$USER")
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