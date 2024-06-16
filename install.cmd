:: Installs (updates) plugin files in Kodi installation directory.
@echo off

echo Installing Galeria for Kodi...
:: Kodi addon directory
Set "kodi-dir=%APPDATA%\Kodi\addons\screensaver.picture.galeria\"
Set "work-dir=%~dp0"
:: Top-level files & dirs
Set "main=%work-dir%\default.py"
Set "fanart=%work-dir%\fanart.jpg"
Set "icon=%work-dir%\icon.png"
Set "addon=%work-dir%\addon.xml"
Set "lib=%work-dir%\lib"
Set "resources=%work-dir%\resources"

echo Copying data from %main% to %kodi-dir%...
echo Installing addon...
COPY %main% %kodi-dir%
COPY %fanart% %kodi-dir%
COPY %icon% %kodi-dir%
COPY %addon% %kodi-dir%
echo Installing resources...
XCOPY /y /s /q %lib% "%kodi-dir%lib\"
XCOPY /y /s /q %resources% "%kodi-dir%resources\"
echo Done.