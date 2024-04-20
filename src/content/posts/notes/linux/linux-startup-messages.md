---
title: Linux startup message
tags: [ linux, cli, settings ]
date: 2020-01-01
layout: single
---

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
* **\4** - Insert the machine's IPv4 address ([CentOS and Debian](https://serverfault.com/a/825582))

Example:

```bash
# cat /etc/issue
[\l] Ubuntu 20.04.2 LTS
hostname  : \n
address   : \4

# output
[tty1] Ubuntu 20.04.2 LTS
hostname: 192.168.15.27
address : websrv1
```


## Change pre-login message in the SSH
