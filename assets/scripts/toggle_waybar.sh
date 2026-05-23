#!/usr/bin/bash

pids=$(pgrep -u "$(id -u)" -x waybar || true)

if [ -n "$pids" ]; then
    kill $pids
    exit 0
else
    waybar & disown
    exit 0
fi