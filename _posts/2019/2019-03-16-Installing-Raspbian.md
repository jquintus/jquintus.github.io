---
layout: post
disqus_identifier: #48
comments: true
categories:
  - Pi
  - Raspberry Pi
---

After starting on my Raspberry Pi project, I realized that the Raspberry Pi 2
doesn't have onboard Bluetooth. I could either buy a Bluetooth dongle or
switch to a Raspberry Pi 3. And since I have a Raspberry Pi 3 in my drawer and
not a Bluetooth dongle, I decided to start over on my 3. So now I'm taking
notes on exactly what I need to do in order to get a Pi up and running.

1. Download the latest version of [Raspbian](https://www.raspberrypi.org/downloads/raspbian/). For this project I elected to have the version with a desktop. Estimated download time is about 10 minutes.
1. Install [etcher](https://www.balena.io/etcher/) from an admin shell with `cinst -y etcher`. Estimated downloaded time is about 2 minutes.
1. Open etcher. If it's not on your desktop, then hit the start button and type in `BalenaEtcher`
1. Pick the file you downloaded file from step 1, and flash it to an SD card.
1. Insert SD card into Pi and boot it up. The initial boot takes a little longer than normal.
1. Go through the onscreen Welcome Wizard
    1. Change the password (remember to write it down)
    1. Connect to WiFi.  This will also fix the date/time.
    1. Run system updates. This may take
    1. Reboot
1. Fix any [mouse lag issues](archive/2019/03/14/Fixing-Mouse-Lag-On-a-Raspberry-Pi/), if they exist
    1. `sudo vi /bot/cmdline.txt`
    1. Add ` usbhid.mousepoll=0` to the end of the line
    1. Reboot (this can be done while the Updates are being installed)
1. [Optional] Change the host name (this comes in handy if you have multiple Pis and are using RSA keys)
    1. `sudo vi /etc/hostname
    1. Reboot (this can be done while the Updates are being installed)
1. Enable SSH on the `Interfaces` pane of the `Raspberry Pi Configurator` (accessible from the Pi menu)
1. Copy public key to the Pi
    1. On the new Pi:  `mkdir .ssh`
    1. On the local machine:  `scp id_rsa.pub pi@pibuttons:.ssh/`
    1. On the new Pi:  `cat .ssh/id_rsa.pub >> .ssh/authorized_keys`

## Optional

1. Install vim
    1.  `sudo apt-get install vim`
    1. `sudo update-alternatives --config editor`
1. Install [screen](https://linux.die.net/man/1/screen)
    1.  `sudo apt-get install screen`
1. [Install VS Code](https://code.visualstudio.com/) - ([Full Article](https://code.headmelted.com))
    1. Install it
        ```bash
        sudo -s
        . <( wget -O - https://code.headmelted.com/installers/apt.sh )
        ```
    1. Uninstall it and install it again! As of this writintg there's a known issue with the current build.  The easiest workaround is to just install an older version.  The last command here tells the system not to upgrade VS Code when you ask it to upgrade other things.
        ```bash
        sudo apt-get remove code-oss
        sudo apt-get install code-oss=1.29.0-1539702286
        sudo apt-mark hold code-oss
1. Login to github
    1. Create a [personal access token](https://github.com/settings/tokens)
    1. Configure git with your name, email, and tell it to stop asking for passwords
        ```bash
        git config --global user.name "Josh Quintus"
        git config --global user.email "josh.quintus@gmail.com"
        git config --global credential.helper store
        ```
    1. Do a git push and use the access token as your password.  You can forget it from here on out.

## Back it up

Now that everything is set up just-so, it's worth creating a backup so that we don't have to do all of this ever again.

1. Install [Win32 Disk Imager](https://sourceforge.net/projects/win32diskimager/)
    ```cmd
    choco install -y win32diskimager.portable
    ```
1. Start up Disk Imager
    ```
    Win32DiskImager.exe %HomeDrive%\%HomePath%\Desktop\buttons.img
    ```
1. There will be two devices that you can pick in the dropdown.  Select the one that you can navigate to in Windows Explorer
1. Press the `Read` button
1. Wait
1. [Optional] Zip it up.   This took the file down from about 32GB (the size of the disk) to about 2GB

