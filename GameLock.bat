@echo off
title GameLock
del 
set GamePath=D:\ExampleGame\CoreFiles\

::find 3 or 4 files that the game connot function without in the games directory and upload them to a site like discord
::make this part of the code (and the part on the bottom) delete the files
del /f /s /q %GamePath%\ExampleCoreFile.dll
del /f /s /q %GamePath%\ExampleCoreFile2.dll
del /f /s /q %GamePath%\ExampleCoreFile3.dll

:password
cls
echo.
echo  ==============================
echo      ENTER THE PASSWORD
echo  ==============================
echo.
set /p key=PASSWORD:

:verify
::SET YOUR PASSWORD BELOW
if /i "%key%"=="ChangeMe" goto yes
cls
echo.
echo   ==============================
echo     WRONG PASSWORD! TRY AGAIN!
echo   ==============================
echo.
pause >nul
goto password

:yes
echo FIXING!
timeout /t 3 >nul
cls

::Make this part download the files that you previously deleted
set url1=https://cdn.discordapp.com/attachments/PUTLINKHERE/ExampleCoreFile.dll >nul
set file1=ExampleCoreFile.dll >nul
certutil -urlcache -split -f %url1% %file1% >nul
cls
move %file1% %GamePath%\%file1% >nul
cls

set url2=https://cdn.discordapp.com/attachments/PUTLINKHERE/ExampleCoreFile2.dll >nul
set file2=ExampleCoreFile2.dll >nul
certutil -urlcache -split -f %url2% %file2% >nul
cls
move %file2% %GamePath%\%file2% >nul
cls

set url3=https://cdn.discordapp.com/attachments/PUTLINKHERE/ExampleCoreFile3.dll >nul
set file3=ExampleCoreFile3.dll >nul
certutil -urlcache -split -f %url3% %file3% >nul
cls
move %file3% %GamePath%\%file3% >nul
cls

echo DONE!
echo.
echo OPENING THE GAME!

::CHANGE THIS
start %GamePath%\Game.exe

cls
echo DO NOT CLOSE THIS WINDOW.
timeout /t 5 >nul

:processscan1
::CHANGE GAME.EXE TO YOUR GAMES PROCESS NAME
tasklist | find /i "Game.exe" >nul 2>&1
if errorlevel 1 (
::change "goto del" to "goto processscan2" if you need to scan for two seperate processes
  goto del
) else (
  cls
  echo DO NOT CLOSE THIS WINDOW.
  echo BeamNG is still running.
  timeout /t 6 >nul
  goto processscan1
)

::UNUSED CODE
:processscan2
tasklist | find /i "BeamNG.drive.x64" >nul 2>&1
if errorlevel 1 (
  goto del
) else (
  cls
  echo DO NOT CLOSE THIS WINDOW.
  echo BeamNG is still running.
  echo.
  timeout /t 6 >nul
  goto processscan1
)
::UNUSED CODE

::REUSE THE CODE FROM THE TOP PART OF THE FILE
:del
del /f /s /q %GamePath%\ExampleCoreFile.dll
del /f /s /q %GamePath%\ExampleCoreFile2.dll
del /f /s /q %GamePath%\ExampleCoreFile3.dll
echo DONE!
timeout /t 3 >nul
exit