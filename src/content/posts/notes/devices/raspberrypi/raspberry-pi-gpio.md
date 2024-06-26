---
title: GPIO on Raspbery Pi
tags: [device, raspberrypi]
date: 2019-11-01
---

A powerful feature of the Raspberry Pi is the row of GPIO (general-purpose input/output) pins along the top edge of the board. A 40-pin GPIO header is found on all current Raspberry Pi boards.
<!--more-->

You can find a schema with all pins:
* [raspberry-pi-pins-schema.png](../raspberry-pi-pins.png)
* [PinOut: interactive schema](https://pinout.xyz/pinout/ground)


## Tools for GPIO on Raspberry Pi:
* Python library **RPi.GPIO**: ```sudo apt-get install python3-rpi.gpio``` or ```python-rpi.gpio```
* Python library **[gpiozero](https://gpiozero.readthedocs.io/en/stable/recipes.html)**: ```sudo apt-get install python3-gpiozero``` or ```python-gpiozero```
* Console tool **[gpio](http://wiringpi.com/the-gpio-utility/)**: ```sudo apt-get install wiringpi```

## Links
* GPIO: [link 1](https://raspberrypihq.com/making-a-led-blink-using-the-raspberry-pi-and-python/), [link 2](http://raspberry.io/projects/view/reading-and-writing-from-gpio-ports-from-python/), [link 3](https://www.raspberrypi.org/forums/viewtopic.php?t=101598), [link 4](https://www.freecodecamp.org/news/hello-gpio-blinking-led-using-raspberry-pi-zero-wh-65af81718c14/)
