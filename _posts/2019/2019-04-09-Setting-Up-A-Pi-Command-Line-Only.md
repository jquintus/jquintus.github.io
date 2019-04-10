---
layout: post
disqus_identifier: #53
comments: true
categories: 
  - Pi
  - Raspberry Pi
---

1. Login (username: `pi` password: `raspberry`)
1. Run the wizard: `sudo raspi-config`
  1. Reset password (1)
  1. Set hostname  (2, N1)
  1. Setup Wifi (2, N2)
  1. Enable SSH (5, P2)
  1. Change timezone (4, I2)
1. (alternate method) [Connect to WiFI](https://www.raspberrypi.org/documentation/configuration/wireless/wireless-cli.md) 
    1. Edit the supplicant file:
        ```
sudo vi /etc/wpa_supplicant/wpa_supplicant.conf`
network={
    ssid="testing"
    psk="testingPassword"
}
        ```
    1. Reset the interface and test it 
        ```
wpa_cli -i wlan0 reconfigure
ifconfig wlan0
        ```
1. Fix keyboard layout
  1. `sudo vi /etc/defaults/keyboard`
  1. Set `XKBLAYOUT="us"`
  1. Reboot
  1. Verify by typing a `"`
1. Updates
```
sudo apt-get update
sudo apt-get upgrade
```
1. Install Softwares
```
sudo apt-get install vim screen tmux
sudo update-alternatives --config editor
```
1. [Install .Net](https://blogs.msdn.microsoft.com/david/2017/07/20/setting_up_raspian_and_dotnet_core_2_0_on_a_raspberry_pi/)
1. [Generate new SSH host keys](https://raspberrypi.stackexchange.com/questions/73039/how-to-generate-stronger-rsa-host-key-in-raspbian) (if you are using an image used by another Pi)
  1. `sudo ssh-keygen -b 4096 -h -f /etc/ssh/ssh_host_rsa_key`
