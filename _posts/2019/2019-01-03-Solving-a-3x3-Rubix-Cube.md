---
layout: post
disqus_identifier: #37
comments: true
categories: 
  - Rubik's Cube
  - Rubik's
  - Cube
---

Some brief notes on solving a traditional 3x3 Rubik's cube.  These instructions
assume that you are starting by solving the white face first.  

1. Solve for the white cross
1. Solve for the white corners and corresponding edge at the same time
1. Solve for the yellow cross (three possible starting points)
  1. [Hook](#hook)
  1. [Bar](#bar)
  1. Dot (use either the [hook](#hook) or [bar](#bar))
1. Put yellow [edges](#edges) in correct spots
1. Put yellow [corners](#corner-location) in the correct location
1. Put yellow [corners](#corner-orientation) in the correct orientation

## Hook

Start with yellow hook in the top left corner.

Starting top layout:

```
|   | Y |   |
| Y | Y |   |
|   |   |   |
```

Ending top layout:

```
|   | Y |   |
| Y | Y | Y |
|   | Y |   |
```

`F U R U' R' F'`

## Bar

Start with yellow bar going horizontal

Starting top layout:

```
|   |   |   |
| Y | Y | Y |
|   |   |   |
```

Ending top layout:

```
|   | Y |   |
| Y | Y | Y |
|   | Y |   |
```

`F R U R' U' F'`

## Edges

This sequence swaps the front edge with the left edge on the top of the cube.
So start with the edges you want to preserve on the right and back.  It may be
the case that there are no two edges that are correctly adjacent.  In that
case, you'll just have to do this bit twice.

Starting top layout:

```
|   | B |   |
| O |   | G |
|   | R |   |
```

Ending top layout:

```
|   | O |   |
| B |   | G |
|   | R |   |
```

`R U R' U R U2 R' U`

## Corner Location

This sequence rotates the corners.  If the corners were numbered clockwise
starting in the top left as 1, 2, 3, 4, then after this sequence the would be :
4, 1, 3, 2

Starting top layout:

```
| 1 |   | 2 |
|   |   |   |
| 4 |   | 3 |
```

Ending top layout:

```
| 4 |   | 1 |
|   |   |   |
| 2 |   | 3 |
```

`U R U' L' U R' U' L`

## Corner Orientation

This sequence rotates the corner in the front right hand corner of the top.
Orient the cube so that the corner you want to change is there.  Run this
algorithm one or two times.  Once it's complete, rotate *just the top* so that
the next corner you want to fix is in the front right hand corner of the top.
Repeat until all the corners are correct. 

Note that the algorithm repeats itself, so it's really a short one to learn.

`R' D' R D R' D' R D`
