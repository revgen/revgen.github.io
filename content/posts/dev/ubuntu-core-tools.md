+++
title = "Core tools for Ubuntu Workstation/Server"
tags = [ "linux", "tools" ]
categories = [ "settings" ]
+++

There is a list of core tools/scripts which I use on the Development server under the [Ubuntu](https://ubuntu.com).
<!--more-->

## Core tools for a remote development server
1. Install tools
```bash
sudo apt purge vim
sudo apt install -y neovim
sudo apt install -y git jq curl wget
sudo apt install -y htop screen mc htop elinks
sudo apt install -y python3-pip
```
2. Add useful scripts
```bash
wget -O session "https://raw.githubusercontent.com/revgen/myenv/master/home/.local/bin/session"
chmod +x session
sudo mv session /usr/local/bin/
```
3. [Add 2FA for SSH connection](https://revgen.github.io/posts/dev/ssh-with-2fa/)


## Install nginx

1. Install nginx: ```sudo apt install -y nginx```
2. Secure Nginx with SSL: https://revgen.github.io/posts/dev/nginx-with-letsencrypt/


## Setup [Uncomplicated Firewall](https://wiki.ubuntu.com/UncomplicatedFirewall)
```bash
sudo apt install -y ufw

sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
sudo ufw allow out 53,113,123/udp

sudo ufw enable
sudo ufw status
```

## Install docker
```bash
sudo apt install -y docker.io
sudo usermod -a -G docker ${USER}
```

## Install Node.js v14+
```bash
curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
sudo apt -y install nodejs
```

## Install aws-cli v2+
```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -r awscliv2.zip ./aws
```

## Additional tools
```bash
sudo apt install -y ncdu tree dialog
sudo apt install -y dos2unix p7zip-full
sudo apt install -y net-tools msmtp
sudo apt install -y imagemagick ffmpeg id3v2
```

