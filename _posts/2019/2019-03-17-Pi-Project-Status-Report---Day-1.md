---
layout: post
disqus_identifier: #50
comments: true
categories:
  - Status Report
  - Pi Project
---

I've made some interesting progress in my current poject with my Raspberry Pi.

After following a [walkthrough](http://yetanotherpointlesstechblog.blogspot.com/2016/04/emulating-bluetooth-keyboard-with.html),
I was able to connect my Pi to my Windows laptop as if it were a Bluetooth
keyboard and forward all keystokes from the Pi's keyboard to my laptop.  In
fact, I'm writing this status report on with my Pi's keyboard on my laptop. 

The only issue with the walkthrough is that it's missing one dependency, before
getting started python-gtk2 needs to be installed:

```bash
sudo apt install python-gtk2
```

I've made a
[copy](https://github.com/jquintus/PiProject/tree/master/btkeyboard) of the
sample code in my own repo so I can start to play with it.

Next up is to go through the [follow up
post](http://yetanotherpointlesstechblog.blogspot.com/2016/11/gpio-client-for-raspberry-pi-bluetooth.html)
and move leverage GPIO (buttons!)
