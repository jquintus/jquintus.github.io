---
layout: post
disqus_identifier: #11
comments: true
categories: []
---

I’m OCD when it comes to my code.  I don’t like to have any warnings.  I wanted to configure my TeamCity builds to fail if there were any warnings in the projects. My first option is to tick the “Treat warnings as errors” box in the project settings.  This had a few problems

## Problem 1.

I’d have to remember to do it for every project in my repo, including all the projects I make in the future.  Even worse, everyone on my team would have to remember to do that too.  That’s not something I could rely on.

## Problem 2. 

While warnings are just errors that you’re ignoring, I will admit that it is convenient to be able to ignore some things some times.  I’m fine with debugging and running locally with some errors.  I really only wanted to stop people from committing code back to master with warnings.  I couldn’t care less about bad hygiene the have when working locally.

## The Solution

In searching, I found [David Gardiner’s blog post in which he creates a power shell script to edit the xml in each csproj file](http://david.gardiner.net.au/2011/05/turn-on-as-errors-for-all-projects-in.html).  It looks simple enough so I removed the TFS bit and added it as a build step in my TeamCity flow. It runs right before compiling my code.

![](/images/posts/2015/2015-06-10-treat-warnings-as-errors-in-teamcity/TreatWarningsAsErrors1.png)

```powershell
Get-ChildItem -Recurse -Filter "*.*csproj" | % {
    Write-Host $_.Name
     
    $filename = $_.Fullname
     
    $proj =
1
( Get-Content $_.Fullname ) $xmlNameSpace = new-object System.Xml.XmlNamespaceManager($proj.NameTable) $xmlNameSpace.AddNamespace("p", "http://schemas.microsoft.com/developer/msbuild/2003") $nodes = $proj.SelectNodes("/p:Project/p:PropertyGroup[@Condition and not (p:TreatWarningsAsErrors)]", $xmlNameSpace) $touched = $false $nodes | ForEach-Object -Process { $e = $proj.CreateElement("TreatWarningsAsErrors", "http://schemas.microsoft.com/developer/msbuild/2003") $e.set_InnerText("true") $_.AppendChild($e) | Out-Null $touched = $true } if ($touched) { Write-Host "Checkout $filename" $proj.Save("$($filename)") | Out-Null } }
```

_this post was originally on the [MasterDevs Blog](http://blog.masterdevs.com/treat-warnings-as-errors-in-teamcity/)_
