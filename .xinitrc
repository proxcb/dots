#!/bin/bash
setxkbmap -option ctrl:nocaps
xrandr --output HDMI-2 --mode 1920x1080 --same-as eDP-1 --rate 120

feh --bg-fill $HOME/Downloads/wallpaper/wallhaven-4ggp17.jpg

# Statusbar loop
while true; do
    bat0=$(cat /sys/class/power_supply/BAT0/capacity)
    bat1=$(cat /sys/class/power_supply/BAT1/capacity)
    avg=$(( (bat0 + bat1) / 2 ))
    xsetroot -name "$(date +"%F %R") | ${avg}%"
    sleep 30s
done &

setxkbmap -layout "us,fi" -option "grp:alt_space_toggle"

# Git
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/gh_arch
ssh-add ~/.ssh/gitlab_arch

exec dwm
