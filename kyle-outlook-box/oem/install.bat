@echo off
REM Runs once, at the end of the unattended Windows install (dockur/windows OEM hook).
REM Installs the new Outlook for Windows from Microsoft's official bootstrapper
REM (https://learn.microsoft.com/microsoft-365-apps/outlook/get-started/deployment-new-outlook)

set LOG=C:\OEM\install-log.txt
echo [%date% %time%] Downloading new Outlook installer... >> %LOG%

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$ProgressPreference='SilentlyContinue'; Invoke-WebRequest -Uri 'https://go.microsoft.com/fwlink/?linkid=2207851' -OutFile 'C:\OEM\OutlookSetup.exe'" >> %LOG% 2>&1

if not exist C:\OEM\OutlookSetup.exe (
  echo [%date% %time%] Download failed. Install Outlook manually from the link above. >> %LOG%
  exit /b 0
)

echo [%date% %time%] Installing new Outlook for all users... >> %LOG%
C:\OEM\OutlookSetup.exe --provision true --quiet --start- >> %LOG% 2>&1
echo [%date% %time%] Done (exit code %errorlevel%). >> %LOG%

REM Light trims: no hibernation file, balanced power plan never sleeps
powercfg /hibernate off >> %LOG% 2>&1
powercfg /change standby-timeout-ac 0 >> %LOG% 2>&1

exit /b 0
