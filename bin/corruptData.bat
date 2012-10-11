@echo off

SETLOCAL

set ARGC=0

for %%i in (%*) do set /A ARGC+=1

if %ARGC% NEQ 1 GOTO USAGE

set TEST_CASE_HOME=%~dp0\..

call %TEST_CASE_HOME%\bin\setGemFireEnv.bat

if ERRORLEVEL 1 goto END

IF %1==1 GOTO CORRUPT
IF %1==2 GOTO CORRUPT
IF %1==3 GOTO CORRUPT

GOTO USAGE

:CORRUPT

echo Corrupting server %1 data files
FOR %%i IN (%TEST_CASE_HOME%\data\server%1\*.krf) DO  (
    echo Corrupting %%i
    del /Q %%i
    fsutil file createnew %%i 256
)

GOTO END

:USAGE

echo Usage: The valid range for corruptData is 1-3.   Example: corruptData 1

:END
ENDLOCAL