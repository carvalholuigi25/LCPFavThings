@echo off
setlocal enableextensions

cd "C:\Users\Luis\Documents\Visual Studio 2022\Projects\LCPFTMain\LCPFavThingsWApi"
REM start chrome "https://192.168.1.67:5001/swagger"
dotnet run --launch-profile "LCPFavThingsWApi_Android"

pause
exit /b %errorlevel%
endlocal