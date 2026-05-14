# Automate the install of Nextcloud Talk.
# Script made by Mattias Magnusson 2026-05-14
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$tp = "C:\TempPath" 
$Installer = "Nextcloud.Talk-windows-x64.msi"
mkdir $tp -EA SilentlyContinue
$Url = "https://github.com/nextcloud-releases/talk-desktop/releases/latest/download/Nextcloud.Talk-windows-x64.msi"
Invoke-WebRequest -Uri $Url -OutFile $tp\$Installer
Start-Process msiexec.exe -Wait -ArgumentList "/norestart /i $tp\$Installer /qn"
Start-Sleep -Seconds 30
del $tp\$Installer
