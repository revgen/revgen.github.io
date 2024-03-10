#!/usr/bin/env bash

KIOSK_HOMEPAGE=${KIOSK_HOMEPAGE:-"http://localhost"}
# SCREEN_WIDTH=720
# SCREEN_HEIGHT=576
SCREEN_WIDTH=1920
SCREEN_HEIGHT=1080

xdotool mousemove 9999 9999 &

xset -dpms
xset s off
xset s noblank

echo "Start browser in kiosk mode (screen: ${SCREEN_WIDTH}x${SCREEN_HEIGHT}): ${KIOSK_HOMEPAGE}"
unclutter &
chromium-browser "${KIOSK_HOMEPAGE}" \
    --window-size=${SCREEN_WIDTH},${SCREEN_HEIGHT} --start-fullscreen \
    --kiosk --incognito --no-first-run --noerrdialogs \
    --disk-cache-dir=/dev/null --password-store=basic \
    --fast --fast-start --disable-infobars \
    --disable-translate --disable-features=TranslateUI &

xdotool mousemove 9999 9999
