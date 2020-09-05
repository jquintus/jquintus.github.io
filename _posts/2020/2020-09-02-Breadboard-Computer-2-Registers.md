---
layout: post
comments: true
categories: 
  - ben eater
  - breadboard
  - 8-bit computer
  - registers
---

<iframe width="560" height="315" src="https://www.youtube.com/embed/z6KrBrTW85M" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

I've finished the registers for y project of building an 8-bit computer using TTL chips. I have built two general purpose registers (an "A register" and a "B register) as well as the instructor register for the computer. This step took a lot more time than the clock module. The main difficulties were cutting the wires to the correct size and then after that the thing just didn't work. I couldn't store or transfer any data.

# What is a Register?

So what exactly did I build in the past few weeks? The computer I'm working on will have a certain amount of RAM to store information during the execution of a program. This information is both the data in the program as well as the program itself. For example, I can write a program that will add the numbers 2 and 4. The values `2` and `4` will be stored in RAM when the program is loaded into the computer. In addition to that, the program itself will be stored in memory. In a modern computer, the program would be stored on the hard drive, but it would eventually be loaded into RAM before it executes, and the data would probably be entered by a user. My computer won't have either a hard drive or any form of user input. It will all just be stored directly in RAM.

Following the 2 plus 4 example, my computer can't operate directly on the data in RAM. It can only add (or subtract) numbers that are stored in the registers. This means that we'll need to copy the data from their location in RAM into either the A or B register. Once there the arithmetic-logic unit (the next part of the build) can operate on them. Basically, the register is short term storage for data being used very soon. 

There are three operations you can do with a register:

  1. Write to it
  1. Read from it
  1. Clear it

Normally, you can't easily inspect the data currently in the register. That would be boring and make it super hard to understand what's going on at any given time in the computer. These registers have 8 red LED's that will show the current state of the register.

Transferring data from one register to another (or to another part of the computer), that data is written and then read from the bus. The bus is pretty simple component that wires all the components together using 8 parallel input/outputs. Coordination is required so that only one thing is writing to the bus at a given time and that the component that wants that data is reading from it. For now that's done manually, but wiring in that logic will be an important part of what makes this a computer.

# Cutting Wires

Last time, I built the [clock module](https://quintussential.com/archive/2020/08/15/Breadboard-Computer-1-Clock-Module/) for my 8-bit computer and I had a hell of a time cutting and stripping the wires just right. I could reliably cut the wires the right length, but then I couldn't take off exactly 0.3" of insulation on either side using my strippers. I had two options: get good or buy more reliable strippers.

I went with the latter and picked up a set of [Knipex wire strippers](https://www.amazon.com/Knipex-1262180-Adjusting-Insulation-Strippers/dp/B003B8WB5U/). These things are amazing. Set the length to strip, insert wire, pull trigger, repeat. The exact right amount is stripped each and every time. No worries about setting the right gauge wire, it auto adjusts. Pure joy to work with after fumbling around last week. I can now complete wiring tasks in minutes that would take hours without them.

[![wire_strippers.jpg](/images/posts/2020/2020-09-02-Breadboard-Computer-2-Registers/thumbnails/wire_strippers.jpg)](/images/posts/2020/2020-09-02-Breadboard-Computer-2-Registers/wire_strippers.jpg)

They are a little on the pricey side but they will save me so much time and effort that they are worth it. I'd highly recommend them if you can afford it.

# The Build

[![ics.jpg](/images/posts/2020/2020-09-02-Breadboard-Computer-2-Registers/thumbnails/ics.jpg)](/images/posts/2020/2020-09-02-Breadboard-Computer-2-Registers/ics.jpg)

Each register uses :

  * 2 4-bit 74LS173 (register)
  * 1 8-bit 74LS245 (transceiver)

The remaining transceiver, OR gates, and adders in the picture will be used for the ALU.

The register chips are 4 bits each, which is why two are needed to store 8 bits total.  They are wired together (clocks, read signal, output signal, etc) so that they can be used as a single logical unit. They are wired to always output their data so that we can see their state in the LED's. That's why the transceiver is needed to toggle writing that state to the bus when the computer needs to read from the register.

[![assembly_01.jpg](/images/posts/2020/2020-09-02-Breadboard-Computer-2-Registers/thumbnails/assembly_01.jpg)](/images/posts/2020/2020-09-02-Breadboard-Computer-2-Registers/assembly_01.jpg)

Each breadboard will be dedicated to a register. The top two will be the A and B registers, the bottom one will be used for the instruction register. The top two will be on the right side of the computer, the bottom one will be on the left. The transceiver chip will need to be connected to the bus (which will be in the middle) so it will be convenient to have that as close to the bus as possible (just to avoid messy wiring).  Other than that, the three registers will be identical

[![assembly_02.jpg](/images/posts/2020/2020-09-02-Breadboard-Computer-2-Registers/thumbnails/assembly_02.jpg)](/images/posts/2020/2020-09-02-Breadboard-Computer-2-Registers/assembly_02.jpg)

Here we can see the connections keeping the pairs of register chips in sync with each other. The white wires (on the bottom) will be used as the clock input, the yellows are signals to read or clear data.

![assembling_register.gif](/images/posts/2020/2020-09-02-Breadboard-Computer-2-Registers/assembling_register.gif)

The rest of the work is to just wire up the 8 channels connecting the registers and transceivers.

# LED's

[![led_strip_back.jpg](/images/posts/2020/2020-09-02-Breadboard-Computer-2-Registers/thumbnails/led_strip_back.jpg)](/images/posts/2020/2020-09-02-Breadboard-Computer-2-Registers/led_strip_back.jpg)
[![led_strip_front.jpg](/images/posts/2020/2020-09-02-Breadboard-Computer-2-Registers/thumbnails/led_strip_front.jpg)](/images/posts/2020/2020-09-02-Breadboard-Computer-2-Registers/led_strip_front.jpg)
[![led_strip_side.jpg](/images/posts/2020/2020-09-02-Breadboard-Computer-2-Registers/thumbnails/led_strip_side.jpg)](/images/posts/2020/2020-09-02-Breadboard-Computer-2-Registers/led_strip_side.jpg)
