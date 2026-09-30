@echo off
setlocal EnableExtensions
set "INPUTLEAP_EXE=D:\ai\NVMe\GitHub\input-leap\build-msvc\bin\Release\input-leap.exe"
set "QT_BIN=D:\ai\NVMe\Qt\6.11.2\msvc2022_64\bin"
if not exist "%INPUTLEAP_EXE%" (
 echo ERROR: Input Leap executable not found:
 echo %INPUTLEAP_EXE%
 pause
 exit /b 1
)
if not exist "%QT_BIN%" (
 echo ERROR: Qt runtime folder not found:
 echo %QT_BIN%
 pause
 exit /b 1
)
set "PATH=%QT_BIN%;%PATH%"
start "" "%INPUTLEAP_EXE%"
exit /b 0
