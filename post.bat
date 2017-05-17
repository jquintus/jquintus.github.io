@echo off
REM ============================================================================
REM Create a new blog post.
REM ============================================================================

REM ==========================================
REM Get the post name portion of the file name
REM ==========================================
if %1.==. (
    echo Name your post:
    SET /p POST_NAME=
) else (
    SET POST_NAME=%1
)

REM ==========================================
REM Get the date portion of the file name
REM ==========================================
SET DATE_dd=%date:~7,2%
SET DATE_mm=%date:~4,2%
SET DATE_yyyy=%date:~10,4%
SET DATE_STAMP=%DATE_yyyy%_%DATE_mm%_%DATE_dd%

REM ==========================================
REM Concat and normalize the file name
REM ==========================================
SET FILE_NAME=%DATE_STAMP%_%POST_NAME%
SET FILE_NAME=%FILE_NAME: =_%

REM ==========================================
REM Create the post file
REM ==========================================
ECHO creating post %FILE_NAME%
COPY _posts\post.template _posts\%FILE_NAME%
