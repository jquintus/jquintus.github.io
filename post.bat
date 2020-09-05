@ECHO OFF
REM ============================================================================
REM Create a new blog post.
REM
REM If you don't specify a post name on the command line, you will be prompted
REM for one.
REM
REM USAGE
REM
REM     post.bat                           You will be prompted for a post name
REM                                        wnd a new post ill be created and put 
REM                                        in your post directory
REM
REM     post.bat My Post Name              A new post named [date]_My_Post_Name
REM                                        will be created and put in your post 
REM                                        directory
REM ============================================================================

REM ==========================================
REM Get the post name portion of the file name
REM ==========================================

if "%*."=="." (
    ECHO Name your post:
    SET /p POST_NAME=
) else (
    ECHO Creating post named %*
    SET POST_NAME=%*
)

REM ==========================================
REM Get the date portion of the file name
REM ==========================================
SET DATE_dd=%date:~7,2%
SET DATE_mm=%date:~4,2%
SET DATE_yyyy=%date:~10,4%
SET DATE_STAMP=%DATE_yyyy%-%DATE_mm%-%DATE_dd%

REM Create the year folder if it doesn't exist
IF NOT EXIST "_posts\%DATE_yyyy%" MKDIR "_posts\%DATE_yyyy%"

REM ==========================================
REM Concat and normalize the file name
REM ==========================================

SET FILE_NAME=%DATE_yyyy%\%DATE_STAMP%-%POST_NAME%
SET FILE_NAME=%FILE_NAME: =-%

REM ==========================================
REM Create the post file if it doesn't exist
REM then open it.
REM ==========================================
IF NOT EXIST "_posts\%FILE_NAME%.md" (
    ECHO creating post %FILE_NAME%...
    COPY _posts\template.md _posts\%FILE_NAME%.md
)
ECHO opening post %FILE_NAME%
start _posts\%FILE_NAME%.md

REM ==========================================
REM Create the image folder if it doesn't exist
REM ==========================================
IF NOT EXIST "images\posts\%FILE_NAME%" (
    ECHO creating image folders %FILE_NAME%...
    MKDIR images\posts\%FILE_NAME%
    MKDIR images\posts\%FILE_NAME%\thumbnails
)

