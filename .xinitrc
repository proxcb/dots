#!/bin/bash
setxkbmap -option ctrl:nocaps

# External monitor
monitor1=HDMI-2

xrandr --output $monitor1 --same-as eDP-1 

feh --bg-fill $HOME/Downloads/wallpaper/wallhaven-x893w3.jpg

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
# Github
ssh-add ~/.ssh/gh_arch
# GitLab
ssh-add ~/.ssh/gitlab_arch

exec dwm

