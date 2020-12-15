+++
title = "Docker"
tags = ["tools", "python", "scripts", "ruby", "node.js", "cli"]
categories = ["tools"]
+++

Commands which you can use to start HTTP static server in your current (or specified) directory, available at http://localhost:8080.

You can find an original extended list of the commands on the [willurd's gists](https://gist.github.com/willurd/5720255) and on [Reddit](https://www.reddit.com/r/webdev/comments/1fs45z/list_of_ad_hoc_http_server_oneliners/).

> DISCLAIMING: All solutions provided below are only for tests or for local development, do not use it in the production environment or environment which can be reached from the public Internet.

## Python

```bash
# Python 2.x
python -m SimpleHTTPServer 8080

# Python 3.x
python3 -m http.server 8080
```

## Ruby

```bash
# Ruby 1.9.2+
ruby -run -ehttpd . -p8080
```

## Node.js

### Package: [http-server](https://www.npmjs.com/package/http-server)

```bash
# Install dependency fist
npm install -g http-server

# Start http server
http-server -p 8080
```
> Note: ```index.html``` will be served as the default file to any directory requests.

## [Busybox](https://openwrt.org/docs/guide-user/services/webserver/http.httpd)

```bash
busybox httpd -f -p 8080
```


