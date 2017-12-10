--- layout: post
disqus_identifier: #12
comments: true
categories: [ cmd, tips ]
---
I recently stumbled across [DOSKEY](http://en.wikipedia.org/wiki/DOSKEY) while reading [StackOverflow](http://stackoverflow.com/questions/20530996/aliases-in-windows-command-prompt).  Reading the documentation I stumbled across something old and something new.

```
>doskey/?

<edit>
F7    Displays command history
F8    Searches command history
```

I knew about F7 and use it constantly when I’m on the command line.  It pops up a scrollable list of your recent commands.

![](/images/posts/2015/2015-02-02-f8-in-cmd-the-greatest-thing-since-sliced-bread/F7.gif)

F8 lets you cycle through commands in your history with a search term.

Suppose you had previously typed a complex command.  In the example I have below, I used the command `echo Foxtrot Golf`.  To find and execute it again all you need to do is type the beginning of the command and then press the F8 key.  In the example, I type `echo` on the command prompt and cycle through all the commands that start with that by pressing F8.  To narrow it down a bit more, I type in `echo F` and then press F8 to get all the commands that start with that.  Note that it is case sensitive.

![](/images/posts/2015/2015-02-02-f8-in-cmd-the-greatest-thing-since-sliced-bread/F8.gif)

_this post was originally on the [MasterDevs Blog](http://blog.masterdevs.com/f8-in-cmd-the-greatest-thing-since-sliced-bread/)_
