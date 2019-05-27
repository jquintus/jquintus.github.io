---
layout: post
disqus_identifier: #61
comments: true
categories: 
  - Status Report
  - Pi Project
---

[![Power Button In Action](/images/posts/2019/2019-05-27-Pi-Project-Status-Report-Day-7/power_led.gif)](/images/posts/2019/2019-05-27-Pi-Project-Status-Report-Day-7/power_led.gif)

This weekend I focused on getting the GB LED in my [power
button](https://www.adafruit.com/product/3350) to work. I needed to use an [SPI
PWM board](https://www.adafruit.com/product/1455) from Adafruit to control the
LED. You can see it working above.  When the device is on, the light is green.
Hold the button down for 5 seconds and it turns purple, signaling that when you
release it the device will power down.  When it powers down the light turns
(and stays) red.

I have detailed instructions on [using the PWM with a Raspberry
Pi](https://quintussential.com/archive/2019/05/25/RGB-LEDs-on-Pi-with-Adafruit-12-Channel-16-bit-PWM-LED-Driver/).
A couple of highlights (mistakes) that didn't make it into the post are worth
noting here.

First off, I didn't do a great job soldering the header pins to the board. I
had too much solder on some of the pins, which resulted in a sphere on the end
of the board that didn't make enough contact to keep the pin firmly attached.
Which is to say the pins fell out. Next, I realized that I had soldered the
header on to the _output_ side of the board, not the input, meaning that it was
ready for me to daisy chain on another board... but that I couldn't use the
current board without soldering the other side on. A textbook case of Murphy's
Law.  

All of these soldering mistakes meant it was time to break out the soldering
iron and fix my mistakes. I resoldered the bad pins, and added another header
to the CORRECT side of the board. While I was there I added a male header to
expose the voltage pinouts. One convenient mistake I had made weeks ago was
soldering a female jumper wire to the voltage pin on my power LED. With the
new male header on the board, it was easy to wire this up.

Speaking of wiring, I used some rainbow tape to on the red, green, and blue
jumpers coming from the power LED to keep them organized, and then plugged them
into my breadboard, connecting them to the PWM board.  From there, wiring up
the Pi to the board was pretty simple. I used some more rainbow tape to keep
those wires in order and make it easy for me to connect and disconnect the
board entirely.

Next it was time to dip into Python to integrate the LED to my existing volume
controller app. The code can be found in my [Day 7 pull
request](https://github.com/jquintus/PiProject/pull/8). The majority of went
into a dedicated
[RgbLed](https://github.com/jquintus/PiProject/blob/8bbd9ea8838bc6e47a74d788212dae37246751ee/piboard/client/RgbLed.py)
class.  It doesn't expose a lot of the features, but enough for now.

## Pictures

[![Prototyping with the Pi](/images/posts/2019/2019-05-27-Pi-Project-Status-Report-Day-7/cobbler_wiring_for_pwm_module.jpg)](/images/posts/2019/2019-05-27-Pi-Project-Status-Report-Day-7/cobbler_wiring_for_pwm_module.jpg)

[![Moving on to wiring directly to the Pi](/images/posts/2019/2019-05-27-Pi-Project-Status-Report-Day-7/pi_wiring_for_pwm_module.jpg)](/images/posts/2019/2019-05-27-Pi-Project-Status-Report-Day-7/pi_wiring_for_pwm_module.jpg)

[![PWM Module Wired Up](/images/posts/2019/2019-05-27-Pi-Project-Status-Report-Day-7/pwm_module.jpg)](/images/posts/2019/2019-05-27-Pi-Project-Status-Report-Day-7/pwm_module.jpg)

**Here it is fully wired and turned on with the lid off** 

[![Fully Wired](/images/posts/2019/2019-05-27-Pi-Project-Status-Report-Day-7/fully_wired_and_on.jpg)](/images/posts/2019/2019-05-27-Pi-Project-Status-Report-Day-7/fully_wired_and_on.jpg)

