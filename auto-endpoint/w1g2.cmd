@echo off
setlocal
set WG=w1g2
set CONF=%USERPROFILE%\Desktop\%WG%.conf
set SCID=WireGuardTunnel$%WG%

if not exist "%CONF%" (
  echo ERROR: Fail to locate "%CONF%"
  goto :end
)
call :getvar "interface" inf
if [%inf%]==[] goto :begin
if [%inf%]==[%WG%] goto :probe
echo Deactivate tunnel "%inf%" before run this again
goto :end

:begin
call :verify && goto :boot
echo Install %SCID% service
wireguard.exe /installtunnelservice "%CONF%"
call :verify && goto :boot
echo ERROR: Fail to install %SCID%
goto :end

:boot
echo Start %SCID%
call :service start || goto :err

:probe
echo - Querying w1g2.com for wireguard endpoint ...
call :getvar "endpoint" pep
echo.    From %COMPUTERNAME%: Endpoint = %pep%
call :service stop
set ep=
for /f "tokens=1" %%i in ('PowerShell -Command "(Invoke-WebRequest -TimeoutSec 9 -UseBasicParsing https://w1g2.com/run/wall).Content" 2^>nul ^| findstr /c:"192.168.1%pep:~-2%."') do set ep=%%i
if [%ep%]==[] (
  echo WARNING: Fail to query w1g2.com
) else (
  echo.    From w1g2.com: Endpoint = %ep%
)

echo Restart %SCID%
call :service start || goto :err
if [%ep%]==[] goto :loop
call :getvar "peer" pkey
wg.exe set %WG% peer "%pkey%" endpoint "%ep%"

:loop
echo - Pinging w1g2.com for wireguard received ...
call :getrx prx
ping w1g2.com >nul
call :getrx rx
echo.    Received(B) before and after ping: %prx% - %rx%
if not [%prx%]==[%rx%] (
  set bell=
  goto :quest
)
if [%bell%]==[] (
  echo 
  set bell=*
  goto :probe
)
echo.
choice.exe /c MS /d M /t 30 /m "Keep querying endpoint? [M]ore | Skip "
if errorlevel 2 goto :quest
if errorlevel 1 goto :probe
if errorlevel 0 goto :probe

:quest
wg.exe
echo.
echo %DATE% %TIME%
choice.exe /c CQE /d C /t 300 /m "[C]heck received | Query endpoint | Exit wireguard "
if errorlevel 3 goto :undo
if errorlevel 2 goto :probe
if errorlevel 1 goto :loop
if errorlevel 0 goto :loop


:err
echo ERROR: Fail to start %SCID%

:undo
echo Uninstall %SCID% service
call :service stop
wireguard.exe /uninstalltunnelservice %WG%
call :verify || goto :end
echo ERROR: Fail to uninstall %SCID%

:end
endlocal
pause
goto :eof



:verify
sc query %SCID% 1>nul 2>&1
exit /b %errorlevel%

:service
sc %1 %SCID% >nul
timeout /t 5 /nobreak >nul
sc query %SCID% | findstr /r /c:"STATE .* RUNNING" >nul
exit /b %errorlevel%

:getvar
set %2=
for /f "tokens=2" %%i in ('wg.exe ^| findstr /i /c:"%~1:"') do set %2=%%i
goto :eof

:getrx
set %1=
for /f "tokens=2" %%i in ('wg.exe show %WG% transfer') do set %1=%%i
goto :eof