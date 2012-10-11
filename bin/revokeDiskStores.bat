@echo off

SETLOCAL

set TEST_CASE_HOME=%~dp0\..

call %TEST_CASE_HOME%\bin\setGemFireEnv.bat

if ERRORLEVEL 1 goto END

SET JAVA_ARGS=-Dgemfire.locators=localhost[55221]

echo "List of missing disk stores"
call gemfire list-missing-disk-stores
call gemfire list-missing-disk-stores | find "DiskStore" > temp.txt

For /F "tokens=3,4" %%i in ( temp.txt ) do (
    set missing_disk_store_file=%%j
    set missing_disk_store=%%i %%j
)

if  "%missing_disk_store%" == "" (
	echo Nothing to revoke at this time.
) else (
    del /Q /S %missing_disk_store_file%
	echo Revoking missing disk store: %missing_disk_store%
	call gemfire revoke-missing-disk-store %missing_disk_store%
)

:END
ENDLOCAL

