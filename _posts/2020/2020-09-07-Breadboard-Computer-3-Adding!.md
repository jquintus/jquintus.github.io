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
  1. Write out a table of all of the connections
  1. Use a multimeter to test for voltage levels in addition to continuity

## Tabling Connections

In order to know which if a wire is connecting the wrong pins on two IC's, you need to know which are the right pins. So after blindly staring at the forest of wires, I went back to the pin outs of the IC's and wrote a few tables to track what I should expect to be where.  I did them by hand in a notebook, but this is essentially what I have.


### The A Register

The A register is simpler than the B register since it connects directly to the adder and does not need to be negated.

| A Register Bit | Transceiver Pin | Left Adder Pin | Right Adder Pin |
|----------------|-----------------|----------------|-----------------|
|             8  |               2 |             12 |               X |
|             7  |               3 |             14 |               X |
|             6  |               4 |              3 |               X |
|             5  |               5 |              5 |               X |
|             4  |               6 |              X |              12 |
|             3  |               7 |              X |              14 |
|             2  |               8 |              X |               3 |
|             1  |               9 |              X |               5 |

This basically just tells me that if I think I'm having an issue with the most significant bit in the A register (bit 8), then I need to check to see if the wire from the transceiver's second pin connects to the twelfth pin on the left adder. Once I run down all the pins combinations to make sure that they are correct, I can be confident that the register is wired up correctly and move on to the B register.

### The B Register

| B Register Bit | Transceiver Pin | Left Adder Pin | Right Adder Pin |
|----------------|-----------------|----------------|-----------------|
|             8  |               2 |             12 |               X |
|             7  |               3 |             14 |               X |
|             6  |               4 |              3 |               X |
|             5  |               5 |              5 |               X |
|             4  |               6 |              X |              12 |
|             3  |               7 |              X |              14 |
|             2  |               8 |              X |               3 |
|             1  |               9 |              X |               5 |
## 2020-09-07-Breadboard-Computer-3-Adding!
[![adding.jpg](/images/posts/2020/2020-09-07-Breadboard-Computer-3-Adding!/thumbnails/adding.jpg)](/images/posts/2020/2020-09-07-Breadboard-Computer-3-Adding!/adding.jpg)
[![leds_back.jpg](/images/posts/2020/2020-09-07-Breadboard-Computer-3-Adding!/thumbnails/leds_back.jpg)](/images/posts/2020/2020-09-07-Breadboard-Computer-3-Adding!/leds_back.jpg)
[![leds_front.jpg](/images/posts/2020/2020-09-07-Breadboard-Computer-3-Adding!/thumbnails/leds_front.jpg)](/images/posts/2020/2020-09-07-Breadboard-Computer-3-Adding!/leds_front.jpg)
[![led_back.jpg](/images/posts/2020/2020-09-07-Breadboard-Computer-3-Adding!/thumbnails/led_back.jpg)](/images/posts/2020/2020-09-07-Breadboard-Computer-3-Adding!/led_back.jpg)
[![led_front.jpg](/images/posts/2020/2020-09-07-Breadboard-Computer-3-Adding!/thumbnails/led_front.jpg)](/images/posts/2020/2020-09-07-Breadboard-Computer-3-Adding!/led_front.jpg)

