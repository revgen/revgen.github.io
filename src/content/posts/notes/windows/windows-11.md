---
title: Windows 11
tags: [tool, window]
date: 2024-07-16
---

## Windows 11 Setup - Bypass TPM & Secureboot

1. Start the Windows 11 installation until you see "This PC can't run Windows 11."
2. Open command prompt: ```Shift+F10```
3. Run ```regedit```
3. Import [windows11-bypass-tpm-check-and-secure-boot.reg](../files/windows11-bypass-tpm-check-and-secure-boot.reg) file

## Force Windows 10+ to use UTC when dealing with BIOS clock

1. Open ```regedit``` with Administrator rights
2. Go to the ```HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation``` registry key
3. Create new DWORD (32-bit) Value, name it ```RealTimeIsUniversal```.
4. Set its value to ```1```.

You can download a [reg](../files/windows-use-utc.reg) file and import it.

## How to Activate Windows from the Command Line

1. Open Powershell with Administrator rights
2. Excute commands:
    1. ```slmgr /ipk AAAAA-BBBBB-CCCCC-DDDDD-EEEEE```
    2. ```slmgr /skms kms8.msguides.com```
    3. ```slmgr /ato```
