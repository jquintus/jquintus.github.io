---
layout: post
disqus_identifier: #45
comments: true
categories: 
  - zsh
---

In order to loop over all the files in a given directory and run a different command on each of them in zsh:

```bash
for file in ~/folder/*; gpg $file
```
