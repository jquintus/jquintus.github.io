@ECHO OFF
REM ============================================================================
REM List all of the currently defined categories
REM Requires the following *nix tools
REM     grep
REM     sed
REM     sort
REM     uniq
REM ============================================================================

echo Software Categories
echo -------------------
grep -h category: _software\*.md | sed -e "s/category:\s*//g" | sort | uniq
echo.
