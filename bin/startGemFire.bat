@echo off

SETLOCAL

set TEST_CASE_HOME=%~dp0\..

call %TEST_CASE_HOME%\bin\setGemFireEnv.bat

if ERRORLEVEL 1 goto END

call gemfire start-locator -dir=%TEST_CASE_HOME%\data\locator -port=55221

start /MIN cmd /c "%TEST_CASE_HOME%\bin\startCacheServer.bat 1"
start /MIN cmd /c "%TEST_CASE_HOME%\bin\startCacheServer.bat 2"
start /MIN cmd /c "%TEST_CASE_HOME%\bin\startCacheServer.bat 3"

:END
ENDLOCAL
