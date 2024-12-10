---
layout: post
disqus_identifier: #
comments: true
categories:
  - VSCode
  - hotkey
---

I recently installed the
[Neovim extension](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim)
in VS Code. I have a love/hate relationship with it. Sometimes it's great. Vim
is just so much easier to navigate files and make fast edits. Sometimes it just
gets in the way.

It'd be really nice if I could just map a hotkey to toggle it on and off. Going
down this rabbit hole, I learned about the `when` clause in VS Code keybindings
but more importantly, I learned how to figure out what variables are available
when using it.

Enter `Developer: Toggle Developer Tools`. With this command (in the Command
Pallet) you can open up the standard chrome developer tools. But in this case,
it allows you to inspect VS Code itself. After that, you can get a list of all
of the
"[Context Keys](https://code.visualstudio.com/api/references/when-clause-contexts)"
available for your when clause.

For example, here's a handful of mine right now

```json
...
neovim.editorLangIdExclusions : null
neovim.init : true
neovim.mode : "normal"
notebookChatAgentRegistered : false
notebookVariableViewEnabled : false
notificationCenterVisible : false
notificationToastsVisible : false
npm.canMove : true
npm.defaultViewLocation : true
openFolderWorkspaceSupport : true
operationInProgress : false
outline.active : true
outline.canMove : true
...
```

From here, I can see that `neovim.init` is a boolean. I can probably use that
for my when clause.

My `keybindings.json` (in `~\AppData\Roaming\Code\User\keybindings.json`)

```json
{
  "key": "f17",
  "command": "vscode-neovim.stop",
  "when": "neovim.init"
},
{
  "key": "f17",
  "command": "vscode-neovim.restart",
  "when": "!neovim.init"
}
```

Now, when neovim is enabled, pressing `F17` will turn it off and when it's off,
pressing it again will turn it back on. Teh is after good.

## TL;DR

1. `Developer: Toggle Developer Tools`
1. `Developer: Inspect Context Keys`
