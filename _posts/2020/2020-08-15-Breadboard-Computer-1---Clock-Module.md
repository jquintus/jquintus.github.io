---
layout: post
disqus_identifier: #71
comments: true
categories: 
  - ben eater
  - breadboard
  - 8-bit computer
  - clock
---

I recently picked up [Ben Eater's 8-bit computer kit](https://eater.net/8bit).  The entire walkthrough for Ben's computer can be found on [youtube](https://www.youtube.com/playlist?list=PLowKtXNTBypGqImE405J2565dvjafglHU).  The idea is to build a fully funtioning 8-bit computer entirely on a breadboard. This should be a great learning experience for me considering I've never built anything particularly complicated in electronics. The first step is to create the clock module that powers the rest of the computer. The clock he's designed has some interesting features
 
  1. Speed control using a potentiometer
  1. Step through mode - the clock advances when you manually press a button
  1. A circuit to switch between these two modes

This is step 1 of the clock module, the variable speed portion.  It uses a 555 timer to produce the square wave that powers the LED.  That LED is eventually going to be removed from the board when the entire module is done, which is why it hasn't been cut down.  

<iframe width="560" height="315" src="https://www.youtube.com/embed/https://2glSRK5Siw0" frameborder="0" allowfullscreen></iframe>

The clock kit comes with pre-cut jumper wires that you can use. The drawback to them is that you can't control the color for each lenght of wire. So I dug into the second kit to pull out the spools of 25 foot colored wires. I figure if I start with those wires now then the color coding will be consitent for the entire project. Not only that, but the red wires will be the same shade for the entire time.

That said, my biggest difficulty so far has been gettin' gud at trimming the breadboard wires. Ben's computer winds up being very neat and orderly with the wires. I'm hoping to get something close to that.
