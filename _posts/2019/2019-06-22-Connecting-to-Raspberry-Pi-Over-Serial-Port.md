---
layout: post
disqus_identifier: #62
comments: true
categories: 
  - Raspberry Pi
  - Pi
  - Serial
  - UART
---

I followed a mix of instructions, including
[Adafruit](https://learn.adafruit.com/adafruits-raspberry-pi-lesson-5-using-a-console-cable/software-installation-windows),
and
[ElectronicWings](https://www.electronicwings.com/raspberry-pi/raspberry-pi-uart-communication-using-python-and-c)
to start playing with talking to and from my Raspberry Pi over a serial
connection from my Windows Surface.  I used a [TTL
cable](https://www.adafruit.com/product/954?gclid=CNCnx9eu0r0CFcpfpQodtHMAUQ)
from Adafruit.

Following are instructions for setting up communication between a Raspberry Pi
3 (not a zero) and a Windows laptop.

## Setting up the Pi

First thing to do on the Pi is to turn of shell login via serial port.

1. `sudo raspi-config`
2. Select "Interfacing Options"
3. Select "Serial"
4. When asked "Would you like a login shell to be accessible over serial?" select `no`
5. When asked "Would you like the serial port hardware to be enabled?" select `yes`
6. Reboot the device

Next is to connect the cable to my Pi.  My Pi was powered by USB already, so I
didn't connect the red (5v) wire to the Pi.  Just hook up the wires up as
follows, (or see the picture below).

* Black -> Ground
* White -> TXD
* Green -> RXD

[![Wiring the Pi](/images/posts/2019/2019-06-22-Connecting-to-Raspberry-Pi-Over-Serial-Port/wiring-pi.jpg)](/images/posts/2019/2019-06-22-Connecting-to-Raspberry-Pi-Over-Serial-Port/wiring-pi.jpg)


## Setting up the Windows Laptop

First step is to install the drivers on my laptop for the cable.  I had the
older version of the cable, so I needed the [Prolific
Drivers](http://www.prolific.com.tw/UserFiles/files/PL2303_Prolific_DriverInstaller_v1200.zip).
There's also a link to this from the Adafruit tutorial.

Now once the the USB cable is plugged into the laptop it will show up as a new
COM port.  To figure out which one it is either find it in the Device Manager
or use the `mode` command.

[![Device Manager](/images/posts/2019/2019-06-22-Connecting-to-Raspberry-Pi-Over-Serial-Port/Device-Manager_small.png)](/images/posts/2019/2019-06-22-Connecting-to-Raspberry-Pi-Over-Serial-Port/Device-Manager.png)

```bash
>mode

Status for device COM5:
-----------------------
    Baud:            9600
    Parity:          None
    Data Bits:       8
    Stop Bits:       1
    Timeout:         OFF
    XON/XOFF:        ON
    CTS handshaking: OFF
    DSR handshaking: OFF
    DSR sensitivity: OFF
    DTR circuit:     ON
    RTS circuit:     ON


Status for device CON:
----------------------
    Lines:          32766
    Columns:        112
    Keyboard rate:  31
    Keyboard delay: 1
    Code page:      437
```

Notice that the `mode` command will also conveniently print out the baud rate
(you'll need this in the next step).  This information is also available from
device manager too by going in to the port's properties.

Open up the serial port in PuTTY, using the COM5 port found above.

[![PuTTY](/images/posts/2019/2019-06-22-Connecting-to-Raspberry-Pi-Over-Serial-Port/putty_small.png)](/images/posts/2019/2019-06-22-Connecting-to-Raspberry-Pi-Over-Serial-Port/putty.png)

## Connecting

Back on the Pi find the correct serial port. As I understand it (which is 90%
likely to be wrong), on the Raspberry Pi 3, the UART port is going to be
`ttyS0` and the Bluetooth port (also serial) will be `ttyAMA0`.  `ls -l /dev`
will give you information about the ports.

```bash
$ ls -l /dev/serial*
lrwxrwxrwx 1 root root 5 Jun 22 15:12 /dev/serial0 -> ttyS0
lrwxrwxrwx 1 root root 7 Jun 22 15:12 /dev/serial1 -> ttyAMA0
```

From here echoing out a string in the Pi to `/dev/serial0` will have it show up
in PuTTY.

```bash
$ echo "hello world" > /dev/serial0
```

[![PuTTY](/images/posts/2019/2019-06-22-Connecting-to-Raspberry-Pi-Over-Serial-Port/hello_world.gif)](/images/posts/2019/2019-06-22-Connecting-to-Raspberry-Pi-Over-Serial-Port/hello_world.gif)
