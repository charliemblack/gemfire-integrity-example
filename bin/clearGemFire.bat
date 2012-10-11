@echo off

SETLOCAL

set TEST_CASE_HOME=%~dp0\..

IF EXIST %TEST_CASE_HOME%\data\server1 del /q %TEST_CASE_HOME%\data\server1\*.*
IF EXIST %TEST_CASE_HOME%\data\server2 del /q %TEST_CASE_HOME%\data\server2\*.*
IF EXIST %TEST_CASE_HOME%\data\server3 del /q %TEST_CASE_HOME%\data\server3\*.*
IF EXIST %TEST_CASE_HOME%\data\locator del /q %TEST_CASE_HOME%\data\locator\*.*

IF NOT EXIST %TEST_CASE_HOME%\data md %TEST_CASE_HOME%\data
IF NOT EXIST %TEST_CASE_HOME%\data\server1 md %TEST_CASE_HOME%\data\server1
IF NOT EXIST %TEST_CASE_HOME%\data\server2 md %TEST_CASE_HOME%\data\server2
IF NOT EXIST %TEST_CASE_HOME%\data\server3 md %TEST_CASE_HOME%\data\server3
IF NOT EXIST %TEST_CASE_HOME%\data\locator md %TEST_CASE_HOME%\data\locator

ENDLOCAL