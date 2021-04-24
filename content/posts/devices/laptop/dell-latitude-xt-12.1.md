+++
title = "Dell Latitude XT 12.1"
date = "2020-02-01"
tags = ["laptop" ]
categories = ["devices", "settings"]
archive = true
+++

## Specifications
* CPU: Intel Core 2 Solo 1.06 GHz (U2100)
* Memory: 2GB
* Screen: 12.1"
* Video: ATI RS600 - 1280x800
* Disk: 1.8" parallel ATA hard drive

## Linux on Dell Latitude XT 12.1

### Fix WiFi problem on Ubuntu
```
sudo apt-get update
sudo apt-get purge bcmwl-kernel-source
sudo apt-get install firmware-b43-installer
```

### Disable touchscreen
1. Get a list of all input devices: ```xinput - - list```
1. Disable two interfaces related with touch screen: ```xinput - - disable 15/16 or other```
1. ```reboot```
