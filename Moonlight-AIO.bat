@echo off && title Moonlight && color 0F
:MH
cls
title Moonlight && color 0F

for /f %%i in ('curl ifconfig.me') do set localIp=%%i >nul && cls

net session >nul 2>&1
if %errorLevel% == 0 (
    set Admin=Enabled
) else (
    set Admin=Disabled
)
cls
echo Your IP Address is: %localIp%    Admin Privileges?: %Admin%
:::  .     ~+        .._     *                                              - produced by: Xlf
:::                .' .-'`           .     ,   *                            - https://feds.lol/xlf
:::   *      ,    /  /  MOONLIGHT                   .      ,       *        - 
:::       |      |  |     The premium AIO experience            .           - This script needs admin
:::     - o -     \  '.___.;       ,                      *                 - To fully work!
:::    ,  |        '._  _.'             *                      O            - 
:::          '        ``    *              ,          .   '                 - If you paid for this
:::     .                                       *                 *         - you got scammed. >.<
:::              *           .      *     ~+               .                - 
:::         .          *                      .                      '      - ©MOONLIGHT©

		   for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A

timeout /t 2 >nul
pause >nul

set /p SY=Type option:
if "%SY%"=="1" goto IP-tools
if "%SY%"=="2" goto Installer
if "%SY%"=="3" goto Sandbox
if "%SY%"=="4" goto 


:ERRORMOON
cls
title ERROR && color 04
set loopcount=100
:ERRORSMH
echo ERROR && @ping -n 1 -w 1000 0.0.0.1 > NUL
set /a loopcount=loopcount-1
if %loopcount%==0 goto ERRORSEMH
goto ERRORSMH
:ERRORSEMH
goto MH
exit

:IP-tools
setlocal ENABLEDELAYEDEXPANSION
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
if '%action%'=='10' goto MH
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
cls
echo.
echo  Error: You have been banned for abuse.
ping 127.0.0.1 -n 4 -w 1000 >nul
del "%temp%\response.txt" /f /q /s >nul
exit
:cbanned
cls
echo.
echo  Error: Your IP has been blocked for security purposes.
echo  Sorry for any inconvinience.
echo  If you are using a VPN and have received this error message,
echo  turn off the VPN, and try again.
ping 127.0.0.1 -n 8 -w 1000 >nul
del "%temp%\response.txt" /f /q /s >nul
exit
:offline
cls
echo.
echo  Error: The API is offline.
ping 127.0.0.1 -n 4 -w 1000 >nul
del "%temp%\response.txt" /f /q /s >nul
goto menu
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
title Moonlight^>IP Multi Tool^>IP Lookup
cls
echo.
echo                          Type an IP to lookup
echo.
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
echo.
echo                       Type an IP or URL to ping
echo.
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
echo Pinging %ip%
echo.
echo  %status%^^!
echo.
echo  Successful Replies: %replies%
echo.
echo  Requests Timed Out: %timeouts%
echo.
echo  Success Percentage: %packet_loss%
echo.
echo  Avrg Response Time: %avgtime%ms
echo.
echo  Last Response Time: %responsetime%ms
echo.
echo  Min: %min%ms  Max: %max%ms
ping 127.0.0.1 -n 2 -w 1000 >nul
goto ping
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

echo end of -IP Tools
exit

:Installer
title Moonlight^>Installer && cls && color 0F

echo [91m1 ^| Vencord
echo [96m        Discord Client
echo [36m            The cutest Discord client mod
@ping -n 1 -w 1000 0.0.0.1 > NUL 
echo.
echo [91m2 ^| Spicetify
echo [96m        Spotify client
echo [36m            Spotify's digital flavor
@ping -n 1 -w 1000 0.0.0.1 > NUL 
echo.
echo [91m3 ^| File Utility
echo [96m        Winrar/7-zip/etc...
echo [36m             Winrar Unlocker
@ping -n 1 -w 1000 0.0.0.1 > NUL  
echo.
echo [91m4 ^| Browsers
echo [96m        Edge/Opera/etc...
echo [36m             A small hub designed for browsers
@ping -n 1 -w 1000 0.0.0.1 > NUL  
echo.
echo [91m5 ^| Title Place Holder
echo [96m        Info Place Holder
echo [36m             Description Place Holder
@ping -n 1 -w 1000 0.0.0.1 > NUL  


timeout /t 2 >nul
pause >nul


set /p IS=Type option:
if "%IS%"=="1" goto Vencord
if "%IS%"=="2" goto Spicetify
if "%IS%"=="3" goto WinRAR
if "%IS%"=="4" goto Browsers
if "%IS%"=="5" goto 

:ERRORINSTALLER
cls
title ERROR && color 04
set loopcount=100
:ERRORSIS
echo ERROR && @ping -n 1 -w 1000 0.0.0.1 > NUL
set /a loopcount=loopcount-1
if %loopcount%==0 goto ERRORSEIS
goto ERRORSIS
:ERRORSEIS
goto Installer
exit

:Vencord
title Moonlight^>Installer^>Vencord
cls
set Moonlight=#E1qkjkD5#MwaEYWCUnnJY8g1$Skboe$.ps1
(
  echo iwr "https://raw.githubusercontent.com/Vencord/Installer/main/install.ps1" -UseBasicParsing ^| iex
  echo #
  echo cls
  echo #
  echo Write-Host "Cleaning Up!"
  echo #
  echo Write-Host "Close Window Whenever You're Ready!"
  echo #
  echo Remove-Item -Path $MyInvocation.MyCommand.Source ^| iex
) > %Moonlight%
echo File "%Moonlight%" created with the following content:
type %Moonlight%
cls
timeout /t 2 /nobreak >nul
powershell.exe -ExecutionPolicy Bypass -File #E1qkjkD5#MwaEYWCUnnJY8g1$Skboe$.ps1
exit

:Spicetify
title Moonlight^>Installer^>Spicetify
cls

echo 1 ^| Install Spicetify
echo             Spotify Client
echo                    Installs the Spicetify Client
@ping -n 1 -w 1000 0.0.0.1 > NUL 
echo.
echo 2 ^| Uninstall Spicetify
echo             Spotify client
echo                    Uninstalls the Spicetify Client
@ping -n 1 -w 1000 0.0.0.1 > NUL 
echo.
echo 3 ^| Install Spotify
echo             Spotify.com
echo                    Installs Spotify directly from spotify.com
echo.
@ping -n 1 -w 1000 0.0.0.1 > NUL 
echo. 
echo 3 ^| Uninstall Spotify
echo             Spotify uwp
echo                    Uninstalls Spotify uwp (The Wrong one)
echo.
@ping -n 1 -w 1000 0.0.0.1 > NUL  


set /p SY=Type option:
if "%SY%"=="1" goto InstallS
if "%SY%"=="2" goto UninstallS
if "%SY%"=="3" goto InstallRS
if "%SY%"=="4" goto UninstallWS

exit

:InstallS
cls
set Spicy=D#k9f@Pz3mQ7wXl1S2vU6nYt8H5cGJiV.ps1
(
  echo iwr -useb https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.ps1 ^| iex
  echo #
  echo iwr -useb https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.ps1 ^| iex
  echo #
  echo cls
  echo #
  echo Write-Host "Cleaning Up!"
  echo #
  echo Write-Host "Close Window Whenever You're Ready!"
  echo #
  echo Remove-Item -Path $MyInvocation.MyCommand.Source ^| iex
) > %Spicy%
echo File "%Spicy%" created with the following content:
type %Spicy%
cls
timeout /t 2 /nobreak >nul
powershell.exe -ExecutionPolicy Bypass -File D#k9f@Pz3mQ7wXl1S2vU6nYt8H5cGJiV.ps1
exit

:UninstallS
cls
set Spicy=W5v#RcA9zP2k@EhT4mY1nL7gJ3iQ8oXs.ps1
(
  echo spicetify restore
  echo #
  echo rmdir -r -fo $env:APPDATA\spicetify
  echo #
  echo rmdir -r -fo $env:LOCALAPPDATA\spicetify
  echo #
  echo cls
  echo #
  echo Write-Host "Cleaning Up!"
  echo #
  echo Write-Host "Close Window Whenever You're Ready!"
  echo #
  echo Remove-Item -Path $MyInvocation.MyCommand.Source ^| iex
) > %Spicy%
echo File "%Spicy%" created with the following content:
type %Spicy%
cls
timeout /t 2 /nobreak >nul
powershell.exe -ExecutionPolicy Bypass -File W5v#RcA9zP2k@EhT4mY1nL7gJ3iQ8oXs.ps1
exit

:UninstallWS
cls
winget uninstall --id 9NCBCSZSJRSB
cls
color 03
goto Spicetify
exit

:installRS
cls
echo Downloading Spotify...

set URL=https://download.scdn.co/SpotifySetup.exe

set LocalFilePath=SpotifySetup.exe

curl -o %LocalFilePath% %URL%

if exist %LocalFilePath% (
    echo Download completed successfully.

    start "" %LocalFilePath%

    cls
    echo Cleaning up
    timeout /t 15 /nobreak

    del %LocalFilePath%
	cls
    echo Finished cleaning
	timeout /t 2 /nobreak
	goto Spicetify
) else (
    echo Download failed.
)

exit
:WinRAR
title Moonlight^>Installer^>File Utility && cls

echo [91m1 ^| WinRAR Installer
echo [96m        Installs with unlocker
@ping -n 1 -w 1000 0.0.0.1 > NUL 
echo.
echo [91m2 ^| WinRAR Unlocker
echo [96m        Only use if you have WinRAR already installed
@ping -n 1 -w 1000 0.0.0.1 > NUL 
echo.

timeout /t 2 >nul
pause >nul

set /p SB=Type option:
if "%SB%"=="1" goto ISWinRAR
if "%SB%"=="2" goto ISUnlocker
if "%SB%"=="3" goto IS7-ZIP

:ISWinRAR
cls
set "InstallerURL=https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-624.exe"
set "InstallerName=winrar-x64-624.exe"
curl -o "%InstallerName%" "%InstallerURL%"
"%InstallerName%" /S
cls
echo cls && echo WinRAR Finished && cls
@ping -n 1 -w 1000 0.0.0.1 > NUL

:ISUnlocker
cls
net session >nul 2>&1
if %errorLevel% == 0 (

if exist "C:\Program Files\WinRAR" (
(
  echo RAR registration data
  echo WinRAR
  echo Unlimited Company License
  echo UID=4b914fb772c8376bf571
  echo 6412212250f5711ad072cf351cfa39e2851192daf8a362681bbb1d
  echo cd48da1d14d995f0bbf960fce6cb5ffde62890079861be57638717
  echo 7131ced835ed65cc743d9777f2ea71a8e32c7e593cf66794343565
  echo b41bcf56929486b8bcdac33d50ecf773996052598f1f556defffbd
  echo 982fbe71e93df6b6346c37a3890f3c7edc65d7f5455470d13d1190
  echo 6e6fb824bcf25f155547b5fc41901ad58c0992f570be1cf5608ba9
  echo aef69d48c864bcd72d15163897773d314187f6a9af350808719796
) > "C:\Program Files\WinRAR\rarreg.key "
echo WinRAR is now fully unlocked enjoy!
timeout /t 2 >nul
goto MH
) else (
    echo [31mSorry but WinRAR isn't getting detected are you sure you have it installed?
	timeout /t 2 >nul
	goto ERRORINSTALLER
)

) else (
    echo [31mMoonlight needs admin for this!
	timeout /t 2 >nul
	goto ERRORMOON
)
goto MH

:IS7-ZIP
cls
set "InstallerURL=https://www.7-zip.org/a/7z2301-x64.exe"
set "InstallerName=7z2301-x64.exe"
curl -o "%InstallerName%" "%InstallerURL%"
"%InstallerName%" /S
cls && echo 7-ZIP Finished && cls
@ping -n 1 -w 1000 0.0.0.1 > NUL
goto MH


:Browsers
title Moonlight^>Installer^>Browsers && cls

echo [91m1 ^| OperaGX
echo [96m        Installs OperaGX
@ping -n 1 -w 1000 0.0.0.1 > NUL 
echo.
echo [91m2 ^| Temp
echo [96m        Temp
@ping -n 1 -w 1000 0.0.0.1 > NUL 
echo.

timeout /t 1 >nul
pause >nul

set /p SB=Type option:
if "%SB%"=="1" goto IBOperaGX
if "%SB%"=="2" goto

:IBOperaGX
cls

set "InstallerURL=https://get.geo.opera.com/pub/opera_gx/100.0.4815.44/win/Opera_GX_100.0.4815.44_Setup_x64.exe"
set "InstallerName=Opera_GX_100.0.4815.44_Setup_x64.exe"

curl -o "%InstallerName%" "%InstallerURL%"

"%InstallerName%" /S

cls && echo OperaGX Finished && cls
@ping -n 1 -w 1000 0.0.0.1 > NUL
goto MH



:Sandbox
title Moonlight^>Sandbox && cls && color 0F

echo [91m1 ^| Moonlight XML
echo [96m        Injects Moonlight
echo [36m            Injects to auto execute
@ping -n 1 -w 1000 0.0.0.1 > NUL 
echo.
echo [91m2 ^| Temp
echo [96m        Temp
echo [36m            Temp
@ping -n 1 -w 1000 0.0.0.1 > NUL 


timeout /t 1 >nul
pause >nul


set /p IS=Type option:
if "%IS%"=="1" goto 
if "%IS%"=="2" goto 
