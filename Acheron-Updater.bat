@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

:: Configuring the path of 7z in case no 7z for is installed 
::eg. NanaZip from v1 and stop unecessary download if not found

SET "7zipDir="
IF DEFINED 7z SET "7zipDir=%7z%"
IF NOT DEFINED 7zipDir IF EXIST "%programfiles%\7-Zip" (SET "7zipDir=%programfiles%\7-Zip\7z.exe")
IF NOT DEFINED 7zipDir call :7z_missing



::Start download/Unzip on background

START "Acheron updater" /MIN CMD /c ^
"CURL -o Acheron.zip -L https://nightly.link/ouwou/acheron/workflows/build/master/acheron-windows-MinSizeRel.zip ^
&"!7zipDir!" -y x Acheron.zip ^
& DEL Acheron.Zip ^
& START Acheron.exe ^
& EXIT /b"

EXIT /b


:7z_missing
ECHO Standard install of 7z detected, nor a ENV PATH is set
ECHO Please set a ENV PATH of 7z[fork] or install 7z to get it located on "%programfiles%\7-Zip\7z.exe"
ECHO.
PAUSE
EXIT /B
