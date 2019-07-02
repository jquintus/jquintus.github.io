---
layout: post
disqus_identifier: #64
comments: true
categories: 
  - Status Report
  - Pi Project
  - Arduino
  - Feather
---

[![Evolution](/images/posts/2019/2019-06-30-Pi-Project-Status-Report-Day-9/thumbnails/step9_evolution.jpg)](/images/posts/2019/2019-06-30-Pi-Project-Status-Report-Day-9/step9_evolution.jpg)

Today I was able to complete the first fully working prototype of my keyboard.
It has 6 16mm arcade buttons -- two each of green, yellow, and red -- runs on a
[350mAh lithium ion battery](https://www.adafruit.com/product/2750), and is
completly wireless. It doesn't even have a wire to charge it since I didn't
have enough space to mount the port in the case.

## Build It

Mostly today was a build day. I had most of the code in place, so all that was
left was to assemble everything. First I made a template on paper to figure out
the placement of the buttons. I wanted to make sure that the arcade buttons
were placed far enough apart so that I could fit the power button on the side.
After a lot of measuring and some fiddling I settled on the below layout.

[![Step 1: Create a template](/images/posts/2019/2019-06-30-Pi-Project-Status-Report-Day-9/thumbnails/step1_create_template.jpg)](/images/posts/2019/2019-06-30-Pi-Project-Status-Report-Day-9/step1_create_template.jpg)

To be sure the spacing worked, I placed the buttons directly on the paper.
This was the third layout I tried. Also, I originally planned on blue, green,
and red buttons. After seeing them lined up, the blue and the green were too
similar in color, so I swapped in the yellow buttons for some contrast.

[![Step 2: Check the layout](/images/posts/2019/2019-06-30-Pi-Project-Status-Report-Day-9/thumbnails/step2_check_layout.jpg)](/images/posts/2019/2019-06-30-Pi-Project-Status-Report-Day-9/step2_check_layout.jpg)

To be absolutely certain, I created a quick mock up a cardboard box. The
layout was just right.

[![Step 3: Check the placement](/images/posts/2019/2019-06-30-Pi-Project-Status-Report-Day-9/thumbnails/step3_checking_placement.jpg)](/images/posts/2019/2019-06-30-Pi-Project-Status-Report-Day-9/step3_checking_placement.jpg)

To transfer the layout to the case, I taped the pattern to the top and drilled
1/16th holes in the center.

[![Step 4: Place the template](/images/posts/2019/2019-06-30-Pi-Project-Status-Report-Day-9/thumbnails/step4_placing_template.jpg)](/images/posts/2019/2019-06-30-Pi-Project-Status-Report-Day-9/step4_placing_template.jpg)

Forstner bits were used to drill out the 16mm holes for the buttons. It took me
a little bit to get the hang of drilling the holes. Sometimes the drill caught
on the plastic and scratched the surface of the case.

[![Step 5: Drill holes](/images/posts/2019/2019-06-30-Pi-Project-Status-Report-Day-9/thumbnails/step5_holes_drilled.jpg)](/images/posts/2019/2019-06-30-Pi-Project-Status-Report-Day-9/step5_holes_drilled.jpg)

The wires took up more space than I expected.  It would have been helpful to
daisy chain all of the grounds across a common wire, removing half of the wires
needed.  Also, the rest of the wires could have been cut much shorter or routed
around the edge of the enclosuer, taking up less room.

All of the wires terminate in a [breakout FeatherWing](https://www.adafruit.com/product/2926).

[![Step 6: Wiring](/images/posts/2019/2019-06-30-Pi-Project-Status-Report-Day-9/thumbnails/step6_wiring.jpg)](/images/posts/2019/2019-06-30-Pi-Project-Status-Report-Day-9/step6_wiring.jpg)

The fit was tight enough that I didn't need to mount the feather to the case. The wires held it in place with little to no movement when the bottom was screwed on.

[![Front View](/images/posts/2019/2019-06-30-Pi-Project-Status-Report-Day-9/thumbnails/step7_front_view.jpg)](/images/posts/2019/2019-06-30-Pi-Project-Status-Report-Day-9/step7_front_view.jpg)

You can see the power button on the side.

[![Side View](/images/posts/2019/2019-06-30-Pi-Project-Status-Report-Day-9/thumbnails/step8_side_view.jpg)](/images/posts/2019/2019-06-30-Pi-Project-Status-Report-Day-9/step8_side_view.jpg)

## Code

With everything assembled it was time to test it out.  And it didn't work.
After a little trial and error, I realized that the keyboard would only work if
my laptop was plugged into it via USB and I had the Arduino serial monitor
plugged in. Looking over my code a bit, I see that I still had a line of code
at the very beginning telling the board not to start up unless it detected a
serial console. Removing that fixed the first problem.

Next, whenever I pressed the volume down or up buttons for a brief moment, the
volume would go all the way to 0 or 100.  No in between. It registered as way
too many key presses. Adding a small delay at the end of the loop solved this
problem.

* [Tag on GitHub](https://github.com/jquintus/PiProject/releases/tag/status9)
* [Pull Request on GitHub](https://github.com/jquintus/PiProject/pull/10)

Here's the useful command I used to create the thumbnails for this post: `magick mogrify -resize 33% -path ./thumbnails *.jpg`.
