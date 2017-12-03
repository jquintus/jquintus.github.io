@ECHO off
REM ****************************************************************************
REM Start a docker container configured to run 
REM a git hub page website
REM ****************************************************************************

ECHO Starting gpages container

docker run -t --rm           ^
    --name gpages            ^
    -v "%CD%":/usr/src/app   ^
    -p 4000:4000             ^
    starefossen/github-pages
