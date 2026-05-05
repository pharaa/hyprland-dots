import os

def create_dirs():
    print("Создаём директорию ~/.icons")
    try:
        os.mkdir("/home/$USER/.icons")
    except:
        print("Директория уже создана, пропускаем")
        pass
    
    print("Создаём директорию ~/.extra")
    try:
        os.mkdir("/home/$USER/.extra")
    except:
        print("Директория уже создана, пропускаем")
        pass

    print("Создаём папку ~/.assets")
    try:
        os.mkdir("/home/$USER/.assets")
    except:
        print("Директория уже создана, пропускаем")
        pass