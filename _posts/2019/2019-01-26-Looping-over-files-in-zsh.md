---
title: "Looping Over Files in zsh"
date: 2019-01-26
layout: post
disqus_identifier: #45
comments: true
categories:
  - Zsh
---

In order to loop over all the files in a given directory and run a different command on each of them in zsh:

```bash
for file in ~/folder/*; gpg $file
```
