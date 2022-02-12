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

## Add admin user

```bash
sudo adduser --shell /bin/bash admin
sudo usermod -aG sudo,adm,dialout,users admin
sudo chmod 0700 /home/admin/
```

Login with **admin** user and check that it has admin right and sudo is working.
```bash
# remove sudo from pi user
sudo deluser pi sudo
sudo deluser pi adm
sudo deluser pi lpadmin
```

## Common tools

```bash
sudo apt install -y vim-tiny 
sudo ln -vs /usr/bin/vim.tiny /usr/bin/vim

sudo apt install -y mc htop
sudo apt install -y wget jq
sudo apt install -y curl
# sudo apt install -y wicd-curses   - good to to setup WiFi if you don't have an UI



wget https://raw.githubusercontent.com/revgen/myenv/master/home/.local/bin/session
wget https://raw.githubusercontent.com/revgen/myenv/master/home/.local/bin/localip
wget https://raw.githubusercontent.com/revgen/myenv/master/home/.local/bin/sysinfo
wget https://raw.githubusercontent.com/revgen/myenv/master/extra/tools/write-on-wallpaper
chmod +x ./session ./localip ./sysinfo ./write-on-wallpaper
sudo mv -v ./localip /usr/local/bin
sudo mv -v ./session /usr/local/bin
sudo mv -v ./sysinfo /usr/local/bin
sudo mv -v ./write-on-wallpaper /usr/local/bin
```

## Common tools for GUI
```bash
sudo apt install -y imagemagick
sudo apt install -y xdotool zenity
sudo apt install -y xcreensaver
```

## Setup browser in kiosk mode
```bash
# setup local http server (TODO: switch to lighttpd)
sudo apt install -y nginx

# install browser
sudo apt install -y chromium-browser
sudo apt install -y unclutter

# TODO: need o add more details
#add start-kiosk.sh into the ~/.config/autostart/autostart.sh

sudo vim /etc/nginx/sites-available/default
# Add/Updte lines for the main server section
# location / {
#    proxy_pass https://server-with-the-dashboard/;
# }
sudo systemctl reload nginx
```

## Disable black screen

1. Install xcreensaver: ```sudo apt install -y xscreensaver```
2. Go to the screensaver settings and set the mode to "Disable Screen Saver"


