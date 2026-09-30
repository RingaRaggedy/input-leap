@echo off
setlocal EnableExtensions

echo ============================================================
echo Input Leap - Fix Qt Platform Plugin Deployment
echo ============================================================
echo.

set "BUILD=D:\ai\NVMe\GitHub\input-leap\build-msvc"
set "APP=%BUILD%\bin\Release\input-leap.exe"
set "DEPLOY=%BUILD%\qtDeploy"
set "QT=D:\ai\NVMe\Qt\6.11.2\msvc2022_64"
set "RUN=%BUILD%\run-input-leap"

if not exist "%APP%" goto NO_APP
if not exist "%DEPLOY%\platforms\qwindows.dll" goto NO_PLATFORM
if not exist "%QT%\bin\windeployqt.exe" goto NO_DEPLOYQT

echo Verified:
echo %APP%
echo.
echo Verified Qt platform plugin:
echo %DEPLOY%\platforms\qwindows.dll
echo.

echo Creating a self-contained runtime folder...
echo.

if exist "%RUN%" rmdir /s /q "%RUN%"
mkdir "%RUN%"

copy /y "%APP%" "%RUN%\input-leap.exe" >nul

echo Running Qt's deployment tool directly against the executable...
echo.

"%QT%\bin\windeployqt.exe" ^
    --release ^
    --compiler-runtime ^
    --dir "%RUN%" ^
    "%RUN%\input-leap.exe"

if errorlevel 1 goto DEPLOY_FAILED

echo.
echo Checking platform plugin...

if not exist "%RUN%\platforms\qwindows.dll" goto PLATFORM_FAILED

echo FOUND:
echo %RUN%\platforms\qwindows.dll

echo.
echo ============================================================
echo Launching self-contained Input Leap build
echo ============================================================
echo.

cd /d "%RUN%"
start "" "%RUN%\input-leap.exe"

echo.
echo Runtime folder:
echo %RUN%
echo.
echo If Input Leap opens, send me a screenshot of the window.
echo If another error appears, send me the exact error.
echo.
pause
exit /b

:NO_APP
echo ERROR: input-leap.exe is missing.
goto END

:NO_PLATFORM
echo ERROR:
echo The build's qwindows.dll is missing.
echo Expected:
echo %DEPLOY%\platforms\qwindows.dll
goto END

:NO_DEPLOYQT
echo ERROR: windeployqt.exe is missing.
goto END

:DEPLOY_FAILED
echo.
echo ERROR: windeployqt failed.
goto END

:PLATFORM_FAILED
echo.
echo ERROR:
echo windeployqt completed but platforms\qwindows.dll
echo was not deployed.
goto END

:END
echo.
pause