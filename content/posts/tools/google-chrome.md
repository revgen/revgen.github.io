+++
title = "Google Chrome"
tags = ["tools", "apps"]
categories = ["tools"]
+++

[Google Chrome][wiki-chrome] is a freeware web browser developed by [Google][wiki-google].

## Installation

You can download the last version of Google Chrome [here][download-page].

### Installation from the command line on OS X
```bash
brew cask install google-chrome
```

### Installation from the command line on Ubuntu
```bash
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm -f google-chrome-stable_current_amd64.deb
```

### Installation from the command line on CentOS
```bash
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo yum localinstall google-chrome-stable_current_x86_64.rpm 
```


## Settings

### Google Chrome Application

* [Google Play Music](https://chrome.google.com/webstore/detail/google-play-music/fahmaaghhglfmonjliepjlchgpgfmobi)
* [VNC Viewer](https://chrome.google.com/webstore/detail/vnc%C2%AE-viewer-for-google-ch/iabmpiboiopbgfabjmgeedhcmjenhbla)
* [Pocket](https://chrome.google.com/webstore/detail/pocket/mjcnijlhddpbdemagnpefmlkjdagkogk)

### Google Chrome Extensions

* [Save to Pocket](https://chrome.google.com/webstore/detail/save-to-pocket/niloccemoadcdkdjlinkgdfekeahmflj)
* [Adblock Plus](https://chrome.google.com/webstore/detail/adblock/gighmmpiobklfepjocnamgkkbiglidom)
* [Session Buddy](https://chrome.google.com/webstore/detail/session-buddy/edacconmaakjimmfgnblocblbcdcpbko)
* [Screenshot](https://chrome.google.com/webstore/detail/screenshot-webpages/bdfnieppndfdhcgbmhfdlgdjegclkomk)
* [Status Bar](https://chrome.google.com/webstore/detail/status-bar/ojjdiklbbogaliiljdbpbkkkghendjja)
* [JSON Viewer](https://chrome.google.com/webstore/detail/json-viewer/gbmdgpbipfallnflgajpaliibnhdgobh)
* [Transmission Remote](https://chrome.google.com/webstore/detail/remote-transmission-%20%20/kfbocdnicmioodheiciijiegbmfoliim)
* [WhatRuns](https://chrome.google.com/webstore/detail/whatruns/cmkdbmfndkfgebldhnkbfhlneefdaaip)

## Hacks and Tweaks

### Export Chrome stored website passwords

1. Enable password import and export flag to show the export option.
- Open: chrome://flags/#password-import-export
- Select Enabled to turn the flag on.
- Click Relaunch to make this change take effect.
2. Open Chrome advanced settings.
- At the top right of Chrome, click More > Settings.
- Scroll down to the bottom, click Advanced to show more settings.
3. Find the Passwords and forms section, click the Manage password link.
4. Click the Export button to download all your password entries to your PC.
5. Type your current OS system password if asked.
6. Then specify the location where your passwords file will be saved.

After you are done, all credentials including the user name, the target URL, your user name and password will be written to. CSV file in plain-text. This will be stored without any encryption, so keep this file in a secure place or you can encrypt the file as needed.


[wiki-chrome]: https://en.wikipedia.org/wiki/Google_Chrome
[wiki-google]: https://en.wikipedia.org/wiki/Google
[download-page]: https://www.google.com/chrome/browser
