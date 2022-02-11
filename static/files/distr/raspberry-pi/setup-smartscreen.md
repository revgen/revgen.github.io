# RaspberryPi SmartScreen


## Setup
1. RaspberryPi zero W
2. Create micro SD card with 2022-01-28-raspios-buster-armhf.img
3. Attach micro SD card to the PC and open /boot partition
    - Enable SSH at the boot of the RaspberryPi: create ssh empty file in the /boot:
      ```bash
      touch ssh
      ```
    - Setup WiFi: create wpa_supplicant.conf file in the /boot with content:
      ```
      country=US
      ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
        network={
        ssid="WiFi-Name"
        psk="WiFi-Password"
        key_mgmt=WPA-PSK
      }
      ```
4. Put this SD card to the RaspberryPi and boot
5. Basic setup of the system:
    ```bash
    sudo raspi-config
    # hosname: smartscreen
    # Expand file system
    # Autologin desktop: pi
    # SSH: enabled
    # VNC: enabled
    # Timezone: America/New_York
    # Locale: en_US.UTF-8 (uncheck en_GB)
    ```
6. On the latest RaspberryPiOS you need to connect to the UI via VNC and finish setup on GUI (because of the screen reader alert)
   TODO: this part need to review
7. Reboot RaspberryPi


## Common tools

```bash
sudo apt install -y vim-tiny 
sudo ln -vs /usr/bin/vim.tiny /usr/bin/vim

sudo apt install -y mc htop
sudo apt install -y wget jq
sudo apt install -y curl
sudo apt install -y wicd-curses

wget https://raw.githubusercontent.com/revgen/myenv/master/home/.local/bin/session
wget https://raw.githubusercontent.com/revgen/myenv/master/extra/.local/bin/sysinfo-slim
chmod +x ./session ./sysinfo-slim
sudo mv -v ./session /usr/local/bin
sudo mv -v ./sysinfo-slim /usr/local/bin

```

## Common tools for GUI
```bash
sudo apt install -y imagemagick
sudo apt install -y xdotool
```

## Setup browser in kiosk mode
```bash
sudo apt install -y chromium-browser
sudo apt install -y unclutter

# TODO: need o add more details
#add start-kiosk.sh into the ~/.config/autostart/autostart.sh
```

## Disable black screen

1. Install xcreensaver: ```sudo apt install -y xcreensaver```
2. Go to the screensaver settings and set the mode to "Disable Screen Saver"


