---
title: Windows Tool - winget
tags: [tool, window]
date: 2024-05-08
---

Windows Package Manager [winget](https://learn.microsoft.com/en-us/windows/package-manager/winget/) command-line tool is 
available on Windows 11 and modern versions of Windows 10 as a part of the App Installer.

<!--more-->

This tool is the client interface to the Windows Package Manager service.

You can use use this tool to install different applications from the terminal.

![winget tool screenshot](../files/winget-preview-001.png)

## Installation

### Option 1

Use Microsoft Store: [App Installer](https://apps.microsoft.com/detail/9nblggh4nns1?rtc=1&hl=en-us&gl=US)

### Option 2

Download from the GitHub [winget-cli release page](https://github.com/microsoft/winget-cli/releases)

### Option 3

1. Open PowerShell (Administrator mode): ```Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe```
2. Lets try to execute ```winget```. If you can see a normal output, then you are ready to use **winget**
3. If winger is not found after installation:
  - Lets find a Winget directory: ```dir C:\Program Files\WindowsApps\Microsoft.Winget.Source*```
  - Lets register a package: ```Add-AppxPackage -DisableDevelopmentMode -Register "C:\Program Files\WindowsApps\Microsoft.Winget.Source_2021.718.1322.843_neutral__8wekyb3d8bbwe\AppXManifest.xml" -Verbose```
  - NOTE: you need to use your directory name instead of "Microsoft.Winget.Source_2021.718.1322.843_neutral__8wekyb3d8bbwe"

## Usage

| Command | Description |
| ------- | ----------- |
| search  | Searches for an application. |
| install | Installs the specified application. |
| show    | Displays details for the specified application. |
| ....    | Other [winget commands](https://learn.microsoft.com/en-us/windows/package-manager/winget/#commands) |

## Links

* [winget.run - search packages](https://winget.run/)
* [winstall.app - search packages](https://winstall.app/apps)
* [Use the winget tool to install and manage applications](https://learn.microsoft.com/en-us/windows/package-manager/winget/)
* [How to Fix Winget Is Not Recognized on Windows](https://www.maketecheasier.com/fix-winget-not-recognized-windows/)
* [Github - WinGet is the Windows Package Manager](https://github.com/microsoft/winget-cli)
