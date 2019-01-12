---
layout: post
disqus_identifier: #36
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

```
Dd  R   F'  U
R'  F   Dd' 
```

## Parity

There are tons of parity issues that you can encounter.  And then there are
tons of sequences to correct each one. I'm just listing the ones I use to fix
the scenarios that I encounter.
[SpeedCubing.com](https://www.speedsolving.com/wiki/index.php/4x4x4_parity_algorithms)
has an exhaustive list.

### Edge Parity

This algorithm will flip the top two edge pieces on the front face without
moving any other pieces

``` 
r'  U2  l   F2
l'  F2  r2  U2
r   U2  r'  U2
F2  r2  F2 
``` 

### Corner Parity

This sequence will swap the two front most top corners.

```
F2  R2  B'  D'
B   R2  F'  U
Ff2 F   L2  f2
Ll2 f2  l2  U'
```

## A note on notation

Most of the notation is the same as the 3x3 cube notation, for example `F`
means rotate the front face clockwise.  `F'` means rotate the front face
counter-clockwise.  Some additions just for the 4x4 are:

* `l` (lower case `L`):  rotate the column second from the left clockwise
* `r`: rotate the column second from the right clockwise
* `Dd`: the equivalent of doing a `D` and then a `d`.  It basically means
  rotate the entire bottom half.

