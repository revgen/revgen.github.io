---
title: Windows Tools
tags: [tool, windows, workspace]
date: 2024-07-16
---

## List of [winget](../winget) packages for daily usage

<!--more-->

| Application              | Command                                         |
| ------------------------ | ----------------------------------------------- |
| [notepad3](https://rizonesoft.com/downloads/notepad3/) | ```winget install -e --id Rizonesoft.Notepad3``` |
| [git](https://git-scm.com/) | ```winget install -e --id Git.Git``` |
| [vlc](https://www.videolan.org/) | ```winget install -e --id VideoLAN.VLC``` |
| [python 3.11](https://www.python.org/) | ```winget install -e --id Python.Python.3.11``` |
| [Google Chrome](https://www.google.com/chrome/) | ```winget install -e --id Google.Chrome``` |
| [7-zip](https://www.7-zip.org/) | ```winget install -e --id 7zip.7zip``` |
| [SumatraPDF](https://www.sumatrapdfreader.org/free-pdf-reader) | ```winget install -e --id SumatraPDF.SumatraPDF``` |
| [Speedtest - Ookla](https://www.speedtest.net/apps/desktop) | ```winget install -e --id Ookla.Speedtest.Desktop``` |
| [KeePassXC](https://keepassxc.org/) | ```winget install -e --id KeePassXCTeam.KeePassXC``` |
| [Microsoft PowerToys](https://learn.microsoft.com/en-us/windows/powertoys/) | ```winget install -e --id Microsoft.Powertoys``` |
| [SomaFM](https://somafm.com/) | ```winget install -e --id somafm``` |
| [Putty](https://www.putty.org/) | ```winget install -e --id PuTTY.PuTTY``` |
| [TreeSize](https://www.jam-software.com/treesize_free) | ```winget install -e --id JAMSoftware.TreeSize.Free``` |
| [HWiNFO](https://www.hwinfo.com/) | ```winget install -e --id=REALiX.HWiNFO``` |
| [Microsoft .NET 6](https://dotnet.microsoft.com/en-us/download/dotnet/6.0) | ```winget install -e --id=Microsoft.DotNet.SDK.6``` |
| [Microsoft Visual Studio Code](https://code.visualstudio.com/) | ```winget install -e --id Microsoft.VisualStudioCode``` |
| [GOG Galaxy](https://www.gog.com/galaxy) | ```winget install -e --id GOG.Galaxy``` |
| [Steam](https://store.steampowered.com/) | ```winget install -e --id Valve.Steam``` |

## Other useful application/tools

### Add telnet client

```powershell
DISM /online /Enable-Feature /FeatureName:TelnetClient
```

### Add IIS

Internet Information Services ([IIS](https://www.iis.net/)) for Windows® Server is a flexible, secure and manageable Web server for hosting anything on the Web.

```powershell
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole, IIS-WebServer, IIS-CommonHttpFeatures, IIS-ManagementConsole, IIS-HttpErrors, IIS-HttpRedirect, IIS-WindowsAuthentication, IIS-StaticContent, IIS-DefaultDocument, IIS-HttpCompressionStatic, IIS-DirectoryBrowsing
```

## Winget documentation and installation

You can find a documentation for winget and how to install/upgrade it [here](./winget).

## Powershell

* [Powershell One-liners commands](https://fishilico.github.io/generic-config/windows/oneliners-commands.html#basic-powershell-commands)