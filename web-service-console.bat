@echo off
chcp 65001
color 3
title "Управление веб-службами"
cls
if [%1]==[] goto mainloop
if %1==launch goto start_service
:mainloop
echo "Command?"
set /p command=
if %command%==start goto start_service
if %command%==stop goto stop_service
if %command%==stopexit goto stop_service
if %command%==exit! exit
if %command%==exit color 7 && exit /b 0
goto mainloop

:stop_service
net stop ApacheHTTPServer
net stop mysql80
cls
echo "Сервисы остановлены"
if %command%==stopexit exit
goto mainloop

:start_service
net start ApacheHTTPServer
net start mysql80
cls
echo "Сервисы запущены"
goto mainloop

pause
