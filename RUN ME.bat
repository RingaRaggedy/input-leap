@echo off
title Input Leap Server - Jer-Desktop
set "SERVER=D:\ai\NVMe\GitHub\input-leap\build-msvc\bin\Release\input-leaps.exe"
set "CONFIG=C:\Users\miles\input-leap.sgc"

if not exist "%SERVER%" (
 echo ERROR: Server executable not found:
 echo %SERVER%
 pause
 exit /b 1
)
if not exist "%CONFIG%" (
 echo ERROR: Configuration file not found:
 echo %CONFIG%
 pause
 exit /b 1
)

echo Input Leap Server - Jer-Desktop
echo Waiting for scummbox...
echo Leave this window open. Press Ctrl+C to stop.
echo.
"%SERVER%" -f --disable-crypto --name Jer-Desktop -c "%CONFIG%"

echo.
echo Input Leap server stopped.
pause
