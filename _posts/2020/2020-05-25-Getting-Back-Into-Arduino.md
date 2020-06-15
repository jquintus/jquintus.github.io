---
layout: post
disqus_identifier: #65
comments: true
categories: 
  - Arduino
  - How-To
---

It's been a while since I've worked on my Arduino project to create a Bluetooth
keyboard. In that time I have been using my keyboard a little bit, but it needs
some work, ranging from small tweaks to major overhauls. This post is to remind
me how to do the small tweaks. Some of it will be very specific to my current
setup.

The first thing I'm remembering, and this sounds really dumb but I had to
relearn it, was that the Arduino needs to be `on`. I had assumed that merely
plugging it into my laptop would have been enough, but nope. Fully powered on.
Check. ✔

Now that the board is on, we can verify all of the settings in Arduino IDE,
including making sure the correct board is selected and the correct com port is
being used. For my setup `Adafruit Feather 32u4` and `COM3` are the expected
values.

**Select Board**

[![Select Board](/images/posts/2020/2020-05-25-Getting-Back-Into-Arduino/thumbnails/select_board.png)](/images/posts/2020/2020-05-25-Getting-Back-Into-Arduino/select_board.png)

**Select COM Port**

[![Select COM Port](/images/posts/2020/2020-05-25-Getting-Back-Into-Arduino/thumbnails/select_com_port.png)](/images/posts/2020/2020-05-25-Getting-Back-Into-Arduino/select_com_port.png)


Now that the board is connected, to view debug output while it's running you
can open up the Serial Monitor with `Ctrl-Shift-M`.

My board has an guid of `d7:63:b2:85:c4:24`

