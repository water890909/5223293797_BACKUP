@echo off
setlocal enabledelayedexpansion

set min=700
set max=1200

:loop_start
rem Generate random number between %min% and %max%
set /a range=%max% - %min% + 1
set /a myRandomVar=%RANDOM% %% range + %min%

rem Beep with random frequency
powershell -Command "[console]::beep(!myRandomVar!,100)"
echo Beep with frequency: !myRandomVar!

timeout /t 0.1 >nul
goto loop_start