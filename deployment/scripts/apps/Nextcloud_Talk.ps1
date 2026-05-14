# Automate the install of Nextcloud Talk.
# Script made by Mattias Magnusson 2026-05-14
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$tp = "C:\TempPath" 
mkdir $tp -EA SilentlyContinue
$owner = "nextcloud-releases"
$repo = "talk-desktop"
$latestRelease = Invoke-RestMethod -Uri "https://api.github.com/repos/$owner/$repo/releases/latest"
$asset = $latestRelease.assets | Where-Object { $_.name -like "Nextcloud.Talk-windows-x64.msi" } | Select-Object -First 1
$assetUrl = $asset.browser_download_url
$installerPath = "$tp\$($asset.name)"
Invoke-WebRequest -Uri $assetUrl -OutFile $installerPath
Start-Process msiexec.exe -Wait -ArgumentList "/norestart /i $installerPath /qn"
Start-Sleep -Seconds 10
del $installerPath -Force
