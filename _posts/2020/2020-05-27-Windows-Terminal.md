---
layout: post
disqus_identifier: #66
comments: true
categories: 
  - Config
  - CLI
  - Terminal
---

I've finally taken the time to configure [Windows
Terminal](https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701).
I've been a big fan of [ConEmu](https://conemu.github.io/) in the past. It has
tons of configurable settings and features. But honestly, I switched to it for
the easier copy/pasting in the command line. Since the new Windows Terminal
can do that, then I thought it would be worth giving a shot. 

Below is my current configuration after about an hour of reading docs and
fiddling. I like that I was easily able to find the [Desert
theme](https://atomcorp.github.io/themes/) (which is what I've been using for
vim for over a decade now).


```json
{
    "$schema": "https://aka.ms/terminal-profiles-schema",

    "defaultProfile": "{0caa0dad-35be-5f56-a8ff-afceeeaa6101}",
    "useAcrylic": "true",

    "copyOnSelect": false,
    "copyFormatting": false,

    "profiles":
    {
        "defaults":
        {
            // Put settings here that you want to apply to all profiles.
        },
        "list":
        [
            {
                // Make changes here to the cmd.exe profile.
                "guid": "{0caa0dad-35be-5f56-a8ff-afceeeaa6101}",
                "name": "Josh Command Prompt",
                "commandline": "cmd.exe /k %HOMEPATH%\\OneDrive\\bin\\cmdinit.bat -new_console",
                "colorScheme": "Desert",
                "hidden": false
            }
        ]
    },

    "schemes": [
        {
            "name": "Desert",
            "black": "#4d4d4d",
            "red": "#ff2b2b",
            "green": "#98fb98",
            "yellow": "#f0e68c",
            "blue": "#cd853f",
            "purple": "#ffdead",
            "cyan": "#ffa0a0",
            "white": "#f5deb3",
            "brightBlack": "#555555",
            "brightRed": "#ff5555",
            "brightGreen": "#55ff55",
            "brightYellow": "#ffff55",
            "brightBlue": "#87ceff",
            "brightPurple": "#ff55ff",
            "brightCyan": "#ffd700",
            "brightWhite": "#ffffff",
            "background": "#333333",
            "foreground": "#ffffff"
        } 
    ],

    "keybindings":
    [
        { "command": "duplicateTab", "keys": ["ctrl+t"] },
        { "command": "closePane", "keys": ["ctrl+w"] },
        
        { "command": {"action": "copy", "singleLine": false }, "keys": "ctrl+c" },
        { "command": "paste", "keys": "ctrl+v" },

        // Press Ctrl+Shift+F to open the search box
        { "command": "find", "keys": "ctrl+shift+f" },

        // Press Alt+Shift+D to open a new pane.
        { "command": { "action": "splitPane", "split": "auto", "splitMode": "duplicate" }, "keys": "alt+shift+d" }
    ]
}
```

Interesting tidbits I stumbled across while reading the docs

* Holding `alt` while opening the settings will open the default settings
* Pressing any arrow key while holding `alt` will jump to the pane in that
  direction. 
* Pressing any arrow key while holding `alt-shift` will resize current the pane
  in that direction
* Settings are reloaded as soon as you save the settings file. No need to
  reload tabs. This confused me while I was trying out different color schemes
* Chrome-style shortcuts work for zooming in/out in a pane
* Aero doesn't work on my Surface3 🙀

## Wishlist 

It would be nice to be able to click on links in the console and have them open
in my browse. There's an
[issue](https://github.com/microsoft/terminal/issues/204) open for that, so
hopefully it makes it into an upcoming version.

Another ConEmu feature that I would love to see is the ability to [open up a
tab as an administrator](https://github.com/microsoft/terminal/issues/632.) The
current workaround is to `Ctrl+Shift+click` on the icon in the taskbar to open
a dedicated admin prompt. This is a bit more work than I'm used to, but most of
what I'm adminning about for is to just run
[Chocolatey](https://chocolatey.org/). I can make due.
