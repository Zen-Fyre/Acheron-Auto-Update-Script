@echo off

::start minimized from https://stackoverflow.com/a/22357573
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit 


SETLOCAL ENABLEDELAYEDEXPANSION

:: Configuring the path of 7z in case no 7z for is installed 
::eg. NanaZip from v1 and stop unecessary download if not found

SET "7zipDir="
IF DEFINED 7z SET "7zipDir=%7z%"
IF NOT DEFINED 7zipDir IF EXIST "%programfiles%\7-Zip" (SET "7zipDir=%programfiles%\7-Zip\7z.exe")
IF NOT DEFINED 7zipDir call :7z_missing


::Start download/Unzip

SET "BLACKLISTED=FALSE"

CURL -o Acheron.zip -L "https://nightly.link/ouwou/acheron/workflows/build/master/acheron-windows-MinSizeRel.zip"
FOR /F "SKIP=1 TOKENS=1" %%A IN ('CERTUTIL -HASHFILE "Acheron.zip" SHA256') DO IF NOT DEFINED HASH SET "HASH=%%A"
CURL -o BLACKLIST.TXT -L "https://raw.githubusercontent.com/Zen-Fyre/Acheron-Auto-Update-Script/main/sha256-blacklist"
FOR /F "SKIP=3 DELIMS=: TOKENS=2" %%A IN (BLACKLIST.TXT) DO (
	IF /i "%HASH%"=="%%A" (
		SET "BLACKLISTED=TRUE"
		ECHO GOT BLACKLISTED
		)
	ECHO %HASH%
	ECHO %%A
	)
IF !BLACKLISTED!==FALSE ("!7zipDir!" -y x Acheron.zip)
DEL Acheron.Zip
DEL BLACKLIST.TXT
START Acheron.exe
EXIT /b


:7z_missing
ECHO Standard install of 7z detected, nor a ENV PATH is set
ECHO Please set a ENV PATH of 7z[fork] or install 7z to get it located on "%programfiles%\7-Zip\7z.exe"
ECHO.
PAUSE
EXIT
