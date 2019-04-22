---
layout: post
disqus_identifier: #57
comments: true
categories: 
  - Status Report
  - Pi Project
---


I didn't have a whole lot of time this weekend, but I did make some great
progress. I wrote a quick
[Flask](https://github.com/jquintus/PiProject/blob/status5/piboard/server/server.py)
service that used a
[github](https://github.com/Paradoxis/Windows-Sound-Manager) project I found to
control the volume. After a quick update to the
[piboard](https://github.com/jquintus/PiProject/blob/status5/piboard/client/volumeBoard.py#L35)
to connect to my Windows laptop. A quick restart of the Pi and it actually
worked!

<iframe width="560" height="315" src="https://www.youtube.com/embed/QKAKnrbKhjA" frameborder="0" allowfullscreen></iframe>

Here's all the code on
[github](https://github.com/jquintus/PiProject/tree/status5) as of this
posting.
