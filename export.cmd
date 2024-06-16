:: Exports plugin as a .zip file for installation in Kodi
@echo off

:: Zip path
Set "zip-path=C:\Program Files\7-Zip"
Set "zip=%zip-path%\7z.exe"

:: Kodi addon directory
Set "export-dir=%1"
Set "work-dir=%~dp0"

:: Top-level files & dirs
Set "main=%work-dir%\default.py"
Set "fanart=%work-dir%\fanart.jpg"
Set "icon=%work-dir%\icon.jpg"
Set "addon=%work-dir%\addon.xml"
Set "lic=%work-dir%\LICENSE"
Set "lib=%work-dir%\lib"
Set "resources=%work-dir%\resources"

:: Zip plugin
Set "archive=%work-dir%\screensaver.galeria"

:: Create tmp dir
echo Creating temporary directory...
IF EXIST %archive% (rmdir /S /Q %archive%)
mkdir %archive%

:: Copy files to tmp dir
echo Copying files to tmp dir: %archive%...
COPY %main% "%archive%\"
COPY %addon% "%archive%\"
COPY %fanart% "%archive%\"
COPY %icon% "%archive%\"
COPY %lic% "%archive%\"
XCOPY /e /y /q %lib% "%archive%\lib\"
XCOPY /e /y /q %resources% "%archive%\resources\"
echo Zipping plugin...
"%zip%" a -tzip "%archive%.zip" "%archive%"

:: Copy archive to export dir
echo Exporting plugin to: %export-dir%...
MOVE "%archive%.zip" %export-dir%

:: Remove temp files
echo Removing temporary files...
rmdir /s/q %archive%
echo Done.