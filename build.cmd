@echo off
setlocal enabledelayedexpansion
set ROOTDIR=%~dp0
set OUTDIR=%ROOTDIR%\output
set ONLYTHIS=%1
if not exist "%OUTDIR%\." mkdir "%OUTDIR%"
pushd "%OUTDIR%"
for /f %%a in ('dir /s /b %ROOTDIR%\*.nuspec') do (
	if "%1"=="" set ONLYTHIS=%%~na
	if "!ONLYTHIS!"=="%%~na" (
		echo Packing %%~na
		call cpack %%a
	)
)
popd
