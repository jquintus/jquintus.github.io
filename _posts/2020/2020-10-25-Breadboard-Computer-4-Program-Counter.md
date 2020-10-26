---
layout: post
disqus_identifier: #
comments: true
categories: 
  - ben eater
  - breadboard
  - 8-bit computer
---

<iframe width="560" height="315" src="https://www.youtube.com/embed/ocdJQwo5EgQ" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

After the registers and the ALU, the program counter module was pretty easy. It is a 74LS161 4-bit binary counter connected to a 74LS245 8-bit transceiver. As with the other modules, the transceiver is only there to easily control reading or writing to the bus. 

Using a binary counter IC to build a program counter may seem like cheating, but there's no reason to make everything harder than it needs to be. The counter's output and input are wired to the transceiver, the enabled pin is put high, connect the clock, and you're good to go... 

Well, that's what the instructions said. Whenever I tried to run the counter it kept flashing "one". After a few seconds of feeling crushingly defeated on what was supposed to be the easiest build of the project, I thought it felt like the counter was being constantly reset. I looked at the chip's data sheet and saw that pin 1 is the clear pin. We hadn't wired it to anything so it was floating. The pin is inverted, so I tried tying it high. Lo and behold, the counter now works.

I still need to wire up some permanent lights for the module. The ones in the video are part of the pack of lights I wired up for quick testing last time (or the time before that... sometime). They have resistors built in and just have a pair of pin Dupont connectors on the bottom so I can easily plug them in anywhere I want. 
