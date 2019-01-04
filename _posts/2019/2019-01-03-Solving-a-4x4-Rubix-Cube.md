---
layout: post
disqus_identifier: #29
comments: true
categories: 
  - Rubik's Cube
  - Rubik's
  - Cube
---

To solve the 4x4 cube you need to reduce it to a 3x3 cube.  You do this by
solving the 2x2 centers on each face first. Then pair up the [edges](#edges) in
2x1 strips so you can treat them like a single edge on the 3x3.  After that the
entire thing feels like solving the 3x3.  The one caveat is that you may have
[parity](#parity) errors going into the "yellow cross" stage.

Below are the additional algorithms needed for the edges and parity.

## Edges

To solve the last two edges, make sure they are both facing you and are lined
up (not diagonal from their pair):

* `Dd`
* `R`
* `F'`
* `U`
* `R'`
* `F`
* `Dd'`

## Parity

This algorithm will flip the top two edge pieces on the front face without
moving any other pieces

* `r'`
* `U2`
* `l`
* `F2`
* `l'`
* `F2`
* `r2`
* `U2`
* `r`
* `U2`
* `r'`
* `U2`
* `F2`
* `r2`
* `F2`

## A note on notation

Most of the notation is the same as the 3x3 cube notation, for example `F`
means rotate the front face clockwise.  `F'` means rotate the front face
counter-clockwise.  Some additions just for the 4x4 are:

* `l` (lower case `L`):  rotate the column second from the left clockwise
* `r`: rotate the column second from the right clockwise
* `Dd`: the equivalent of doing a `D` and then a `d`.  It basically means
  rotate the entire bottom half.

