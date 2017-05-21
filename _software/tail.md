---
name: tail
link: https://1drv.ms/u/s!AiZXpgx5HarcgZJLwub_SuBF-ML87w
category:  Console Utilities

---

The classic Unix utility, tail will print out the last lines of a text file to standard out.
I've found getting a good version of tail on windows is much harder than I'd expect.  At one point I finally found a version I liked, but I have no idea where it came from.  I just jammed it into my OneDrive folder and moved on with my life.

This version can 
* tail multiple files at once
* correctly follow a file (`tail -f`).  The GNUWin32 version for Windows doesn't do this correctly.

The remaining feature that I really want is the ability to press enter while tailing and having the newlines show up in the console output.  This may be more of a console issue than an issue with tail itself.
