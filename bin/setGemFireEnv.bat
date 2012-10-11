@echo off

set TEST_CASE_HOME=%~dp0\..

if DEFINED JAVA_HOME set PATH=%JAVA_HOME%\bin;%PATH%

REM  As an alternative you can also set the location of java here.
REM set PATH=c:\path\to\java\bin;%PATH%

set temp_filename=javaVersion%random%%time%.txt
set temp_filename=%temp_filename::=_%
set temp_filename=%temp_filename: =_%

java -fullversion > %temp_filename% 2>&1
For /F "tokens=4" %%i in ( %temp_filename% ) do set java_version=%%i
set java_version=%java_version:~1,3%
del  %temp_filename%

IF NOT "%java_version%" == "1.6" IF NOT "%java_version%" == "1.7" goto ERROR

REM set GEMFIRE=\path\to\gemfire

set PATH=%GEMFIRE%\bin;%PATH%
set CLASSPATH=%GEMFIRE%\lib\gemfire.jar;%GEMFIRE%\lib\antlr.jar;%TEST_CASE_HOME%\data_integrity.jar;%CLASSPATH%

IF EXIST %GEMFIRE%\lib\gemfire.jar goto END 

:ERROR
echo ERROR: Please set JAVA_HOME and GEMFIRE environment variables to match your environment.
exit /B 1

:END