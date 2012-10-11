@echo off

SETLOCAL

set TEST_CASE_HOME=%~dp0\..

call %TEST_CASE_HOME%\bin\setGemFireEnv.bat

if ERRORLEVEL 1 goto END

SET JAVA_ARGS=-Dgemfire.locators=localhost[55221]

call gemfire shut-down-all

call gemfire stop-locator -dir=%TEST_CASE_HOME%\data\locator -port=55221

:END
ENDLOCAL