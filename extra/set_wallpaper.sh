#!/usr/bin/env bash
if [ -n "$1" ]; then
    awww img "$1" --transition-type grow --transition-pos center
fi