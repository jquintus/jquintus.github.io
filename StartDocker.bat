@ECHO off
REM ****************************************************************************
REM Start a linux docker container configured to run 
REM a git hub page website
REM
REM Docker file for reference
REM https://github.com/Starefossen/docker-github-pages/blob/master/Dockerfile
REM
REM Specifying the full jekyll command to run is optional, but it
REM allows for adding additional arguments.  Specifically, the `-I`
REM argument which enables incremental site regeneration.  There are
REM some drawbacks to this, but it can greatly speed up the
REM generation time (~8 seconds instead of ~2 minutes)
REM ****************************************************************************

ECHO Starting gpages container
ECHO http://localhost:4000

ECHO.

docker run -t --rm           ^
    --name gpages            ^
    -v "%CD%":/usr/src/app   ^
    -p 4000:4000             ^
    starefossen/github-pages
    jekyll serve -d /_site --watch --force_polling -H 0.0.0.0 -P 4000 -I
    
