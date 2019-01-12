---
layout: post
disqus_identifier: #3
comments: true
categories: [docker, jekyll]
---

[GitHub Pages](https://pages.github.com) have some great features that I'm
excited about.  Markdown makes writing code-centric blog posts easy.
Storing posts in git is great -- history, diffs, and no need to learn a
new tool.  Not to mention simple hosting by GitHub.

There's just one minor issue, setting up a decent environment on
a Windows machine can be troublesome if you're not alread a Ruby developer.
I've tried twice now and run into issues both times.  Multiple versions of Ruby,
non-Windows friendly libraries, [failed SSL certs](https://stackoverflow.com/questions/5720484/how-to-solve-certificate-verify-failed-on-windows),
and probably a few more things that I've forgotten.  Next I thought I'd try it on
[Linux on Windows](https://msdn.microsoft.com/en-us/commandline/wsl/about).  For
the most part that worked well, except some auto-reload features didn't work well.

It's almost as if I would be better off trying to run the environment on a Linux
machine.  Seeing as I don't have a spare machine and hate running VMs on my work
laptop, I'm probably not running Linux any time soon.

All I really want is a preconfigured environment that I can download quickly and
not have to do anything to setup.  Is that too much to ask?  Apparently not.
Heading over to Docker Hub, I found several [Docker Images](https://hub.docker.com/search/?isAutomated=0&isOfficial=0&page=1&pullCount=0&q=GitHub+pages&starCount=0) 
for exactly the environment I wanted.  I blindly went with [the one with the most
downloads](https://hub.docker.com/r/starefossen/github-pages/). There was one
minor hicup. The instuctions use the Linux variable `$PWD` to mount the volume
from the host machine to the Docker image. That just needed to be translated to
`%CD%`.  With that down, I was able to point the browser on my Windows machine
to `localhost:4040/` and my website was up. I could edit any file with whatever
Windows tool I was comfortable with (ironically, [Vim](http://vim.org)), save it
and my site would be regenerated.

All told, I was up and running in about 15 minutes, including download time and
writing two simple batch files to [start](https://github.com/jquintus/jquintus.github.io/blob/master/StartDocker.bat) and
[stop](https://github.com/jquintus/jquintus.github.io/blob/master/StopDocker.bat) the containers.

### StartDocker.bat

```batch
@ECHO off
ECHO Starting gpages container

docker run -t --rm           ^
    --name gpages            ^
    -v "%CD%":/usr/src/app   ^
    -p 4000:4000             ^
    starefossen/github-pages

```

### StopDocker.bat

```batch
@ECHO off
ECHO Stopping gpages container
docker stop gpages
```
