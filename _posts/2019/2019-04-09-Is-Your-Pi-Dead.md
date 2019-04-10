---
layout: post
disqus_identifier: #
comments: true
categories: 
  - Pi
  - Raspberry Pi
  - Pi Zero 
---

I recently [bought a Raspberry Pi Zero
W](https://www.adafruit.com/product/3400).  I immediately had problems using
it.  Here are a couple of useful (and useless) things I tried.  Adafruit has a
great
[tutorial](https://learn.adafruit.com/raspberry-pi-zero-creation/is-my-pi-zero-dead)
on what to do when you think your pi is dead as well.

First I bought another one (they are so cheap) just in case the first was DOA.
No dice.  Then I tried buying a USB adapter for my mouse and keyboard hoping
that it only boots to video if there are input devices (long shot I know, but I
was going to need the adapter anyway).  Nope.  Then I tried dropping an empty
file named SSH into my boot directory on the SD card and enabling WiFi through
a
[wpa_supplicant.conf](https://www.raspberrypi-spy.co.uk/2017/04/manually-setting-up-pi-wifi-using-wpa_supplicant-conf/)
file. I still couldn't ping the device, let alone SSH in.  After that failed I
tried using [PiBakery](https://www.pibakery.org/) to create a new image that
had everything baked in.  It really wasn't much different than what I had done.
I bought a new SD card hoping it was a compatibility issue.  Again, I knew I
was going to need one anyway, but it didn't help.

I was able to verify that it did in fact work by taking out the SD card and
plugging it directly into my PC via the USB port (not the charge port, but the
port on the left for peripherals). It showed up under Device Manager as
`BCM2708 Boot`.  At least I knew it wasn't full dead yet.

In the end, the issue was that I was trying to connect to my 5GHz network (Pi
Zero W's don't support that) and that my HDMI cable was busted.  The network
issue was much easier to diagnose once I had a monitor plugged in.
