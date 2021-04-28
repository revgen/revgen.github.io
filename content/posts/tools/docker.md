+++
title = "Docker"
tags = ["container", "apps"]
categories = ["tools"]
+++


[Docker](https://www.docker.com/) is a set of platform as a service products that uses OS-level virtualization to deliver software in packages called containers.
<!--more-->

* [Install](#install)
* [Command-line](#command-line)
* [Links](#links)

## Install

### Install on Ubuntu/Debian
```bash
# Install docker to the system
sudo apt install docker.io

# Setup autostart for service and start it
sudo systemctl start docker
sudo systemctl enable docker

# Add current user to the docker group"
sudo usermod -aG docker $USER
```

## Command line

### Download docker image
```bash
docker pull <image name>
```

### Create "my-image" docker image from the current directory
```bash
build -t my-image .
```

### Run container from an image
```bash
docker run <image name>
# run as a service
docker run -d -p 8080:80 --restart=always --name nginx-dev nginx
```

### Remove container
```bash
docker rm <container name>
```

### Remove image
```bash
docker rmi <image name or id>
```

### Open shell with the specoific container
```bash
docker exec -it --name ubuntu bash
```

### Show all running containers
```bash
docker ps
# all containers
docker ps --all
# show id only
docker ps --quiet
```

### Remove unused containers
```bash
docker rm $(docker ps -q -f 'status=exited')
```

### Remove unused image
```bash
docker rmi -f $(docker images -f "dangling=true" -q)
```

### Remove orphaned volumes
```bash
docker volume rm $(docker volume ls -qf dangling=true)
```

### Clean up stuff (using these [instructions](https://lebkowski.name/docker-volumes/))
```bash
echo "Cleaning up old containers..."
docker ps --filter status=dead --filter status=exited -aq | xargs docker rm -v 2>&1 | cat;
echo "Cleaning up old volumes..."
docker volume ls -qf dangling=true | xargs docker volume rm 2>&1 | cat;
```

### Show disk usage by docker images and containers
```bash
docker system df
docker system df --verbose
```

### Show console GUI - dockly: ```npm install -g dockly```
```bash
dockly
```


## Links

* [Awesome Docker](https://github.com/veggiemonk/awesome-docker)
* Chrome App Store: [Simple Docker UI](https://chrome.google.com/webstore/detail/simple-docker-ui/jfaelnolkgonnjdlkfokjadedkacbnib)
