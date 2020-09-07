---
layout: post
disqus_identifier: #
comments: true
categories: 
  - ben eater
  - breadboard
  - 8-bit computer
  - ALU
---

Now that I have [two registers](https://quintussential.com/archive/2020/09/02/Breadboard-Computer-2-Registers/) to store whatever (8-bit) values I want in them, what next? Let's add them together! (Or subtract them). 

# The ALU

The [ALU](https://en.wikipedia.org/wiki/Arithmetic_logic_unit) reads directly from the A and B registers and computes the sum of those two values. It bypasses the bus and reads directly from the registers, whether or not they are set to output their values. The ALU has two modes, add and subtract. 

In subtract mode (when the control line is brought high), it subtracts the value in register B from register A. Subtraction works by negating the output of the B register and then adding that negative number to A. [Two's Complement](https://en.wikipedia.org/wiki/Two%27s_complement) is used to represent a negative number in binary. This pretty much boils down to flipping all the bit and then adding one. Eight XOR gates are used to flip the bits (the subtract signal is the other input to the gate) and then add one by setting the carry bit on the adder high. The carry bit is normally used when using multiple 4-bit adder chips together to add 8 bits together (or 12 or 16... etc).

# Building and Debugging

So far this is has been the most complicated part of the computer to build. This is purely because of the number of connections to be made and how much they overlap. If you're off by one pin for one wire the entire output is messed up and you have to wade through all the criss crossing wires to figure out what is wrong. The problem gets worse when you have multiple wires in the wrong spot... which is what happened to me.

I learned two useful approaches to this problem
  1. Write out a chart of all of the connections
  1. Use a multimeter to test for voltage levels in addition to continuity
