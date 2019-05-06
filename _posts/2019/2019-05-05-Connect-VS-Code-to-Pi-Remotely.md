---
layout: post
disqus_identifier: #58
comments: true
categories: 
  - Pi
  - Raspberry Pi
---

I've wanted to have a proper IDE environment on my Windows machine that can
execute code on my Raspberry Pi. Turns out that there's a new VS Code extension
that purports to do just that. Except if you read the fine print it currently
only supports an x86_64 Linux-based OS.

But still, it's worth keeping an eye on the [Remote
SSH](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh)
extension. It's new as of a few days ago and I expect that they'll make
improvements and allow more environments over time.

In the mean time, I'm trying out [SSH
FS](https://marketplace.visualstudio.com/items?itemName=Kelvin.vscode-sshfs),
which allows you to treat an SSH host as a workspace. By default it treats the
host's entire file structure as your workspace, so make sure you specify a
root. It'd be more ideal if you could run commands directly on the host. But
you can always just ssh to the host in Code's terminal.

Once the extension is installed, run the command `SSH FS: Edit configuration`
to add a configuration. Once you've configured it (see below), run the command
`SSH FS: Connect as Workspace folder` and select the configured host.

```
"sshfs.configs": [
  {
    "host": "piz01",
    "label": "piz01 - PiProject",
    "name": "ssh_fs",
    "privateKeyPath": "$HOMEDRIVE$HOMEPATH/.ssh/id_rsa",
    "root": "~/PiProject",
    "username": "pi"
  }
]
```

## Update:

After working with this for a few hours it proved to be unreliable.  When it
was working it was great, but there were plenty of times when trying to set up
the configuration was flaky.  This resulted in not always being able to read
the configuration which meant that I couldn't connect.

In the end it was easier to just remote in to the pi and use vim.
