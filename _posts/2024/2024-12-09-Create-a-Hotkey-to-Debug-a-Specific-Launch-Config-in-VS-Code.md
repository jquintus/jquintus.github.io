---
layout: post
disqus_identifier: #
comments: true
categories:
  - VSCode
  - Debugging
---

I've started using VS Code for more complex projects that have multiple (many)
launch configurations. At any given moment there are a handful of of projects
that I may want to debug. Me being me, I want to be able to press a single
button and debug he right project.

So of course I went to wire up a hotkey for that... only you can't.

Well. Not be default at least.

First things first, you're gonna need an extension called
[Launch Config](https://marketplace.visualstudio.com/items?itemName=ArturoDent.launch-config).
Go ahead and install that.

Next up, you're going to need a suitably complex `.vscode/launch.json`. Luckily,
I have one just kicking around. Let's use this

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "d1",
      "type": "node",
      "request": "launch",
      "runtimeExecutable": "cmd.exe",
      "args": ["/c", "echo Hello, Console 11111111111111"],
      "console": "integratedTerminal"
    },
    {
      "name": "d2",
      "type": "node",
      "request": "launch",
      "runtimeExecutable": "cmd.exe",
      "args": ["/c", "echo Hello, Console 2222222222222"],
      "console": "integratedTerminal"
    }
  ]
}
```

This adds two configurations `d1` and `d2`. Both of which just echo a message to
the command line. Not the most realistic sample, but perfect for testing.

From there, you can configure them to work with `Launch Configs` by in your
`.vscode/settings.json`.

```json
"launches": {
  "RunD1": "d1",
  "RunD2": "d2"
}
```

What this does is create an entry named `RunD1` with `Launch Configs` that will
launch your `d1` configuration.

Next, you have to create the keybindings going to the command pallet
(`ctrl-shift-p`) and search for `keyboard`. This will open up the UI, you can
use that or you can hit the page looking icon at the top of VS Code to open the
text file. For me it's located in
`C:\Users\Josh Quintus\AppData\Roaming\Code\User\keybindings.json` (keybindings
can't be stored at the workspace level 🙁.

```json
 {
  "key": "f14",
  "command": "launches.RunD1",
  "arg": "restart"
},
{
  "key": "f15",
  "command": "launches.RunD2",
  "arg": "restart"
}
```

This maps the `F14` and `F15` key to starting the `d1` and `d2` config,
respectively. But of course, you could set it to anything you like.

## TL;DR

1. Install
   [Launch Config](https://marketplace.visualstudio.com/items?itemName=ArturoDent.launch-config).
2. Create an entry in `.vscode/launch.json`
3. Create a matching entry in `.vscode/settings.json` that points to the launch
   config
4. Create a keybinding that references the item in `settings.json`
