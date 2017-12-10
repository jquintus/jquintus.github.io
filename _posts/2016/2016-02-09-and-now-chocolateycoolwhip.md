---
layout: post
disqus_identifier: #8
comments: true
title: And Now ChocolateyCoolWhip
categories: []
---

Following up on [CoolWhip](/archive/2015/06/30/introducing-coolwhip), ChocolateyCoolWhip is a nuget package that makes creating, packaging, and deploying your code through [Chocolatey.org](https://chocolatey.org/) simple.  Like CoolWhip, all you need to do to publish a new release is [create release in GitHub](https://help.github.com/articles/creating-releases/).

![](/images/posts/2016-02-09-and-now-chocolateycoolwhip/logo.png)

## Chocolatey?

In case you aren’t familiar, Chocolatey is a package manager for Windows built on top of NuGet and PowerShell. It allows users to download and install thousands of software programs with a single command.  For example, to install nodejs, all you would need to do is open up a command prompt and enter

```
> choco install nodejs.install
```

## Getting Started with ChocolateyCoolWhip

To get started, install the nuget package into your project.  The first thing you’ll notice is that it creates nuspec and AppVeyor configuration files.  Chocolatey uses the nuspec as metadata for your package, the same way NuGet does.

Once setup, all you need to do to update your package on Chocolatey.org is [create a release in GitHub](https://help.github.com/articles/creating-releases/).  ChocolateyCoolWhip will pull the version information directly from the release name and kick off a build in AppVeryor.  You have complete control over versioning your application

Configuration is simple:

1. Connect AppVeyor to your GitHub repo
1. Install the NuGet package `>Install-Package ChocolateyCoolWhip`
1. Update the generated [nuspec](https://github.com/MasterDevs/ChocolateyCoolWhip/wiki/Chocolatey-Package-Files) file with your project’s information
1. Add your authorization tokens to the [AppVeyor.yml](https://github.com/MasterDevs/ChocolateyCoolWhip/wiki/AppVeyor.yml) file
1. Save/commit your changes

Once this is set up, all you’ll need to do in order to release (or update) your package on NuGet is create a GitHub release with the version number.

There is full step by step documentation in the [wiki](https://github.com/MasterDevs/ChocolateyCoolWhip/wiki).

Happy Coding.

_this post was originally on the [MasterDevs Blog](http://blog.masterdevs.com/and-now-chocolateycoolwhip/)_
