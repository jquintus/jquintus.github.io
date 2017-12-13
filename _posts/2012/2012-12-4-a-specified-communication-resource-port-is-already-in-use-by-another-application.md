---
layout: post
disqus_identifier: #6
comments: true
title: A specified communication resource (port) is already in use by another application
categories: [debug, Emulator, Visual Studio, Windows Phone, Windows Phone 8, Windows Phone Emulator, wp8 ]
---

Trying to debug a new Windows Phone 8 application today I came across this problem.  Whenever I hit F5, the emulator would start up like normal but Visual Studio would prompt me with a message box saying:

```
A specified communication resource (port) is already in use by another application.
```

Then the debugger would fail to start.  After trying all of the obvious options and restarting everything in sight, I stumbled across a bit of advice which worked for me.  Right click on your project and select Deploy.  This will copy all necessary code to the emulator.  After that you are free to hit F5 like normal.

![](/images/posts/2012/2012-12-4-a-specified-communication-resource/image.png)


_this post was originally on the [MasterDevs Blog](http://blog.masterdevs.com/a-specified-communication-resource-port-is-already-in-use-by-another-application/)_
