+++
title = "Setup Raspberry Pi"
date = "2019-11-01"
tags = [
    "raspberrypi"
]
categories = [
    "devices",
    "settings"
]
+++

## Install a system

* [Rasbian download page](http://downloads.raspberrypi.org/raspbian_latest) (Default rasbian credentials: pi / raspberry)
* Core terminal tools:
```bash
sudo apt install htop screen mc elinks git vim p7zip-full jq curl wget dialog tree ncdu
sudo apt install wicd wicd-cli wicd-curses
```

## Setup: python + pip
```bash
wget -O /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py
python /tmp/get-pip.py
sudo ln -fs $(which python3) /usr/bin/python
sudo ln -fs $(which pip3) /usr/bin/pip
```
## Add new user
```bash
sudo apt-get install -y sudo
adduser <username>
# usermod -a -G sudo <username>
# usermod -a -G adm,sudo,audio,video,games,users,input,gpio,netdev,i2c,spi <username>
```

## Install Xfce
```bash
sudo apt-get install --no-install-recommends xserver-xorg xinit
sudo apt-get install --no-install-recommends xfce4 xfce4-notifyd
sudo apt-get install -y lightdm
sudo apt-get install -y xfce4-terminal thunar thunar-archive-plugin ristretto 
sudo apt-get install -y xfce4-datetime-plugin xfce4-xkb-plugin xfce4-pulseaudio-plugin
```

## Install Raspberry Pi Desktop (RPD) GUI
```bash
sudo apt-get install --no-install-recommends xserver-xorg xinit
sudo apt-get install raspberrypi-ui-mods raspberrypi-net-mods lxsession rpd-icons
sudo apt-get install -y lightdm
sudo apt-get install -y pi-greeter  gtk2-engines-clearlookspix xfce4-terminal
```
## Install Windows TTF fonts (non-free contrib - packages)
```bash
sudo apt-get install -y ttf-mscorefonts-installer
```

## Core GUI tools
```bash
sudo apt-get install evince wpagui firefox-esr
```

## Automount usb drives
```bash
sudo apt-get install usbmount
sudo cp /lid/systemd/system/systemd-udevd.service /lid/systemd/system/systemd-udevd.service.bak
sudo sed -i 's/MountFlags=slave/MountFlags=shared/g' /lid/systemd/system/systemd-udevd.service
sudo cp /etc/usbmount/usbmount.conf /etc/usbmount/usbmount.conf.bak
sudo sed -i 's/FS_MOUNTOPTIONS=""/FS_MOUNTOPTIONS="-fstype=vfat,gid=pi,uid=pi,umask=0,allow_other,utf8"/g' /etc/usbmount/usbmount.conf
sudo systemctl restart systemd-udevd

# Support ExFat file system
sudo apt-get install fuse-exfat exfat-utils
# Support NTFS file system
sudo apt-get install ntfs-3g

# reboot
```

## Display

### Display 3.2inch RPi LCD
![WaveShare 3.2" display for Raspberry Pi](../Display-3.2inch-RPi-LCD-C-1.jpg)

Quick connect display to the Raspberry Pi (tested on Raspberry Pi 3)
```bash
git clone https://github.com/waveshare/LCD-show.git
cd LCD-show/
./LCD32-show

# ./LCD-hdmi - return outut to HDMI only
```

#### Documentations
* https://www.waveshare.com/wiki/3.2inch_RPi_LCD_(C)
* https://www.waveshare.com/w/upload/1/1e/RPi_LCD_User_Manual_EN.pdf
* https://projects.webvoss.de/2017/03/26/3-2-touch-display-quick-guide/
* Buttons: http://raspi.tv/2013/how-to-use-interrupts-with-python-on-the-raspberry-pi-and-rpi-gpio-part-2


## Links

* [Good blog about RaspberryPi 3](https://trickiknow.com/raspberry-pi-3-complete-tutorial-2018-lets-get-started/)
* [Setting WiFi up via the command line](https://www.raspberrypi.org/documentation/configuration/wireless/wireless-cli.md)
* [Rasbian Lite Guide - GUI](https://www.raspberrypi.org/forums/viewtopic.php?t=133691)
