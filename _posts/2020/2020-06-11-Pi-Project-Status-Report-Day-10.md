---
layout: post
disqus_identifier: #67
comments: true
categories: 
  - Status Report
  - Pi Project
  - Arduino
  - Feather
  - C++
  - Zoom
---

With all of the Zoom meetings and working from home, I decided to tackle the task of configuring my buttons project to be able to control Zoom. The big things I wanted were:

1. Start a new Zoom meeting
1. Mute/unmute
1. Enable/disable video
1. Close my Zoom meeting (I hate fumbling with the UI and clicking multiple buttons on the screen to get out of a meeting)
1. Share screen

Zoom has a [list of shortcuts on their site](https://support.zoom.us/hc/en-us/articles/205683899-Hot-Keys-and-Keyboard-Shortcuts-for-Zoom). Most of what I want are easy key combos. For example, starting a meeting is `command + control + v`. Some of them were a bit more complicated though. Closing a Zoom meeting or sharing a screen both have shortcuts, but the shortcuts bring up a dialog box. Having to click more buttons on my keyboard or with mouse defeats the purpose of dedicated hardware buttons. Luckily, both of those situations have pretty standard flows. Closing a Zoom maps to `command + w` followed by `enter`. Sharing maps to `command + shift + s` then `right arrow` and then finally `enter`. 

## Refactor

Basically I need to be able to support chords. This will take a refactor. As it
stood, the code just had a giant switch block (really lots of `if`'s) that
figured out which key set to send. Now I need to be able to send multiple keys
per button press. It's high time I create a command class. For lack of a better
name, I'll call it `QuinCommand`. It can take up to five different key
combinations that it will play out in order. (get it? "quin"... okay so it's my
name too. It works on multiple levels.) It will need to be able to send out
Bluetooth commands, so we'll need to abstract that out to a dedicated class
too. Sticking with my theme of picking bad names, that'll be called `Blue`.
This cleans up a lot of my main file. All that that's left is to pull out all
of the constants that define the specific key combos and comments that describe
them and where to get more info on creating more. That was a lot of code that
gets moved to `CommandsConstants` (probably the best name of the bunch...).

With all of this cleanup done a couple of things stood out at me. First,
there's still a lot of boilerplate code that I'm no longer using. Delete it.
Second, there's a whole sub-folder of code kicking around that was copy and
pasted of this project. It confuses me whenever I open up the project. Delete
that too.

Much better.

## Relearning C++

It's been ~20 years since I've seriously written any C++. And that was high
school. So this entire refactor took a lot of googling. How to make classes,
how to define a header file in such a way that you can `include` it multiple
times. How to handle arrays or strings. That last bit kicked my ass quite a
bit. I'd like to say I researched and figured out the right way to do things.
But no, I just stack overflowed (the site) for a bit tried a bunch of things
until something worked. I'm 💯 percent sure that it's not the best answer. I'm
trying to send constant length constant strings around, there has to be a way
to do that without resorting to a `memcpy`. At the end of the day (and it
really was the _end of the day_ when I was working on this -- I was tired) I
went with a cludge that worked.

## Wrapping up

I'd like to change the commanding architecture to be based off of an interface
(or an abstract class with all virtual methods... cuz C++) and have completely
custom logic for what happens when each command is invoked. It'd also be nice
to wrap the command in a button class that tracks the state of the button press
and handles whether or not to resend a command if I haven't taken my finger off
the button yet. Realistically, that's probably not going to happen for a long
while. The box works well enough for now and I have a couple of [new
boards](https://www.adafruit.com/product/4062) on order that run python. So
it's likely that I'll be porting this over to that, which should have a faster
development feedback loop for me.

Writing all of this C++ really made me miss the simplicity of C#. 

Here's the [code](https://github.com/jquintus/PiProject/pull/16) for this post.
