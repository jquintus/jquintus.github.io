---
layout: post
disqus_identifier: #9
comments: true
categories: []
---

CoolWhip is a NuGet package aimed at making and deploying other NuGet packages easier. With CoolWhip, creating a Release in GitHub automatically pushes that release to NuGet.

![](/images/posts/2015/2015-06-30-introducing-coolwhip/GitGet.png)

Once you’ve installed CoolWhip into your project it will create a [nuspec](https://docs.nuget.org/create/nuspec-reference) file and [AppVeyor](http://www.appveyor.com/) configuration file.  These will work together to package your project and automatically upload it to [NuGet.org](http://blog.masterdevs.com/introducing-coolwhip/NuGet.org).

Once setup, all you need to do to update your package on NuGet.org is [create a release in GitHub](https://help.github.com/articles/creating-releases/).  CoolWhip will pull the version information directly from the release name and kick off a build in AppVeryor.  You have complete control over versioning your application.

To configure CoolWhip you need to

1. Connect AppVeyor to your GitHub repo
1. Install the NuGet package `>Install-Package CoolWhip`
1. Update the generated [nuspec](https://github.com/MasterDevs/CoolWhip/wiki/nuspec) file with your project’s information
1. Add your authorization tokens to the [AppVeyor.yml](https://github.com/MasterDevs/CoolWhip/wiki/AppVeyor.yml) file
1. Save/commit your changes

Once this is set up, all you’ll need to do in order to release (or update) your package on NuGet is create a GitHub release with the version number.

There is full step by step documentation in the [wiki](https://github.com/MasterDevs/CoolWhip/wiki/Installing-CoolWhip).

Happy Coding.

_this post was originally on the [MasterDevs Blog](http://blog.masterdevs.com/introducing-coolwhip/)_
