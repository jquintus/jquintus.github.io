---
layout: post
categories:
  - Rubik's Cube
  - Rubik's
  - Cube
---

Solving the 5x5 cube is similar (but slightly easier) than solving the 4x4. The
process is the same but there are fewer edge cases.

The steps are

1. Reduce it to a 3x3 by
   1. Solving the center
   1. Solving the edges
   1. Handle any edge parity
1. Solve the 3x3

## Center Solve

The center solve is the exact same as a 4x4, just a little bigger.

1. Solve the white square
2. Solve the opposite side (yellow square)
3. Solve any of the remaining sides
4. Solve the adjacent side (it could be any side, but it's just easier to solve
   the adjacent side since it means less flipping the cube around)
5. Solve the remaining two sides in one go

# Edges

## Free Slicing

To speed things up you can use the "free slicing" method. Which pretty much
means you solve 8 of the edges w/out making sure you get the center squares
resolved after each pass. This just speeds up the process. Once you have 8 out
of the 12 edges solved, you put them at the top and bottom and then resolve the
center squares. After this, you can solve the remaining 4 edges the "normal"
way: one block at a time and always bringing the square faces back to solved
after every move.

## Flipping an edge

In order to pair up an edge you may need to flip one of the edge pieces. For
example, you would want to flip the orange/blue piece in the top right with the
bottom right red/green piece. This will let you slot in the blu/orange piece in
the next move.

```
🔲|🔲🔲🔲🔲🔲|🔲       🔲|🔲🔲🔲🔲🔲|🔲
🟦|🟧🔲🔲🔲🟧|🟦       🟦|🟧🔲🔲🔲🟥|🟩
🟦|🟧🔲🔲🔲🟥|🟩  ==>  🟦|🟧🔲🔲🔲🟥|🟩
🟨|🟩🔲🔲🔲🟥|🟩       🟨|🟩🔲🔲🔲🟦|🟧
🔲|🔲🔲🔲🔲🔲|🔲       🔲|🔲🔲🔲🔲🔲|🔲
```

The algorithm for this is

```
R U R` F R` F` R
```

## Parity

```
⚪|🟨🟨🟦🟨🟨|⚪       ⚪|🟨🟨🟨🟨🟨|⚪
————————————————————       ———————————————————
🟧|🟦🟦🟨🟦🟦|🟥       🟧|🟦🟦🟦🟦🟦|🟥
🟧|🟦🟦🟦🟦🟦|🟥       🟧|🟦🟦🟦🟦🟦|🟥
🟧|🟦🟦🟦🟦🟦|🟥  ==>  🟧|🟦🟦🟦🟦🟦|🟥
🟧|🟦🟦🟦🟦🟦|🟥       🟧|🟦🟦🟦🟦🟦|🟥
🟧|🟦🟦🟦🟦🟦|🟥       🟧|🟦🟦🟦🟦🟦|🟥
```

Either of the below algorithms will solve this problem. Pick whichever you like
best.

### Algorithm 1

```
Rw U2 x Rw U2 Rw U2 3Rw' U2
Lw U2 Rw' U2 Rw U2 Rw' U2 Rw'
```

### Algorithm 2

```
Rm' U2 Lm F2
Lm' F2 Rm2 U2
Rm U2 Rm' U2
F2 Rm2 F2
```

[Source](https://youtu.be/8sUizjNP2-g)

## Reading the diagrams

In the diagrams above I use the following conventions.

- The 🔲 square is used to denote a square we don't care about
- The ⚪ is just a spacer. It means nothing and is only there so everything else
  lines up.
- The `|` is used to denote the side edge of the cube. Something to the left of
  a `|` is on a different face than the square to the right of it.
- The — is used to denote the top edge of the cube. Something above the — is on
  a different face than the square below it.

## Note on notation

Some of the notation for 5x5 is slightly different than the 4x4 or 3x3

- `Rw` means "right wide" or the two rightmost columns.
- `3Rw` means the 3 right most columns
- `Rm` means the "right middle" column. So it's rotating just the single column
  between the center column and the right face.
- `Lm` means the "left middle" column.
- `x` means to rotate the entire cube so the bottom is now the front and the
  front is now the top. The two sides (left and right) do not change.
