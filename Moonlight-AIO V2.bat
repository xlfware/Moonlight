:Moonlight
@echo off && Title Moonlight && chcp 65001 >nul && for /f %%i in ('curl ifconfig.me') do set localIp=%%i >nul && setlocal enabledelayedexpansion && cls
net session >nul 2>&1
if %errorLevel% == 0 (
    set Admin=[32mEnabled[0m
) else (
    set Admin=[31mDisabled[0m
)
cls
echo                                            [91m__  ___                  ___       __    __[0m && echo                                           [91m/  ^|/  ____  ____  ____  / ( )___ _/ /_  / /_[0m && echo                                          [96m/ /^|_/ / __ \/ __ \/ __ \/ / / __ `/ __ \/ __/[0m && echo                                   [91m_.._[0m  [96m/ /  / / /_/ / /_/ / / / / / / /_/ / / / / /_[0m && echo                                 [91m.' .-'`[0m[95m/_/  /_/\____/\____/_/ /_/_/_/\__, /_/ /_/\__/[0m && echo                                [96m/  /[0m [90mThe premium AIO experience[0m      [95m/____/[0m && echo                                [96m^|  ^|[0m    [90mLocal IP:[0m[31m%localIp%[0m[90mAdmin^?:[0m%Admin% && echo                                [96m\  '.___.;[0m && echo                                 [95m'._  _.'[0m && echo                                    [95m``[0m
set "phrases[0]=What goes around..." && set "phrases[1]=Sow evil, reap results." &&  set "phrases[2]=Ruin them." &&  set "phrases[3]=Make them pay..."  &&  set "phrases[4]=Retribution lurks." &&  set "phrases[5]=Pain begets suffering." &&  set "phrases[5]=Retribution lurks." &&  set "phrases[6]=Retaliation looms." && set /a "quote1=!random! %% 4" && set /a "quote2=!random! %% 7"

echo                                 ─┬─
echo                                  │[4;37m!phrases[%quote1%]![0m
echo                                  │
echo                                  ├┬──1^|IP-Tools
echo                                  │└────contains IP look ups and tracers etc...
echo                                  │
echo                                  ├──┬──Installer
echo                                  │  └────contains basic installers and custom setups
echo                                  │   ─┬─
echo                                 ─┴─   │[4;37m!phrases[%quote2%]![0m
echo                                       │
echo                                       ├┬──Title
echo                                       │└────Info
echo                                       │
echo                                       ├──┬──Title
echo                                       │  └────disc
echo                                       │
echo                                      ─┴─

set /p SY=Type option:
if "%SY%"=="1" goto IP-Tools
if "%SY%"=="2" goto Installer
if "%SY%"=="3" goto 
if "%SY%"=="4" goto 

:ERROR



:IP-Tools
cls
set webclient=webclient
set localversion=1.8.0.5
if exist "%temp%\%webclient%.vbs" del "%temp%\%webclient%.vbs" /f /q /s >nul
:menu
title Moonlight^>IP Multi Tool
mode con lines=24 cols=70
set ip=127.0.0.1
set action=0
cls
echo [37m IP-Multi-Tool v%localversion%        Your IP Address is: %localIp%
echo.
echo [91m1 ^| View IP                            6 ^| Website IP
echo [96m         View your personal IP                   Lookup a website IP
@ping -n 1 -w 1000 0.0.0.1 > NUL 
echo.
echo [91m2 ^| IP lookup                          7 ^| WhoIs Lookup
echo [96m         Lookup an IP                            Domain data
@ping -n 1 -w 1000 0.0.0.1 > NUL 
echo.
echo [91m3 ^| IP ping                            8 ^| NSLookup
echo [96m          Ping an IP                             Host name look up
@ping -n 1 -w 1000 0.0.0.1 > NUL
echo.
echo [91m4 ^| IP TraceRoute                      9 ^| Response Text
echo [96m          TraceRoute an IP                       Response Log
@ping -n 1 -w 1000 0.0.0.1 > NUL
echo.
echo [91m5 ^| IP PortScan                       10 ^| Return to moonlight hub
echo [96m          Portscan an IP                         mrrp
@ping -n 1 -w 1000 0.0.0.1 > NUL

echo [37m
:action
set /p action=Type your choice:
if '%action%'=='1' echo sUrl = "https://api.ddosfilter.net/IPLookupAPI.php" > %temp%\%webclient%.vbs & echo sRequest = "key=riB7e0h8BROyidr8KIdEJOfRAfrOsweN" >> %temp%\%webclient%.vbs && title Moonlight^>IP Multi Tool^>IP & goto apirequest
if '%action%'=='2' goto iplookup
if '%action%'=='3' goto ipping
if '%action%'=='4' goto traceroute
if '%action%'=='5' goto portscan
if '%action%'=='6' goto cfresolver
if '%action%'=='7' goto whois
if '%action%'=='8' goto nslookup
if '%action%'=='9' goto opentext
if '%action%'=='10' goto Moonlight
echo.
echo Please enter a valid choice.
echo.
goto action
:apirequest
if exist "%temp%\response.txt" del "%temp%\response.txt" /f /q /s >nul
if %action% NEQ update (
set rqst_type=POST
cls
echo.
echo  Waiting for API response. . .
)
echo set oHTTP = CreateObject("MSXML2.ServerXMLHTTP.6.0") >> %temp%\%webclient%.vbs
echo oHTTP.open "%rqst_type%", sUrl,false >> %temp%\%webclient%.vbs
echo oHTTP.setRequestHeader "Content-Type", "application/x-www-form-urlencoded" >> %temp%\%webclient%.vbs
echo oHTTP.setRequestHeader "Content-Length", Len(sRequest) >> %temp%\%webclient%.vbs
echo oHTTP.send sRequest >> %temp%\%webclient%.vbs
echo HTTPGET = oHTTP.responseText >> %temp%\%webclient%.vbs
echo strDir = "%temp%\response.txt" >> %temp%\%webclient%.vbs
echo set objFSO = CreateObject("Scripting.FileSystemObject") >> %temp%\%webclient%.vbs
echo set objFile = objFSO.CreateTextFile(strDir) >> %temp%\%webclient%.vbs
echo objFile.Write(HTTPGET) >> %temp%\%webclient%.vbs
echo objFile.Close >> %temp%\%webclient%.vbs
echo Wscript.Quit >> %temp%\%webclient%.vbs
start %temp%\%webclient%.vbs
set /a requests=0
:checkresponseexists
set /a requests=%requests% + 1
if %requests% gtr 10 goto failed
IF EXIST "%temp%\response.txt" (
goto response_exist
) ELSE (
ping 127.0.0.1 -n 2 -w 1000 >nul
goto checkresponseexists
)
:failed
tasklist | find "wscript.exe" >nul
if %errorlevel% EQU 0 taskkill /f /im wscript.exe >nul
del "%temp%\%webclient%.vbs" /f /q /s >nul
echo.
echo  Did not receive a response from the API.
echo.
pause
goto menu
:response_exist
del "%temp%\%webclient%.vbs" /f /q /s >nul
if %action% EQU update if '%dlupdate%'=='y' goto update
find "error code: 1006" %temp%\response.txt >nul
if %errorlevel% EQU 0 goto banned
find "One more step" %temp%\response.txt >nul
if %errorlevel% EQU 0 goto cbanned
find "Web server is down" %temp%\response.txt >nul
if %errorlevel% EQU 0 goto offline
find "Connection timed out" %temp%\response.txt >nul
if %errorlevel% EQU 0 goto offline
find "404 Not Found" %temp%\response.txt >nul
if %errorlevel% EQU 0 goto offline
goto verified
:banned
cls && echo. && echo  Error: You have been banned for abuse. && ping 127.0.0.1 -n 4 -w 1000 >nul && del "%temp%\response.txt" /f /q /s >nul && goto Moonlight
:cbanned
cls && echo. & echo  Error: Your IP has been blocked for security purposes. && echo  Sorry for any inconvinience. && echo  If you are using a VPN and have received this error message, && echo  turn off the VPN, and try again. && ping 127.0.0.1 -n 8 -w 1000 >nul && del "%temp%\response.txt" /f /q /s >nul goto Moonlight
:offline
cls && echo. && echo  Error: The API is offline. && ping 127.0.0.1 -n 4 -w 1000 >nul && del "%temp%\response.txt" /f /q /s >nul && goto Moonlight
:verified
set "data=findstr /R /N "^^" %temp%\response.txt | find /C ":"",
for /f %%i in ('!data!') do set lines=%%i
if %lines% LSS 10 (
set /a lines=20
) else (
set /a lines=%lines% + 3
)
if '%action%'=='update' goto checkversion
if '%action%'=='1' goto parseiplookup
if '%action%'=='2' goto parseiplookup
if '%action%'=='5' goto parsepscan
if '%action%'=='6' goto parsecfresolver
if '%action%'=='7' goto parsewhois
goto menu
:iplookup
title Moonlight^>IP-Tools^>IP Lookup && cls && echo. && echo                          Type an IP to lookup && echo.
set /p ip=IP: 
echo sUrl = "https://api.ddosfilter.net/IPLookupAPI.php" > %temp%\%webclient%.vbs
echo sRequest = "key=riB7e0h8BROyidr8KIdEJOfRAfrOsweN&ip=%ip%" >> %temp%\%webclient%.vbs
goto apirequest
:parseiplookup
mode con lines=%lines% cols=70
cls
echo.
for /f "delims=     " %%i in ('findstr /i ":" %temp%\response.txt') do (
    set data=%%i
    echo !data!
)
echo.
pause
goto menu
:ipping
title Moonlight^>IP Multi Tool^>Pinger
set /a replies=0
set /a timeouts=0
set /a packets_sent=0
set responsetime=N/A
set avgtime=N/A
set min=N/A
set max=N/A
cls
echo. && echo                       Type an IP or URL to ping && echo.
set /p ip=Host: 
echo.
set /p ipv6= IPv6? y/n: 
if '%ipv6%'=='y' (
    set tokens=5
    set searchstring=: time
) else (
    set tokens=7
    set searchstring=time
)
mode con lines=16 cols=30
:ping
set success=false
for /F "tokens=%tokens% delims=<>= " %%i in ('ping -n 1 %ip% ^| find "%searchstring%"') do (
    set responsetime=%%i
    set responsetime=!responsetime:~0,-2!
    set success=true
)
set /a packets_sent=packets_sent + 1
if %replies% EQU 0 if %success% EQU true if %replies% NEQ N/A set min=99999 & set max=0
if %success% EQU false (
    set status=Host is offline
    set /a timeouts=timeouts + 1
    color 0C
) else (
    set status=Host is online
    set /a replies=replies + 1
    set /a totaltime=%totaltime% + %responsetime%
    set /a avgtime=totaltime / replies
    color 0A
    if %responsetime% LSS %min% (
        set min=%responsetime%
    )
    if %responsetime% GTR %max% (
        set max=%responsetime%
    )
)
set /a packet_loss=((packets_sent-timeouts)*100)/packets_sent
cls
echo Pinging %ip% && echo. && echo  %status%^^! && echo. && echo  Successful Replies: %replies% && echo. && echo  Requests Timed Out: %timeouts% && echo. && echo  Success Percentage: %packet_loss% && echo. && echo  Avrg Response Time: %avgtime%ms && echo. && echo  Last Response Time: %responsetime%ms && echo. && echo  Min: %min%ms  Max: %max%ms && ping 127.0.0.1 -n 2 -w 1000 >nul && goto ping
:traceroute
title Moonlight^>IP Multi Tool^>Trace Route
mode con lines=30 cols=100
cls
echo.
echo                                   Type an IP or URL to trace route
echo.
set /p ip=Host: 
tracert %ip%
echo.
pause
goto menu
:portscan
cls
echo.
echo                        Type a host to port scan
echo.
set /p ip=Host: 
echo sUrl = "https://api.ddosfilter.net/PortScanAPI.php" > %temp%\%webclient%.vbs
echo sRequest = "key=riB7e0h8BROyidr8KIdEJOfRAfrOsweN&ip=%ip%" >> %temp%\%webclient%.vbs
goto apirequest
:parsepscan
mode con lines=%lines% cols=70
cls
echo.
for /f "delims=     " %%i in ('findstr /i "Results Port Error" %temp%\response.txt') do (
    set data=%%i
    echo !data!
)
echo.
pause
goto menu
:cfresolver
title Moonlight^>IP Multi Tool^>Resolver
cls
echo.
echo                         Type a domain to resolve
echo.
set /p ip=Domain: 
echo sUrl = "https://api.ddosfilter.net/CFResolverAPI.php" > %temp%\%webclient%.vbs
echo sRequest = "key=riB7e0h8BROyidr8KIdEJOfRAfrOsweN&host=%ip%" >> %temp%\%webclient%.vbs
goto apirequest
:parsecfresolver
mode con lines=%lines% cols=70
cls
echo.
for /f "delims=     " %%i in ('findstr /i "IP Error" %temp%\response.txt') do (
    set data=%%i
    echo !data!
)
echo.
pause
goto menu
:whois
title Moonlight^>IP Multi Tool^>WhoIs
cls
echo.
echo                       Type a host to WhoIs lookup
echo.
set /p ip=Host: 
echo sUrl = "https://api.ddosfilter.net/WhoIsAPI.php" > %temp%\%webclient%.vbs
echo sRequest = "key=riB7e0h8BROyidr8KIdEJOfRAfrOsweN&host=%ip%" >> %temp%\%webclient%.vbs
goto apirequest
:parsewhois
mode con lines=%lines% cols=100
cls
echo.
for /f "delims=     " %%i in ('findstr /i ":" %temp%\response.txt') do (
    set data=%%i
    echo !data!
)
echo.
pause
goto menu
:nslookup
title Moonlight^>IP Multi Tool^>NSLookup
cls
echo.
echo                    Type an IP or Domain to NSLookup
echo.
set /p ip=Host: 
cls
echo.
echo Name Server Look up using Cloudflare DNS. . .
echo.
nslookup %ip% 1.1.1.1
echo.
pause
goto menu
:opentext
if exist "%temp%\response.txt" start %temp%/response.txt
goto menu
exit
:::END OF IP-TOOLS
:::^ Still needs optimizing 

:Installer
title Moonlight^>Installer && cls
