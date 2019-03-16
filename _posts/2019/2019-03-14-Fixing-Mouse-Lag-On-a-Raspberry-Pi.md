---
layout: post
disqus_identifier: #46
comments: true
categories:
  - DIY
  - Pi
  - Raspberry Pi
---

I'm starting to work on a project on a Raspberry Pi.  I'm starting
with a Pi 2 that already has an older version of the Pi os installed
on it (I don't even remember what one).

The first issue that I came across was that the [Amazon Basics
mouse](https://www.amazon.com/AmazonBasics-Wireless-Keyboard-Mouse-Combo/dp/B0787CVBWP/ref=sr_1_4?keywords=amazon+basics+mouse+and+keyboard&qid=1552618248&s=gateway&sr=8-4)
was too slugish.  After googling for a bit I came up with the
solution that I needed to make an edit to a config file (becuase of
course the first thing I needed to do was edit a config file because
Linux) and then reboot the system.

```bash
sudo vim /boot/cmdline.txt
sudo reboot
```

Append the following to the end of the line (separated from the last
entry with a space).

```
usbhid.mousepoll=0
```

