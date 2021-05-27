+++
title = "Linux startup message"
tags = [ "lunux", "cli" ]
categories = [ "settings" ]
draft = true
+++

## Change pre-login message in the Linux terminal

You need to edit [```/etc/issue```](https://man7.org/linux/man-pages/man5/issue.5.html) file to change a pre-login messages in the Linux Terminal
```bash
sudo cp /etc/issue /etc/issue.orig
```
Character sequences to display various information ([source](http://www.linuxfromscratch.org/blfs/view/svn/postlfs/logon.html))
* **\d** - Insert the current date
* **\t** - Insert the current time
* **\n** - Insert the hostname
* **\l** - Insert the name of the current tty line
* **\m** - Insert the architecture identifier of the machine, e.g., i686
* **\4** - Insert the machine's IPv4 address ([CentOS and Debian](https://serverfault.com/a/825582))

Example file:
```
[\l] Ubuntu 20.04.2 LTS \m
hostname  : \n
address   : \4
```

## Change pre-login message in the SSH
