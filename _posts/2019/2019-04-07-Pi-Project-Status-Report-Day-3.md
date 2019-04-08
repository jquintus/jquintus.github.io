---
layout: post
disqus_identifier: #53
comments: true
categories:
  - Status Report
  - Pi Project
---

Day 3 was a bit of a loss.  I spent a few hours (to no avail) trying to figure
out what's wrong with my Pi Zeros.  I'm hoping the answer is secretly "nothing"
and that my HDMI cable is bad and I'm not configuring the wifi correctly. After
that I futzed with some reading about bluetooth and D-Bus. I think D-Bus may
not be what I need going forward.  Looking further into existing bluetooth
libraries for connecting as a keyboard.

To make sure I got progress on something, I spent the last hour and a half of
the day learning how to use a rotary encoder.  The basic principle is that
there are two contacts in quick succession that are connected and disconnected
for every notch you rotate the device knob.  If you track which contact was
connected first, then you know which direction it was turned.  The [source
code](https://github.com/jquintus/PiProject/blob/7802b940a5fb12dbffc6e1c692deea18a9d15a09/SimpleIO/SimpleRotary.py)
is pretty straight forward.

![encoder on a breadboard](/images/posts/2019/2019-04-07-Pi-Project-Status-Report-Day-3/demo2.jpg)

