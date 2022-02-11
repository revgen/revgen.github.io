#!/bin/bash
# This is an autostart script for Raspberry Pi
# Put this script and autostart.desktop script into the /home/pi/.config/autostart directory

delay=5

echo "Set main volume level to 85% at startup"
amixer set Master 85%
amixer set Master unmute

echo "Show loading progress bar"
sleep ${delay} | tee >(zenity --progress --pulsate --no-cancel --auto-close --width=320 --text="Loading (please wait ~${delay} sec) ...")

echo "Play startup sound: /usr/share/sounds/freedesktop/stereo/service-login.oga"
omxplayer /usr/share/sounds/freedesktop/stereo/service-login.oga

echo "Write system infor on wallpaper"
sysinfo-slim --border | write-on-wallpaper.sh left-top #c0c0c0 24
