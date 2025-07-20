---
layout: post
disqus_identifier: 2025-07-20-Creating-Labels-on-Curved-Models-in-Fusion-360
comments: true
categories: 
  - 3D Modeling
  - Fusion 360
  - 3D Printing
---

# Creating Labels on Curved Models in Fusion 360

It's really easy to create labels on flat models in Fusion 360:

1. Create a new sketch on the flat face of your model.
2. Use the text tool to add your label.
3. Exit the sketch.
4. Emboss the sketch on to the surface.

But it's a little more tricky to create labels on curved models.

Here's how to do it:

1. Create a new body with a curved surface that you want to label. Rename the body
`Main` to keep track of it.
2. Create an offset plane outside of the body.
[![Step 2 - Create Offset Plane.png](/images/posts/2025/2025-07-20-Creating-Labels-on-Curved-Models-in-Fusion-360/thumbnails/Step 2 - Create Offset Plane.png)](/images/posts/2025/2025-07-20-Creating-Labels-on-Curved-Models-in-Fusion-360/Step 2 - Create Offset Plane.png)
3. Create a sketch on that plane with whatever message you want.
4. Extrude the the sketch through the surface of your body. You need to make sure
you have this deep enough that the full text will intersect with the body.
[![Step 4 - Extrude the label.png](/images/posts/2025/2025-07-20-Creating-Labels-on-Curved-Models-in-Fusion-360/thumbnails/Step 4 - Extrude the label.png)](/images/posts/2025/2025-07-20-Creating-Labels-on-Curved-Models-in-Fusion-360/Step 4 - Extrude the label.png)
5. Create another sketch on the _back_ of the extrusion. This just needs to intersect
all of the letters of the text. If there are any hollow areas of your text (the
circle in the center of an `e`, for example), you want to make sure that you exclude
the hollow areas. You can either do this directly by not intersecting with the
hollow areas, or you can project the letters from the original sketch onto the
new sketch. In the screenshot, you can see that the sketch is just a simple box that
overlaps all of the letters.
[![Step 5 - Second Sketch.png](/images/posts/2025/2025-07-20-Creating-Labels-on-Curved-Models-in-Fusion-360/thumbnails/Step 5 - Second Sketch.png)](/images/posts/2025/2025-07-20-Creating-Labels-on-Curved-Models-in-Fusion-360/Step 5 - Second Sketch.png)
6. Extrude the new sketch through the bodies of the old sketch, effectively joining
them together into one body. This makes it easier to do the next few steps because
you'll have a single body to work with instead of one body per letter. 
[![Step 6 - Extrude the connector plate.png](/images/posts/2025/2025-07-20-Creating-Labels-on-Curved-Models-in-Fusion-360/thumbnails/Step 6 - Extrude the connector plate.png)](/images/posts/2025/2025-07-20-Creating-Labels-on-Curved-Models-in-Fusion-360/Step 6 - Extrude the connector plate.png)
7. Name this new body `Label`
8. Use the `Combine` tool to trim the `Label` so it doesn't extrude past the face
of `Main`.
    * **Target**: `Label`
    * **Tool**: `Main`
    * **Operation**: `Intersect`
    * **Keep Tools**: True
[![Step 8 - Trim the Label.png](/images/posts/2025/2025-07-20-Creating-Labels-on-Curved-Models-in-Fusion-360/thumbnails/Step 8 - Trim the Label.png)](/images/posts/2025/2025-07-20-Creating-Labels-on-Curved-Models-in-Fusion-360/Step 8 - Trim the Label.png)
9. Use the `Combine` tool again to create the recess for the label to fit into.
    * **Target**: `Main`
    * **Tool**: `Label`
    * **Operation**: `Cut`
    * **Keep Tools**: True
[![Step 9 - Create the recess for the letters.png](/images/posts/2025/2025-07-20-Creating-Labels-on-Curved-Models-in-Fusion-360/thumbnails/Step 9 - Create the recess for the letters.png)](/images/posts/2025/2025-07-20-Creating-Labels-on-Curved-Models-in-Fusion-360/Step 9 - Create the recess for the letters.png)

Done.
