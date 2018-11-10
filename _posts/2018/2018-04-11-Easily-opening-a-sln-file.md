---
layout: post
disqus_identifier: #32
comments: true
categories: 
  - Visual Studio
  - VS
  - Command Line
---

Despite being a developer that uses Windows, I spend a lot of time managing my
code on the command line.  As such I want to open up my code in Visual Studio
from the command line.  Typically I already know the name of the sln file, but
if I don't I can do a quick `ls *.sln` to find it and then type it in.  

I'm lazy and that requires me to not only type more, but to also remember
things.  I'd much rather be able to `cd` to my project directory and then just
type in the same thing no matter where I am and have it open up what I want.
My first pass at automating this assumed that there was a single sln file in my
current directory, figured out what it was and then opened it.

For the most part that works, but there are a couple of projects that have
multiple sln files and/or sln files that don't live in the root of the folder
structure.  In my case, there were few enough of these edge cases so I could
just code around them.

Below is the batch file that I use. Each special case gets their own if/set.

```batch
@ECHO OFF
REM ***************************************************************************
REM SLN
REM ***************************************************************************
REM Find and open the prefered sln file If a prefered file can't be found, just
REM open the first one you see
REM ***************************************************************************

SET SLN=""

REM First off see if there is a fallback sln file to open
FOR /F %%i in ('dir /B/s *.sln') do (
  SET SLN=%%i
)

REM Now look if there is a preferred sln that we want to grab
IF  EXIST SecondSolutionInAFolder.sln (
  SET SLN=SecondSolutionInAFolder.sln
) 

IF  EXIST .\ConsoleApps\FunWithSpikes\FunWithSpikes.sln ( 
  SET SLN=.\ConsoleApps\FunWithSpikes\FunWithSpikes.sln
)

IF NOT %SLN%=="" (
  ECHO Starting [93m%SLN%[0m 
  START %SLN%
  GOTO:EOF
)

ECHO [91mCould not find a solution file to open.  [0m
ECHO Are you sure you are in the right directory?  [91m %CD% [0m

```

## Installation and Usage

1. Copy the script into a file named `sln.bat` somewhere in your path
1. From the command line go to the root directory for your project 
1. Run the `sln` command
1. If the wrong sln file is opened, edit your `sln.bat` and add another if/set

```batch
> cd c:\code\MySuperAwesomeProject
> sln
Starting .\MySuperAwesomeProject.sln
```
