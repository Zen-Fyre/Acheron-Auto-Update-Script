@echo off
POWERSHELL Invoke-WebRequest https://nightly.link/ouwou/acheron/workflows/build/master/acheron-windows-MinSizeRel.zip -OutFile Acheron.zip
	7z x -y Acheron.zip
	DEL Acheron.zip

start "" "acheron.exe"
exit /b