#!/bin/bash

options="Region
Screen
Window"

choice=$(echo -e "$options" | fuzzel --dmenu --lines 3)

case $choice in
    "Region")
        hyprshot -m region -z -o ~/Pictures/Screenshots/
        ;;
    "Screen")
        hyprshot -z -m output -o ~/Pictures/Screenshots/
        ;;
    "Window")
        hyprshot -z -m window -o ~/Pictures/Screenshots/
        ;;
esac