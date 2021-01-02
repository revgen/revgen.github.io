+++
title = "Media Center on Raspbery Pi"
date = "2019-11-01"
tags = [
    "raspberrypi",
    "media center"
]
categories = [
    "devices",
    "settings"
]
+++

[OSMC](https://osmc.tv/about/) - it is the best Media Player that I found for Raspberry Pi.

## Install OSMC to the RaspberryPi
1. The download image file for Raspberry Pi from https://osmc.tv/download/
2. Extract image from the archive: ```gzip -d OSMC_TGT_rbp1_20191118.img.gz```
3. Write the image to the microSD card:
    1. Using GUI software: [Etcher](https://www.balena.io/etcher/)
    2. Using terminal: ```dd if=OSMC_TGT_rbp1_20191118.img of=/dev/sdX```
4. Insert microSD into the RaspberryPi and power on

## Setup OSMC system
1. Install additional packages:
```bash
sudo apt install bsdmainutils
```

# Install Retro Pie

> TODO

## Links
* Kodi on Raspberry Pi: [link 1](http://kamilslab.com/2017/02/08/how-to-install-kodi-on-the-raspberry-pi-3-running-raspbian/), [link 2](https://raspberrypi.stackexchange.com/questions/69003/how-to-autostart-kodi-at-boot)
