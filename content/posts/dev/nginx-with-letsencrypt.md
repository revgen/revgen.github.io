+++
title = "Secure Nginx with Let's Encrypt on Ubuntu 20.04"
tags = [ "nginx", "security" ]
categories = [ "settings" ]
+++

There are steps to add a free SSL certificate from Let’s Encrypt to your Nginx server.

## Install certbot
```bash
sudo apt install certbot python3-certbot-nginx
```

## Update nginx server_name
```bash
sudo vim /etc/nginx/sites-available/default
# search server_name and update it with your full domain name, example: dev1.example.com dev2.example.com
```

## Check nginx configuration and reload it
```bash
sudo nginx -t && sudo systemctl reload nginx
```

## Obtaining an SSL certificate first time
```bash
sudo certbot --nginx -d dev1.example.com -d dev2.example.com
```

## Verifying Certbot Auto-Renewal settings
```bash
sudo systemctl status certbot.timer
```
To make a manual test:
```bash
sudo certbot renew --dry-run
```

## Links

* https://letsencrypt.org/
* https://www.nginx.com/
* https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-20-04
