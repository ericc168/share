# Create temp folder for downloading installers
md -Path $env:temp\installers -erroraction SilentlyContinue | Out-Null
# Install Chrome
# Define the download URL and the installer
$chromeUrl = "https://dl.google.com/chrome/install/latest/chrome_installer.exe"
$installer = join-path $env:temp\installers chrome_installer.exe

# Download Google Chrome installer
Invoke-WebRequest -Uri $chromeUrl -OutFile $installer

# Install Google Chrome silently
Start-Process -FilePath $installer -ArgumentList "/silent /install" -Wait

# Remove the installer after installation finished
# Remove-Item $installer

# Install Edge Browser
[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
$Download = join-path $env:temp\install MicrosoftEdgeEnterpriseX64.msi
$edgeUrl = "http://go.microsoft.com/fwlink/?LinkID=2093437"
# the URL comes from https://techcommunity.microsoft.com/t5/discussions/official-download-links-for-microsoft-edge-stable-enterprise/m-p/1082549
Invoke-WebRequest -Uri $edgeUrl  -OutFile $Download
Start-Process "$Download" -ArgumentList "/quiet"
# placeholder for "enter" autokeyhit
