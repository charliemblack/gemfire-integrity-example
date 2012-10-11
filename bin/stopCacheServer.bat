@echo off

SETLOCAL

set ARGC=0
for %%i in (%*) do set /A ARGC+=1

if %ARGC% NEQ 1 GOTO USAGE

set TEST_CASE_HOME=%~dp0\..

call %TEST_CASE_HOME%\bin\setGemFireEnv.bat

if ERRORLEVEL 1 goto END

IF %1==1 GOTO STOPSERVER
IF %1==2 GOTO STOPSERVER
IF %1==3 GOTO STOPSERVER

GOTO USAGE

:STOPSERVER

call cacheserver stop -dir=%TEST_CASE_HOME%/data/Server%1

GOTO END

:USAGE
echo Usage: The valid range for stopCacheServer is 1-3.   Example: stopCacheServer 1

:END
ENDLOCAL