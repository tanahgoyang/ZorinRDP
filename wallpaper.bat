@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
echo Finding Admin Access!
goto UACPrompt
) else ( goto MeetAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:MeetAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
CD /D "%~dp0"
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName /v ComputerName /t REG_SZ /d ZorinRDP /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ActiveComputerName\ /v ComputerName /t REG_SZ /d ZorinRDP /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\ /v Hostname /t REG_SZ /d ZorinRDP /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\ /v "AD Host" /t REG_SZ /d ZorinRDP /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation /v Manufacturer /t REG_SZ /d "AdHost" /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation /v Model /t REG_SZ /d "AdHost Virtual Machine" /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation /v SupportURL /t REG_SZ /d "https://github.com/ZorinArch/ZorinRDP/issues" /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarSmallIcons /t REG_DWORD /d 1 /f
powershell -Command "& {Invoke-WebRequest https://github.com/ZorinArch/ZorinRDP/blob/main/wallpaper.png}"
@D:\a\wallpaper\wallpaper.exe D:\a\wallpaper\wallpaper.png /timer:0
@RD /S /Q wallpaper
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
taskkill /f /im explorer.exe
start explorer.exe
