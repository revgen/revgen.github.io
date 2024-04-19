---
title: Chromebook
tags: [device, settings]
date: 2021-02-01
archive: true
---

A [Chromebook](https://en.wikipedia.org/wiki/Chromebook) is a laptop or tablet running the Linux-based [Chrome OS](https://en.wikipedia.org/wiki/Chrome_OS) as its operating system.
<!--more-->

* [Install ChromeOS on PC](#install-chromeos-on-pc)
* [Chrome Apps](#chrome-apps)
* [Chrome Extensions](#chrome-extensions)
* [Note](#note)
* [Links](#links)

# Install ChromeOS on PC

You can't install Chrome OS on the PC because it is closed OS and restricted to use on Chromebook only but you can install [Chromium OS](https://www.chromium.org/chromium-os).

1. Download: [CloudReady - Home Edition](https://www.neverware.com/freedownload)
2. [Manual steps in MacOS](https://guide.neverware.com/build-installer/working-mac-os/)
3. [Installation Process](https://guide.neverware.com/install-and-setup/home-edition)

# Chrome Apps

* [Calculator](https://chrome.google.com/webstore/detail/calculator/joodangkbfjnajiiifokapkpmhfnpleo)
* [Google Keep](https://chrome.google.com/webstore/detail/google-keep-notes-and-lis/hmjkmjkepdijhoojdojkdfohbdgmmhki)
* [Google Play Music](https://chrome.google.com/webstore/detail/google-play-music/icppfcnhkcmnfdhfhphakoifcfokfdhg)
* [Youtube](https://chrome.google.com/webstore/detail/youtube/blpcfgokakmgnkcojhhkbfbldkacnbeo)
* [Camera](https://chrome.google.com/webstore/detail/camera/hfhhnacclhffhdffklopdkcgdhifgngh)
* [Google Translate](https://chrome.google.com/webstore/detail/google-translate/aapbdbdomjkkjkaonfhkkikfgjllcleb)
* [PaintZ](https://chrome.google.com/webstore/detail/paintz/gdjcnhanmagpjdpilaehedkchegnkdoj)
* [VLC](https://chrome.google.com/webstore/detail/vlc/obpdeolnggmbekmklghapmfpnfhpcndf)
* [Cog - System Info Viewer](https://chrome.google.com/webstore/detail/cog-system-info-viewer/difcjdggkffcfgcfconafogflmmaadco) - Display lots of useful hardware and network info
* [Secure Shell App](https://chrome.google.com/webstore/detail/secure-shell-app/pnhechapfaindjhompbnflcldabbghjo) - Google Secure Shell Developers

Need review:
* [Coding with Chrome](https://chrome.google.com/webstore/detail/coding-with-chrome/becloognjehhioodmnimnehjcibkloed)
* Visual Studio Code: https://code.headmelted.com/#chromeos-install-scripts

# Chrome Extensions
* [Adblock Plus](https://chrome.google.com/webstore/detail/adblock-plus-free-ad-bloc/cfhdojbkjhnklbpkdaibdccddilifddb)
* [Session Buddy](https://chrome.google.com/webstore/detail/session-buddy/edacconmaakjimmfgnblocblbcdcpbko)
* [Save to Pocket](https://chrome.google.com/webstore/detail/save-to-pocket/niloccemoadcdkdjlinkgdfekeahmflj)
* [Skype](https://chrome.google.com/webstore/detail/skype/lifbcibllhkdhoafpjfnlhfpfgnpldfl)
* Screenshots:
    - [Awesome Screenshot](https://chrome.google.com/webstore/detail/awesome-screenshot-screen/nlipoenfbbikpbjkfpfillcgkoblgpmj)
    - [Lightshot (screenshot tool)](https://chrome.google.com/webstore/detail/lightshot-screenshot-tool/mbniclmhobmnbdlbpiphghaielnnpgdp)


# Notes

## Hard reset (Powerwash)

* Method 1: Press ```Ctrl+Shift+Alt+R``` at the same time and you will rich powerwash menu where you can wipe your Chromebook.
* Method 2: Turn off your Chromebook. Next, press Esc + Refresh (F3 on Win Keyboard) on the keyboard and hold down the Power button.  Your Chromebook will boot straight to recovery mode.

## Enable Developer Mode

1. Power off
2. Start in recovery mode: Esc + Refresh (f3) + Power
3. Press Ctrl+D to enable/disable Development Mode
4. **Note: You need to press Ctrl+D every time in a boot mode to continue to use Development mode.**

## Disable Auto Update

> **WARNING: Do it if you really understand what you are doing. Disable Auto Update can make your system unstable and less secure.**

The only way to skip a flakey version of Chrome would be to prevent updates of ChromeOS itself ([source](https://www.quora.com/Is-it-possible-to-turn-off-updates-on-a-Chromebook)).

In developer mode, open a shell:
1. Ctrl+Alt+T
2. Start the shell with a command: ```shell```

Now you need to disable a root verification:
```bash
sudo /usr/share/vboot/bin/make_dev_ssd.sh --remove_rootfs_verification --partitions 2 
```
Then you can create the file ```/mnt/stateful_partition/etc/lsb-release``` with the specific 'fake' version:
```
sudo mkdir -p /mnt/stateful_partition/etc
echo "CHROMEOS_RELEASE_VERSION=9999.9999.9999.9999" | sudo tee /mnt/stateful_partition/etc/lsb-release
echo "GOOGLE_RELEASE=9999.9999.9999.9999" | sudo tee -a /mnt/stateful_partition/etc/lsb-release
```
This fools ChromeOS into believing that there are no new updates available.

```
sudo reboot
```

Realize: this will only work in developer mode.

When you want to reenable them, you have o leave developer mode, and agree to a scrub and reinstall of ChromeOS.

## Get system information
* [Check Available Storage](https://www.howtogeek.com/wp-content/uploads/2017/12/xcsi_1.png.pagespeed.gp+jp+jw+pj+ws+js+rj+rp+rw+ri+cp+md.ic.JTQ-p_7trD.png)
* [See Chromebook’s Hardware Specifications and System Information](https://www.howtogeek.com/234454/how-to-view-your-chromebooks-hardware-specifications-and-system-information/)
* Chrome Task Manager (Search+Esc or Win+Esc): Chrome -> Menu (⋮) -> More Tools -> Task Manager
* Open url in the Chrome: [chrome://system](chrome://system)

## Linux on Chromebook
* https://www.howtogeek.com/208368/how-to-run-a-full-linux-desktop-in-a-browser-tab-on-your-chromebook/
* https://chrx.org/
* https://wiki.galliumos.org/Welcome_to_the_GalliumOS_Wiki
* https://www.reddit.com/r/Ubuntu/comments/cb2bf1/thanks_for_saving_my_dell_chromebook/

## [Chromium OS Known Issues](https://guide.neverware.com/known-issues/)
* [Family Link doesn't work on Chromium OS](https://neverware.zendesk.com/hc/en-us/community/posts/360002553127-Family-Link-Support)

# Links

* Awesome Chromebook: https://github.com/UseWebPlatform/awesome-chromebook
* Chrome OS end-of-life database: https://support.google.com/chrome/a/answer/6220366?hl=en
* Chrome OS Releases blog: https://chromereleases.googleblog.com/search/label/Chrome%20OS
* Chrome OS Systems Supporting Android Apps: https://sites.google.com/a/chromium.org/dev/chromium-os/chrome-os-systems-supporting-android-apps
* Git on Chrome OS: https://www.techrepublic.com/article/how-to-use-github-in-chrome-os/
* Add Google Play Store: https://www.laptopmag.com/articles/get-android-apps-on-your-chromebook
* Useful Chrome OS Commands to run in Crosh: https://www.makeuseof.com/tag/terminal-commands-chromebook/, https://beebom.com/chrome-os-commands-run-crosh/

# Models

* [Dell Chromebook 11 P22t (3120) 2nd generation](https://www.dell.com/support/home/us/en/04/product-support/product/chromebook-11-3120) - 11.6" Intel Celeron N2840 4gb RAM 16gb
<!-- Dell P22t Screen: NT116WHM-N21 V4.0 (Replacement: https://www.youtube.com/watch?v=NO5B1qKCS7M) -->
