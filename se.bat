@echo off
echo.
echo RailsInstaller for Training
set PATH=C:\RailsInstaller\Git\cmd;C:\RailsInstaller\Ruby1.9.3\bin;%PATH%
echo --- Updated Path -----------------------------------------------------------------------------
path
echo ----------------------------------------------------------------------------------------------
call sp T19
if "%1" == "b" call bi.bat
