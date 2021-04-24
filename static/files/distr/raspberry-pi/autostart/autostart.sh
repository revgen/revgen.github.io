#!/bin/bash
# This is an autostart script for Raspberry Pi
# Put this script and autostart.desktop script into the /home/pi/.config/autostart directory

delay=10

sleep ${delay} | tee >(zenity --progress --pulsate --no-cancel --auto-close --width=320 --text="Loading (please wait ~${delay} sec) ...")
TIMEOUT=30 bash "/usr/bin/system-info-pi" &

amixer set Master 85%
amixer set Master unmute
omxplayer /usr/share/sounds/freedesktop/stereo/service-login.oga

