---
layout: post
title:  Stop Chrome from Reloading Tabs
disqus_identifier: 27
comments: true
categories: 
  chrome 
  tips
  GitHub
  PR
---

Sometimes when I'm working on a long pull request in GitHub and switch back to
the PR tab after a while of looking at other pages the Pull Request page will
automcaticall reload itself. Most of the time this is fine, but sometimes I
wind up losing a lot of state (scroll position, which files were loaded
manually, which files had been collapsed, etc). It turns out that Chrome will
garbage collect tabs that are taking up a lot of memory that you may not be
using. Chrome allows you to disable this behavior by going to
[chrome://flags/#automatic-tab-discarding](chrome://flags/#automatic-tab-discarding).
 Simply set the drop down to 'Disabled'.

I typically don't want to keep this setting once I'm done with my PR, so I'll
then jump into slack and ask it to `/remind me to fix
chrome://flags/#automatic-tab-discarding in the morning`
