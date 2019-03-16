---
layout: post
disqus_identifier: #47
comments: true
categories:
  - ConEmu
  - ssh
  - Pi
  - Raspberry Pi
---

I want to easily connect to my Raspberry Pi from my Windows machine,
specifically from inside my preferred terminal, ConEmu.  First we'll
need to set up some SSH Keys on the Pi(although if you're
comfortable keeping your password inside some configuration files,
this is actually optional), set them up on the Windows box, and then
configure ConEmu and your environment.

## Setting up SSH Keys

### On your Pi:

1. Run `ssh-keygen` and follow the prompts, accepting the defaults
  1. Save the key file to `/home/pi/.ssh/id_rsa` (just press enter, as this is the default)
  1. Type in your passphrase (you can elect to keep this empty but it means that anyone who gets the private key will be able to log on to your machine.  So consider if this is really what you want.  For me, I don't really care if people can log in to my Pi for now, so I'm ok with an empty passphrase
1. Configure sshd
  1. `sudo vim /etc/ssh/sshd_config` and ensure you have these values
    ```
    RSAAuthentication yes
    PubkeyAuthentication yes
    PermitEmptyPasswords yes
    ```
1. Copy the private key (`/home/pi/.ssh/id_rsa) to your Windows machine. You can just SSH in to the Pi using the username and password, `cat` the file and copy them from the console.  Save it to your home directory.

### On your Windows Box

Starting with Windows 8 (I think?), Windows started shipping with a
SSH client built in.  Which means, as good as it was, there's no
need to download and install [PuTTY](https://www.putty.org/)
anymore.

1. Test the connection
  1. `ssh -i %HomeDrive%%HomePath%\id_rsa pi@raspberrypi`
  1. You should now be logged in to your Pi

## Integrating with ConEmu

For convenience I added the following alias to my cmd init file.  It
allows me to just type `pi` at the command line and be logged into
my Raspberry Pi immediately.

```cmd
DOSKEY pi=ssh -i %HOME%\id_rsa pi@raspberrypi
```

Next I added a task in [ConEmu](https://conemu.github.io/) so I can open a new tab directly into the Pi.

1. Open the settings and go to `Setup/Tasks` (or just press `Alt-Win-T)
1. Press the `+` button on the bottom left and fill in these values
  1. Name (first box): `Pi`
  1. `Commands` (large box):  `ssh -i c:\users\joshq\id_rsa pi@raspberrypi`
  1. `Hotkey` [Optional]: `Alt-P`
1. Press `Save settings` (or just hit the `escape` key)
1. Try out the shortcut by pressing `Alt-P`
