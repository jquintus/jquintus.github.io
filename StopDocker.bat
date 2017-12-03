@ECHO off
REM ****************************************************************************
REM Stop the docker container started with `StartDocker.bat`
REM ****************************************************************************

ECHO Stopping gpages container
docker stop gpages
