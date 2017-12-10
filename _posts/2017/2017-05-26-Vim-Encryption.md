---
layout: post
categories: vim
disqus_identifier: 4
---

I've been using Vim for close to 15 years now and it always amazes me.  I needed a quick and easy way to encrypt some files on a thumb drive when going from one computer to another.  After about 5 seconds of googling I see that as always, vim's got my back.

First off, you can optionally select your encryption scheme by doing `:setlocal cm=blowfish2`.  There are other options, but that's the strongest encryption available.  Next all you need to do is set the password by typing:  `:X` (note that it is a capital X).  You'll be prompted for the password.  After that just [close vim as normal](https://stackoverflow.blog/2017/05/23/stack-overflow-helping-one-million-developers-exit-vim/).  You can cat out your file on the terminal to double check that it's encrypted.

When you repopen the file in vim, you'll be prompted to enter the password to decrypt the data.

If you want to save the decrypted file, just clear out the key by doing `:set key=` and then save the file.

