@echo off

SETLOCAL

set ARGC=0

for %%i in (%*) do set /A ARGC+=1

if %ARGC% NEQ 1 GOTO USAGE

set TEST_CASE_HOME=%~dp0\..

call %TEST_CASE_HOME%\bin\setGemFireEnv.bat

if ERRORLEVEL 1 goto END

IF %1==1 GOTO RUNSERVER
IF %1==2 GOTO RUNSERVER
IF %1==3 GOTO RUNSERVER

GOTO USAGE

:RUNSERVER

del %TEST_CASE_HOME%\data\server%1\.cacheserver.ser
call cacheserver start -rebalance -J-DgemfirePropertyFile=%TEST_CASE_HOME%\resources\gemfire.properties  cache-xml-file=%TEST_CASE_HOME%\resources\server.xml -dir=%TEST_CASE_HOME%\data\server%1 log-level=info

GOTO END

USAGE:

echo Usage: The valid range for startCacheServer is 1-3. Example: startCacheServer 1

:END
ENDLOCAL
