import os

def install_pacman_pkg(ls):
    for pkg in ls:
        os.system(f"sudo pacman -S --noconfirm {pkg}")
        
def install_yay_pkg(ls):
    for pkg in ls:
        os.system(f"yay -S --noconfirm {pkg}")