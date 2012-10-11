@echo off

SETLOCAL

set TEST_CASE_HOME=%~dp0\..

call %TEST_CASE_HOME%\bin\setGemFireEnv.bat

if ERRORLEVEL 1 goto END

java  -DgemfirePropertyFile=%TEST_CASE_HOME%\resources\gemfire.properties  -Dgemfire.cache-xml-file=%TEST_CASE_HOME%\resources\client.xml demo.vmware.gemfire.poc.CacheLoader

:END
ENDLOCAL