import os

def install_cfg():
    print("Копируем конфиги в ~/.config")
    for cfg in configs.cfg_list:
        os.system(f"cp -r {cfg} /home/$USER/.config")
    
def install_icons():
    print("Копируем иконки в ~/.icons")
    for icon in configs.icons:
        os.system(f"cp -r {icon} /home/$USER/.icons")

def install_extra():
    print("Копируем дополнительные файлы в ~/.extra")
    for file in configs.extra:
        os.system(f"cp -r extra/{file} /home/$USER/.extra")
        
def install_assets():
    print("Установка файлов ассетов")
    os.system("cp -r assets/color_schemes /home/$USER/.assets")
    os.system("cp -r assets/icons /home/$USER/.assets")
    os.system("cp assets/colors.css /home/$USER/.assets")

def install_wallpapers():
    print("Установка пакета обоев")
    os.system("cp -r wallpapers /home/$USER")

def install_avatar():
    print("Копирование .avatar в ~")
    os.system("cp .avatar /home/$USER")