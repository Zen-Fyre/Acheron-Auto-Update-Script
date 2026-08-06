@echo off
START "Acheron updater" /min cmd /c "curl -o Acheron.zip -LJO https://nightly.link/ouwou/acheron/workflows/build/master/acheron-windows-MinSizeRel.zip && 7z -y x Acheron.zip && DEL Acheron.Zip && Start Acheron.exe"
exit /b
