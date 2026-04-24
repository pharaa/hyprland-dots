#!/bin/bash

options="Region
Screen
Window"

choice=$(echo -e "$options" | fuzzel --dmenu --lines 3)

case $choice in
    "Region")
        sleep 0.5
        hyprshot -m region -z -o ~/Pictures/Screenshots/
        ;;
    "Screen")
        sleep 0.5
        hyprshot -z -m output -o ~/Pictures/Screenshots/
        ;;
    "Window")
        sleep 0.5
        hyprshot -z -m window -o ~/Pictures/Screenshots/
        ;;
esac